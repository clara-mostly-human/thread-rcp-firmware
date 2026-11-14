"""Tests for cpc.py (and probe.py) against a simulated secondary. No hardware involved."""

from __future__ import annotations

import asyncio
import contextlib
import fcntl
import functools
import os
import random
import struct
import termios
import time

import pytest

import cpc
import probe
from sim_secondary import (EchoApp, FakeEzsp, FakeHci, SimSecondary, build_frame, crc_xmodem,
                           make_link, ST_CONNECTED, REJ_CHECKSUM, REJ_SEQUENCE)


def async_test(fn):
    @functools.wraps(fn)
    def wrapper(*args, **kwargs):
        async def guarded():
            async with asyncio.timeout(30):
                return await fn(*args, **kwargs)
        return asyncio.run(guarded())
    return wrapper


FAST = dict(initial_rto=0.05, uframe_timeout=0.2, uframe_retries=3, command_timeout=2.0)


@contextlib.asynccontextmanager
async def link(start=True, reset=True, host_kwargs=None, **sim_kwargs):
    (hr, hw), (sr, sw) = make_link()
    sim = SimSecondary(**sim_kwargs)
    sim.start(sr, sw)
    host = cpc.CpcPrimary(hr, hw, **{**FAST, **(host_kwargs or {})})
    try:
        if start:
            await host.start(reset=reset)
        yield host, sim
    finally:
        await host.close()
        await sim.stop()
    assert sim.errors == [], sim.errors


# --------------------------------------------------------------------------------------------
# CRC and codec
# --------------------------------------------------------------------------------------------

# Produced by compiling the SDK's own src/sl_cpc_crc.c (both the bitwise and the
# SL_CPC_USE_PRE_HASHED_CRC_TABLE variant) in a scratch harness and running it.
SDK_CRC_KAT = [
    (b"123456789", 0x31C3),
    (b"", 0x0000),
    (bytes.fromhex("14000000f1"), 0x7262),          # header of reset-seq on EP0
    (bytes.fromhex("14000000ce"), 0xB5DE),          # header of unnumbered-ack on EP0
    (bytes.fromhex("1405000081"), 0xB0B0),          # header of RR ack=1 on EP5
    (bytes.fromhex("0200040001000000"), 0xFFB3),    # PROP_VALUE_GET PROTOCOL_VERSION, seq 0
    (bytes.fromhex("14000a00c4"), 0xD355),          # header of a 8-byte U poll on EP0
    (b"\x01", 0x1021),
    (b"\xff\xff\xff\xff", 0x99CF),
]


@pytest.mark.parametrize("data,expected", SDK_CRC_KAT)
def test_crc_known_answers(data, expected):
    assert cpc.crc16(data) == expected
    assert crc_xmodem(data) == expected


def test_crc_table_matches_sdk_lut_and_bitwise():
    # First and last rows of crc16_xmodem_lut, src/sl_cpc_crc.c:62,93
    assert cpc._CRC_TABLE[:8] == (0x0000, 0x1021, 0x2042, 0x3063, 0x4084, 0x50A5, 0x60C6, 0x70E7)
    assert cpc._CRC_TABLE[-8:] == (0x6E17, 0x7E36, 0x4E55, 0x5E74, 0x2E93, 0x3EB2, 0x0ED1, 0x1EF0)
    rng = random.Random(1)
    for _ in range(200):
        data = bytes(rng.randrange(256) for _ in range(rng.randrange(0, 300)))
        assert cpc.crc16(data) == crc_xmodem(data)


def test_encode_header_layout():
    # U-frame reset-seq on EP0, no payload: length 0 and no FCS
    assert cpc.encode_frame(0, cpc.control_u(cpc.U_RESET_SEQ)) == bytes.fromhex("14000000f16272")
    assert cpc.control_u(cpc.U_ACKNOWLEDGE) == 0xCE
    assert cpc.control_u(cpc.U_POLL_FINAL) == 0xC4
    # Payload: length counts the 2 FCS bytes; HCS and FCS little endian
    body = bytes.fromhex("0200040001000000")
    frame = cpc.encode_frame(0, 0xC4, body)
    assert frame == bytes.fromhex("14000a00c455d3") + body + bytes.fromhex("b3ff")
    assert frame == build_frame(0, 0xC4, body)
    # I-frame control: seq bits 6-4, P/F bit 3, ack bits 2-0
    assert cpc.control_i(5, 3, True) == 0b0101_1011
    assert cpc.control_s(1, cpc.S_RR) == 0x81
    assert cpc.control_s(2, cpc.S_REJ) == 0x92


def test_frame_fields():
    f = cpc.Frame(5, cpc.control_i(6, 2, True), b"x")
    assert (f.kind, f.seq, f.ack, f.poll_final) == (cpc.FRAME_I, 6, 2, True)   # seq 6 sets bit 6
    assert cpc.Frame(5, 0x93, b"\x01").kind == cpc.FRAME_S
    assert cpc.Frame(5, 0x93, b"\x01").s_function == cpc.S_REJ
    assert cpc.Frame(0, 0xCE).u_type == cpc.U_ACKNOWLEDGE
    assert cpc.Frame(0, 0xC4).u_type == cpc.U_POLL_FINAL
    assert cpc.Frame(0, 0xF1).u_type == cpc.U_RESET_SEQ
    assert cpc.Frame(0, 0xC0).u_type == cpc.U_INFORMATION


def test_decode_roundtrip_and_split_feeds():
    frames = [(0, 0xCE, b""), (5, cpc.control_i(1, 2), b"hello"), (14, 0x81, b""),
              (0, 0xC4, bytes(range(200)))]
    stream = b"".join(build_frame(*f) for f in frames)
    dec = cpc.FrameDecoder()
    out = []
    for i in range(len(stream)):            # byte by byte
        out += dec.feed(stream[i:i + 1])
    assert [(f.address, f.control, f.payload) for f in out] == frames
    assert all(f.fcs_ok for f in out)
    assert dec.discarded_bytes == 0


def test_decode_resyncs_on_garbage():
    good1 = build_frame(5, cpc.control_i(0, 0), b"abc")
    good2 = build_frame(0, 0xC0, b"\x06\x00\x08\x00" + bytes(8))
    fake_header = bytes([0x14, 0x05, 0x03, 0x00, 0x00, 0x12, 0x34])     # flag but bad HCS
    truncated = good1[:9]                                                # cut-off frame
    stream = (b"\x00\xff\x14\x14\x7e" + fake_header + good1 + b"\x14" + truncated
              + b"\x55" * 3 + good2 + b"\x14\x00")
    dec = cpc.FrameDecoder()
    out = dec.feed(stream)
    good = [(f.address, f.payload) for f in out if f.fcs_ok]
    assert good == [(5, b"abc"), (0, good2[7:-2])]
    # The truncated frame's header is valid, so its length is trusted: it swallows the next
    # 5 bytes and comes out as one frame with a bad FCS (which an I-frame answers with a
    # checksum reject), without costing the good frame after it.
    bad = [f for f in out if not f.fcs_ok]
    assert len(bad) == 1 and bad[0].address == 5 and bad[0].payload == b"abU"
    assert dec.header_errors > 0
    assert dec.discarded_bytes > 0


def test_decode_bad_fcs_is_reported_and_consumed():
    bad = bytearray(build_frame(5, cpc.control_i(3, 0), b"payload"))
    bad[8] ^= 0x01
    good = build_frame(5, 0x81)
    out = cpc.FrameDecoder().feed(bytes(bad) + good)
    assert len(out) == 2
    assert out[0].fcs_ok is False and out[0].seq == 3
    assert out[1].fcs_ok and out[1].control == 0x81


def test_decode_rejects_impossible_lengths():
    # A header with a valid HCS but length 1 or 2 cannot be a frame (sl_cpc.c:3625-3633)
    hdr = bytes([0x14, 0x05, 0x02, 0x00, 0x00])
    raw = hdr + cpc.crc16(hdr).to_bytes(2, "little") + build_frame(5, 0x81)
    out = cpc.FrameDecoder().feed(raw)
    assert [f.control for f in out] == [0x81]


# --------------------------------------------------------------------------------------------
# Reset sequence and properties
# --------------------------------------------------------------------------------------------

@async_test
async def test_full_reset_sequence():
    async with link(start=False, app_version="zigbee-ble 0.1", rx_capability=256,
                    capabilities=0) as (host, sim):
        info = await host.start(reset=True)
        assert info.protocol_version == 6
        assert info.cpc_version == (4, 7, 1)
        assert info.app_version == "zigbee-ble 0.1"
        assert info.capabilities == 0
        assert info.rx_capability == 256
        assert info.reset_reason == cpc.Status.RESET_SOFTWARE
        assert host.max_tx_payload == 256
        assert sim.reboots == 1
        assert sim.reset_sequence_done
        assert sim.primary_version == bytes(cpc.HOST_VERSION)
        # Order and frame types as sent: everything is a U-frame poll
        assert sim.commands == [
            ("U", cpc.Cmd.PROP_VALUE_SET, cpc.Prop.BOOTLOADER_REBOOT_MODE),
            ("U", cpc.Cmd.RESET, None),
            ("U", cpc.Cmd.PROP_VALUE_GET, cpc.Prop.PROTOCOL_VERSION),
            ("U", cpc.Cmd.PROP_VALUE_GET, cpc.Prop.CAPABILITIES),
            ("U", cpc.Cmd.PROP_VALUE_GET, cpc.Prop.RX_CAPABILITY),
            ("U", cpc.Cmd.PROP_VALUE_GET, cpc.Prop.SECONDARY_CPC_VERSION),
            ("U", cpc.Cmd.PROP_VALUE_SET, cpc.Prop.PRIMARY_VERSION_VALUE),
            ("U", cpc.Cmd.PROP_VALUE_GET, cpc.Prop.SECONDARY_APP_VERSION),
        ]
        # reset-seq was sent after the reboot and acknowledged
        resets = [f for f in sim.rx_log if f.control == 0xF1]
        assert resets and sim.tx_log.count((0, 0xCE, b"")) >= 1
        # The reboot garbage did not confuse the host
        assert host.decoder.discarded_bytes >= 1


@async_test
async def test_start_without_reset_ignores_stale_boot_reason():
    async with link(start=False) as (host, sim):
        host._ensure_reader()
        sim.send_reset_reason(cpc.Status.RESET_POWER_ON)     # boot message from before we started
        await asyncio.sleep(0.02)
        info = await host.start(reset=False)
        assert sim.reboots == 0
        assert info.protocol_version == 6
        assert ("U", cpc.Cmd.RESET, None) not in sim.commands
        assert host._dead is None


@async_test
async def test_reset_recovers_when_reset_reply_is_lost():
    async with link(start=False) as (host, sim):
        # Drop the U poll/final reply to RESET: the reboot still happens and must be accepted
        # without a second RESET.
        sim.drop_to_host(lambda a, c, p: c == 0xC4 and p[:1] == b"\x01")
        info = await host.start(reset=True)
        assert sim.reboots == 1
        assert [c for c in sim.commands if c[1] == cpc.Cmd.RESET] == [("U", cpc.Cmd.RESET, None)]
        assert info.reset_reason == cpc.Status.RESET_SOFTWARE


@async_test
async def test_uframe_poll_retried_after_loss():
    async with link(start=False) as (host, sim):
        sim.drop_from_host(lambda f: f.control == 0xC4, count=1)
        await host.start(reset=False)
        assert len(sim.dropped_rx) == 1


@async_test
async def test_property_get_set_as_iframes():
    async with link(security_state=None) as (host, sim):
        value = await host.get_property(cpc.Prop.RX_CAPABILITY)          # I-frame with P/F
        assert value == struct.pack("<H", 256)
        assert sim.commands[-1] == ("I", cpc.Cmd.PROP_VALUE_GET, cpc.Prop.RX_CAPABILITY)
        i_polls = [f for f in sim.rx_log if f.ftype == "I" and f.addr == 0]
        assert i_polls and all(f.pf for f in i_polls)
        await host.noop()
        assert sim.commands[-1] == ("I", cpc.Cmd.NOOP, None)
        assert await host.get_endpoint_state(5) == cpc.EpState.OPEN
        with pytest.raises(cpc.CpcPropertyError) as e:
            await host.get_property(0x7777)
        assert e.value.status == cpc.Status.PROP_NOT_FOUND
        with pytest.raises(cpc.CpcPropertyError) as e:
            await host.get_security_state()
        assert e.value.status == cpc.Status.UNIMPLEMENTED
        with pytest.raises(cpc.CpcPropertyError) as e:
            await host.set_property(cpc.Prop.PROTOCOL_VERSION, b"\x07")
        assert e.value.status == cpc.Status.INVALID_COMMAND_FOR_PROP


@async_test
async def test_security_state_reported():
    async with link(security_state=cpc.SecurityState.INITIALIZING,
                    capabilities=cpc.Capability.SECURITY_ENDPOINT) as (host, sim):
        assert await host.get_security_state() == cpc.SecurityState.INITIALIZING
        assert host.info.capability_names == ["SECURITY_ENDPOINT"]


# --------------------------------------------------------------------------------------------
# Endpoints
# --------------------------------------------------------------------------------------------

@async_test
async def test_endpoint_connect():
    async with link() as (host, sim):
        ep = await host.connect_endpoint(5)
        assert ep.connected
        await asyncio.sleep(0.01)               # let our RR for the reply reach the sim
        assert sim.eps[5].state == ST_CONNECTED
        sets = [c for c in sim.commands if c[2] == 0x1005]
        assert sets == [("I", cpc.Cmd.PROP_VALUE_SET, 0x1005)]
        # the value is one byte, SL_CPC_STATE_CONNECTED = 5
        req = [f for f in sim.rx_log if f.addr == 0 and f.ftype == "I"][-1]
        assert req.payload[4:] == struct.pack("<I", 0x1005) + b"\x05"


@async_test
async def test_endpoint_connect_refused():
    async with link(endpoints=(5,)) as (host, sim):
        t0 = time.monotonic()
        with pytest.raises(cpc.CpcEndpointError, match="refused endpoint 14"):
            await host.connect_endpoint(14, timeout=0.5)
        assert time.monotonic() - t0 < 2
        assert 14 not in host._endpoints


@async_test
async def test_endpoint_connect_waits_for_late_open():
    async with link(endpoints=(), closed_endpoints=(5,)) as (host, sim):
        asyncio.get_running_loop().call_later(0.15, sim.open_endpoint, 5)
        ep = await host.connect_endpoint(5, timeout=3, retry_interval=5)
        assert ep.connected       # woken by the unsolicited OPEN notification, not the 5 s retry


@async_test
async def test_write_read_with_acks_and_seq_wrap():
    echo = EchoApp()
    async with link(apps={5: echo}) as (host, sim):
        ep = await host.connect_endpoint(5)
        for i in range(20):                       # wraps the 3-bit sequence numbers twice
            msg = f"msg{i}".encode()
            await ep.write(msg)
            assert await ep.read(timeout=1) == b"echo:" + msg
        await asyncio.sleep(0.01)                 # let the last RR reach the simulator
        assert echo.received == [f"msg{i}".encode() for i in range(20)]
        assert ep.stats.retransmits == 0 and sim.retransmits == 0
        data = [f for f in sim.rx_log if f.addr == 5 and f.ftype == "I"]
        assert [f.seq for f in data] == [i % 8 for i in range(20)]
        # each host I-frame acknowledges every reply received before it
        assert [f.ack for f in data] == [i % 8 for i in range(20)]
        # the host acknowledged every reply with an RR
        rrs = [f for f in sim.rx_log if f.addr == 5 and f.ftype == "S"]
        assert [f.ack for f in rrs] == [(i + 1) % 8 for i in range(20)]


@async_test
async def test_write_respects_rx_capability():
    async with link(rx_capability=64, apps={5: EchoApp()}) as (host, sim):
        ep = await host.connect_endpoint(5)
        with pytest.raises(ValueError, match="RX capability"):
            await ep.write(b"x" * 65)
        await ep.write(b"x" * 64)
        assert await ep.read(timeout=1) == b"echo:" + b"x" * 64


# --------------------------------------------------------------------------------------------
# Loss, retransmission, rejects
# --------------------------------------------------------------------------------------------

@async_test
async def test_retransmit_after_dropped_frame():
    echo = EchoApp()
    async with link(apps={5: echo}) as (host, sim):
        ep = await host.connect_endpoint(5)
        sim.drop_from_host(lambda f: f.addr == 5 and f.ftype == "I")
        t0 = time.monotonic()
        await ep.write(b"once")
        assert time.monotonic() - t0 >= FAST["initial_rto"] * 0.9
        assert await ep.read(timeout=1) == b"echo:once"
        assert ep.stats.retransmits == 1
        assert echo.received == [b"once"]          # delivered exactly once


@async_test
async def test_retransmit_after_lost_ack_is_deduplicated_by_secondary():
    echo = EchoApp()
    async with link(apps={5: echo}) as (host, sim):
        ep = await host.connect_endpoint(5)
        # Lose the RR and the echo (which also carries the ack) once each
        sim.drop_to_host(lambda a, c, p: a == 5 and c & 0xC0 == 0x80)
        sim.drop_to_host(lambda a, c, p: a == 5 and c >> 6 in (0, 1))
        await ep.write(b"dup?")
        assert await ep.read(timeout=2) == b"echo:dup?"
        assert ep.stats.retransmits >= 1
        assert sim.duplicates >= 1                 # sl_cpc.c:3913-3918 path
        assert echo.received == [b"dup?"]


@async_test
async def test_secondary_retransmits_and_host_deduplicates():
    async with link(apps={5: EchoApp()}) as (host, sim):
        ep = await host.connect_endpoint(5)
        # Our RR for the echo is lost: the secondary retransmits, the host must ack again and
        # deliver the payload once.
        sim.drop_from_host(lambda f: f.addr == 5 and f.ftype == "S")
        await ep.write(b"a")
        assert await ep.read(timeout=1) == b"echo:a"
        await asyncio.sleep(0.3)
        assert sim.retransmits >= 1
        assert ep.stats.rx_duplicates >= 1
        assert ep.read_nowait() is None
        assert sim.eps[5].unacked is None


@async_test
async def test_checksum_reject_triggers_immediate_retransmit():
    echo = EchoApp()
    async with link(apps={5: echo}, host_kwargs={"initial_rto": 2.0}) as (host, sim):
        ep = await host.connect_endpoint(5)
        sim.corrupt_from_host(lambda f: f.addr == 5 and f.ftype == "I")
        t0 = time.monotonic()
        await ep.write(b"crc")
        assert time.monotonic() - t0 < 1.0         # well before the 2 s retransmit timer
        assert (5, REJ_CHECKSUM) in sim.rejects_sent
        assert ep.stats.rejects_received == 1 and ep.stats.retransmits == 1
        assert await ep.read(timeout=1) == b"echo:crc"


@async_test
async def test_host_rejects_corrupted_iframe_and_secondary_resends():
    async with link(apps={5: EchoApp()}) as (host, sim):
        ep = await host.connect_endpoint(5)
        sim.corrupt_to_host(lambda a, c, p: a == 5 and c >> 6 in (0, 1))
        await ep.write(b"z")
        assert await ep.read(timeout=1) == b"echo:z"
        rejs = [f for f in sim.rx_log if f.addr == 5 and f.control & 0xF0 == 0x90]
        assert rejs and rejs[0].payload == bytes([REJ_CHECKSUM])
        assert sim.retransmits >= 1
        assert host.decoder.fcs_errors == 1


@async_test
async def test_host_rejects_sequence_mismatch():
    async with link() as (host, sim):
        ep = await host.connect_endpoint(5)
        sim.send_iframe_raw(5, seq=4, payload=b"out of order")   # host expects seq 0
        await asyncio.sleep(0.05)
        rejs = [f for f in sim.rx_log if f.addr == 5 and f.control & 0xF0 == 0x90]
        assert rejs and rejs[0].payload == bytes([REJ_SEQUENCE]) and rejs[0].ack == 0
        assert ep.read_nowait() is None


@async_test
async def test_fatal_reject_security_issue():
    async with link(security_rejects=True, security_state=2) as (host, sim):
        ep = await host.connect_endpoint(5)
        with pytest.raises(cpc.CpcRejectError, match="SECURITY_ISSUE") as e:
            await ep.write(b"ezsp")
        assert "cpc_security_secondary_none" in str(e.value)
        with pytest.raises(cpc.CpcRejectError):
            await ep.read(timeout=0.1)
        with pytest.raises(cpc.CpcRejectError):
            await ep.write(b"again")
        # the system endpoint keeps working
        assert await host.get_endpoint_state(5) == cpc.EpState.CONNECTED


@async_test
async def test_retransmit_exhaustion_fails_endpoint():
    async with link(host_kwargs={"initial_rto": 0.01, "max_rto": 0.02, "max_retransmits": 3}) as (host, sim):
        ep = await host.connect_endpoint(5)
        sim.drop_from_host(lambda f: f.addr == 5, count=100)
        with pytest.raises(cpc.CpcTimeoutError, match="3 retransmissions"):
            await ep.write(b"void")
        assert len([f for f in sim.dropped_rx if f.addr == 5]) == 4
        assert ep.error is not None


@async_test
async def test_unexpected_secondary_reset_fails_everything():
    async with link() as (host, sim):
        ep = await host.connect_endpoint(5)
        sim.send_reset_reason(cpc.Status.RESET_WATCHDOG)
        with pytest.raises(cpc.CpcConnectionLost, match="RESET_WATCHDOG"):
            await ep.read(timeout=1)
        with pytest.raises(cpc.CpcConnectionLost):
            await host.get_property(cpc.Prop.RX_CAPABILITY)


@async_test
async def test_frames_on_unconnected_endpoint_are_rejected():
    async with link() as (host, sim):
        sim.send_raw(build_frame(14, 0x00, b"stray"))
        await asyncio.sleep(0.05)
        rejs = [f for f in sim.rx_log if f.addr == 14 and f.control & 0xF0 == 0x90]
        assert rejs and rejs[0].payload == bytes([cpc.Reject.UNREACHABLE_ENDPOINT])


@async_test
async def test_transport_eof_is_reported():
    async with link() as (host, sim):
        ep = await host.connect_endpoint(5)
        sim._writer.close()
        with pytest.raises(cpc.CpcConnectionLost, match="end of stream"):
            await ep.read(timeout=1)


# --------------------------------------------------------------------------------------------
# probe.py against the simulator
# --------------------------------------------------------------------------------------------

def test_ezsp_frames():
    assert probe.ezsp_frame(0, 0, b"\x04", legacy=True) == bytes.fromhex("00000004")
    assert probe.ezsp_frame(1, 0, b"\x12", legacy=False) == bytes.fromhex("010001000012")
    legacy = probe.ezsp_parse(bytes.fromhex("0080001202" "0081"))
    assert (legacy.extended, legacy.frame_id, legacy.params) == (False, 0, bytes.fromhex("12020081"))
    ext = probe.ezsp_parse(bytes.fromhex("01800100001202" "0081"))
    assert (ext.extended, ext.frame_id, ext.frame_control) == (True, 0, 0x0180)
    assert probe.format_stack_version(0x8100) == "8.1.0.0"


def test_h4_reassembly():
    ev1 = bytes([0x04, 0x0E, 0x04, 0x01, 0x03, 0x0C, 0x00])
    acl = bytes([0x02, 0x01, 0x20, 0x03, 0x00]) + b"abc"
    ev2 = bytes([0x04, 0x3E, 0x01, 0x02])
    r = probe.H4Reassembler()
    stream = ev1 + acl + ev2
    out = []
    for chunk in (stream[:2], stream[2:9], stream[9:], b""):
        out += r.feed(chunk)
    assert out == [ev1, acl, ev2]


def test_le_advertising_report_parsing():
    stats = probe.ScanStats()
    # Two reports, fields grouped per Core spec: types, addr types, addrs, lens, data, rssi
    params = (bytes([0x02, 2, 0x00, 0x03, 0x00, 0x01]) + bytes(6) + b"\x01" * 6
              + bytes([1, 0]) + b"\x99" + bytes([0xC0, 0xC1]))
    probe.parse_le_meta(bytes([0x04, 0x3E, len(params)]) + params, stats)
    assert stats.reports == 2 and len(stats.addresses) == 2 and stats.malformed == 0


@pytest.mark.parametrize("split", [False, True])
@async_test
async def test_probe_end_to_end(split):
    ezsp = FakeEzsp(protocol=18, stack_type=2, stack_version=0x8100)
    hci = FakeHci(addresses=4, interval=0.01, split_events=split)
    (hr, hw), (sr, sw) = make_link()
    sim = SimSecondary(apps={5: ezsp, 14: hci}, app_version="zigbee-ble-hci")
    sim.start(sr, sw)
    lines: list[str] = []
    try:
        rc = await probe.run_probe(hr, hw, reset=True, scan_seconds=0.4, timeout=2,
                                   out=lines.append, primary_kwargs=FAST)
    finally:
        await sim.stop()
    text = "\n".join(lines)
    assert rc == 0, text
    assert sim.errors == []
    assert ezsp.log == [("legacy", 4), ("extended", 0, b"\x12")]
    assert "protocolVersion=18 stackType=2 stackVersion=0x8100 (8.1.0.0)" in text
    assert "version(18), extended frame" in text
    assert "HCI version 0x0d (5.4)" in text and "Silicon Laboratories" in text
    assert hci.commands[:2] == [probe.HCI_RESET, probe.HCI_READ_LOCAL_VERSION]
    assert hci.scan_params == struct.pack("<BHHBB", 0, 160, 48, 0, 0)
    assert hci.commands[-1] == probe.HCI_LE_SET_SCAN_ENABLE
    assert hci.reports_sent > 5
    assert "distinct addresses: 4" in text
    assert "security state:   not built into the firmware" in text


@async_test
async def test_probe_reports_security_rejects():
    (hr, hw), (sr, sw) = make_link()
    sim = SimSecondary(apps={5: FakeEzsp(), 14: FakeHci()}, security_state=2,
                       security_rejects=True, capabilities=1)
    sim.start(sr, sw)
    lines: list[str] = []
    try:
        rc = await probe.run_probe(hr, hw, scan_seconds=0, timeout=1, out=lines.append,
                                   primary_kwargs=FAST)
    finally:
        await sim.stop()
    text = "\n".join(lines)
    assert rc == 1
    assert "security state:   INITIALIZING" in text
    assert text.count("SECURITY_ISSUE") >= 2


@async_test
async def test_probe_without_secondary():
    (hr, hw), _ = make_link()        # nobody answers
    lines: list[str] = []
    rc = await probe.run_probe(hr, hw, out=lines.append,
                               primary_kwargs={**FAST, "uframe_timeout": 0.05, "uframe_retries": 1})
    assert rc == 2
    assert "CPC link: FAILED" in lines[0]


# --------------------------------------------------------------------------------------------
# Serial adapter, exercised with a pipe-backed fake (no /dev access)
# --------------------------------------------------------------------------------------------

class PipeSerial:
    """Quacks like a non-blocking pyserial port; backed by two os.pipe()s."""

    def __init__(self) -> None:
        self.rx_r, self.rx_w = os.pipe()     # device -> host
        self.tx_r, self.tx_w = os.pipe()     # host -> device
        os.set_blocking(self.rx_r, False)
        self.closed = False

    def fileno(self) -> int:
        return self.rx_r

    @property
    def in_waiting(self) -> int:
        buf = fcntl.ioctl(self.rx_r, termios.FIONREAD, b"\0\0\0\0")
        return struct.unpack("i", buf)[0]

    def read(self, n: int) -> bytes:
        try:
            return os.read(self.rx_r, n)
        except BlockingIOError:
            return b""

    def write(self, data: bytes) -> int:
        return os.write(self.tx_w, data)

    def close(self) -> None:
        self.closed = True
        for fd in (self.rx_r, self.rx_w, self.tx_r, self.tx_w):
            os.close(fd)


@async_test
async def test_serial_streams_adapter():
    ser = PipeSerial()
    reader, writer = cpc.serial_streams(ser)
    frame = build_frame(0, 0xCE)
    os.write(ser.rx_w, frame[:3])
    os.write(ser.rx_w, frame[3:])
    got = b""
    while len(got) < len(frame):
        got += await asyncio.wait_for(reader.read(100), 1)
    assert got == frame
    writer.write(b"\x14abc")
    assert os.read(ser.tx_r, 10) == b"\x14abc"
    writer.close()
    assert ser.closed
