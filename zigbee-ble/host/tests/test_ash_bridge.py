"""The ASH bridge against bellows itself (the host side ZHA uses), over a simulated CPC chip."""

import asyncio
import contextlib
import logging

import pytest

import ash_bridge
import cpc
from sim_secondary import FakeEzsp, SimSecondary, make_link
from test_cpc import async_test

bellows_ash = pytest.importorskip("bellows.ash")
zigpy_config = pytest.importorskip("zigpy.config")
bellows_ezsp = pytest.importorskip("bellows.ezsp")

FAST = dict(initial_rto=0.05, uframe_timeout=0.2, uframe_retries=3, command_timeout=2.0)


class Ezsp18(FakeEzsp):
    """FakeEzsp plus the customFrame bellows sends to probe for XNCP: a stock NCP refuses it
    with a non-success status (customFrame reply = status + LVBytes, bellows
    ezsp/v4/commands.py; the status is a u32 sl_status_t from EZSP 14), which bellows takes
    as "no XNCP"."""

    def __call__(self, sim, ep_id, data):
        if len(data) >= 5 and data[2] & 0x03 == 0x01 and int.from_bytes(data[3:5], "little") == 0x0047:
            self.log.append(("extended", 0x0047, data[5:]))
            # EZSP 14+: status is sl_status_t (u32), here SL_STATUS_NOT_SUPPORTED, then LVBytes
            sim.send_data(ep_id, bytes([data[0], 0x80, 0x01, 0x47, 0x00, 0x0F, 0, 0, 0, 0x00]))
            return
        super().__call__(sim, ep_id, data)


def bellows_wire(frame) -> bytes:
    return bytes(bellows_ash.AshProtocol._stuff_bytes(frame.to_bytes())) + b"\x7e"


@pytest.mark.parametrize("ezsp", [b"", b"\x00\x00\x00\x04", bytes(range(256)) * 0 + bytes(range(200)),
                                  b"\x7e\x7d\x11\x13\x18\x1a" * 5])
@pytest.mark.parametrize("frm,ack,re_tx", [(0, 0, False), (5, 3, True), (7, 7, False)])
def test_data_frame_matches_bellows(ezsp, frm, ack, re_tx):
    ours = ash_bridge.data_frame(frm, ack, ezsp, re_tx=re_tx)
    theirs = bellows_wire(bellows_ash.DataFrame(frm_num=frm, re_tx=re_tx, ack_num=ack, ezsp_frame=ezsp))
    assert ours == theirs
    (decoded,) = ash_bridge.AshDecoder().feed(ours)
    assert ash_bridge.randomize(decoded[1:]) == ezsp


@pytest.mark.parametrize("ack", range(8))
def test_ack_nak_rstack_match_bellows(ack):
    assert ash_bridge.ack_frame(ack) == bellows_wire(bellows_ash.AckFrame(res=0, ncp_ready=0, ack_num=ack))
    assert ash_bridge.nak_frame(ack) == bellows_wire(bellows_ash.NakFrame(res=0, ncp_ready=0, ack_num=ack))
    assert ash_bridge.rstack_frame(0x0B) == bellows_wire(
        bellows_ash.RStackFrame(version=2, reset_code=0x0B))


def test_decoder_handles_bellows_rst_and_noise():
    rst = bytes([0x1A] * 32) + bellows_wire(bellows_ash.RstFrame())   # as bellows sends it
    dec = ash_bridge.AshDecoder()
    assert dec.feed(b"\x11garbage\x13\x1a" + rst) == [b"\xc0"]
    # SUBSTITUTE drops the frame in progress, a bad CRC gives None
    assert dec.feed(b"\x01\x02\x18\x03\x7e" + ash_bridge.ack_frame(2)) == [b"\x82"]
    assert dec.feed(b"\x82\x00\x00\x7e") == [None]


@contextlib.asynccontextmanager
async def bridge_with_sim(**ezsp_kwargs):
    sims: list[SimSecondary] = []
    apps: list[FakeEzsp] = []

    async def open_transport():
        # every open is a freshly booted chip
        (hr, hw), (sr, sw) = make_link()
        app = Ezsp18(**ezsp_kwargs)
        sim = SimSecondary(apps={5: app})
        sim.start(sr, sw)
        sims.append(sim)
        apps.append(app)
        return hr, hw

    bridge = ash_bridge.Bridge(open_transport, primary_kwargs=FAST, t_rx_ack=0.3)
    port = await bridge.start("127.0.0.1", 0)
    try:
        yield bridge, port, sims, apps
    finally:
        await bridge.close()
        for s in sims:
            await s.stop()


def device_config(port):
    return zigpy_config.SCHEMA_DEVICE({"path": f"socket://127.0.0.1:{port}"})


@async_test
async def test_bellows_connects_and_negotiates_version():
    async with bridge_with_sim(protocol=18, stack_version=0x8220) as (bridge, port, sims, apps):
        assert bridge.reboots == 1                       # booted at start, so the chip is fresh
        ezsp = bellows_ezsp.EZSP(device_config(port))
        await ezsp.connect(use_thread=False)
        try:
            assert ezsp.ezsp_version == 18
            assert bridge.reboots == 1                   # RST answered without another reboot
            # bellows' own legacy version(4), then version(18) extended, then its XNCP probe
            kinds = [entry[0] for entry in apps[-1].log]
            assert kinds[:2] == ["legacy", "extended"]
        finally:
            await ezsp.disconnect()
        # after the host leaves, the bridge reboots so the next start finds a fresh chip
        for _ in range(100):
            if bridge.reboots == 2:
                break
            await asyncio.sleep(0.02)
        assert bridge.reboots == 2

        ezsp2 = bellows_ezsp.EZSP(device_config(port))
        await ezsp2.connect(use_thread=False)
        try:
            assert ezsp2.ezsp_version == 18
            assert bridge.reboots == 2
        finally:
            await ezsp2.disconnect()


@async_test
async def test_second_host_is_refused_while_one_is_connected():
    async with bridge_with_sim() as (bridge, port, sims, apps):
        ezsp = bellows_ezsp.EZSP(device_config(port))
        await ezsp.connect(use_thread=False)
        try:
            reader, writer = await asyncio.open_connection("127.0.0.1", port)
            assert await asyncio.wait_for(reader.read(), 2) == b""   # closed at once
            writer.close()
            assert ezsp.ezsp_version == 18
        finally:
            await ezsp.disconnect()


@async_test
async def test_rst_on_a_used_chip_reboots_it():
    async with bridge_with_sim() as (bridge, port, sims, apps):
        ezsp = bellows_ezsp.EZSP(device_config(port))
        await ezsp.connect(use_thread=False)
        try:
            before = bridge.reboots
            await ezsp.reset()                           # bellows sends RST on a used chip
            await ezsp.version()
            assert bridge.reboots == before + 1
            assert ezsp.ezsp_version == 18
        finally:
            await ezsp.disconnect()


@async_test
async def test_host_retransmission_is_acked_once_and_forwarded_once():
    async with bridge_with_sim() as (bridge, port, sims, apps):
        reader, writer = await asyncio.open_connection("127.0.0.1", port)
        try:
            writer.write(bytes([0x1A] * 4) + bellows_wire(bellows_ash.RstFrame()))
            dec = ash_bridge.AshDecoder()

            async def next_frame():
                while True:
                    frames = dec.feed(await asyncio.wait_for(reader.read(1024), 2))
                    if frames:
                        return frames[0]

            assert await next_frame() == b"\xc1\x02\x0b"
            version = bytes([0x00, 0x00, 0x00, 0x04])            # legacy version(4), seq 0
            frame = ash_bridge.data_frame(0, 0, version)
            writer.write(frame)
            writer.write(ash_bridge.data_frame(0, 0, version, re_tx=True))   # duplicate
            got = [await next_frame() for _ in range(3)]
            acks = [f for f in got if f[0] & 0xE0 == 0x80]
            data = [f for f in got if f[0] & 0x80 == 0]
            assert len(acks) == 2 and all(a[0] & 7 == 1 for a in acks)
            assert len(data) == 1 and ash_bridge.randomize(data[0][1:])[3] == 18
            assert len(apps[-1].log) == 1                     # forwarded once
            writer.write(ash_bridge.ack_frame(1))
        finally:
            writer.close()


@async_test
async def test_quick_reconnect_waits_for_the_running_reboot():
    """ZHA's probe connects, disconnects and connects again at once: one reboot, not two."""
    async with bridge_with_sim() as (bridge, port, sims, apps):
        for _ in range(3):
            ezsp = bellows_ezsp.EZSP(device_config(port))
            await ezsp.connect(use_thread=False)
            assert ezsp.ezsp_version == 18
            await ezsp.disconnect()
        # boot + one reboot after each of the first two hosts (each reconnect reused it),
        # + the one after the last host, possibly still running
        for _ in range(100):
            if bridge.reboots == 4:
                break
            await asyncio.sleep(0.02)
        assert bridge.reboots == 4


@async_test
async def test_close_while_a_host_is_connected():
    async with bridge_with_sim() as (bridge, port, sims, apps):
        ezsp = bellows_ezsp.EZSP(device_config(port))
        await ezsp.connect(use_thread=False)
        async with asyncio.timeout(5):
            await bridge.close()                         # must not wait for ZHA to leave
        await ezsp.disconnect()


class FailingBle:
    def __init__(self):
        self.attaches = 0
        self.detaches = 0

    async def attach(self, ep):
        self.attaches += 1
        raise RuntimeError("Bluetooth controller did not answer")

    async def detach(self):
        self.detaches += 1


@async_test
async def test_a_failing_bluetooth_side_never_stops_zigbee():
    sims = []

    async def open_transport():
        (hr, hw), (sr, sw) = make_link()
        sim = SimSecondary(apps={5: Ezsp18()})
        sim.start(sr, sw)
        sims.append(sim)
        return hr, hw

    ble = FailingBle()
    bridge = ash_bridge.Bridge(open_transport, primary_kwargs=FAST, t_rx_ack=0.3, ble=ble)
    port = await bridge.start("127.0.0.1", 0)
    try:
        assert ble.attaches == 1
        ezsp = bellows_ezsp.EZSP(device_config(port))
        await ezsp.connect(use_thread=False)
        assert ezsp.ezsp_version == 18
        await ezsp.disconnect()
    finally:
        await bridge.close()
        for s in sims:
            await s.stop()
    assert ble.detaches >= 1
