#!/usr/bin/env python3
"""Probe the Zigbee NCP (EZSP, CPC endpoint 5) and the Bluetooth controller (HCI, CPC endpoint 14)
of the zigbee-ble firmware over one UART.

    python probe.py /dev/cu.usbserial-XXXX [--baud 460800] [--scan-seconds 10]

Steps: CPC reset sequence and secondary identity; EZSP `version` the way bellows starts
(legacy frame asking for protocol 4, then again with the version the NCP reports); HCI Reset
and Read Local Version Information; optionally a passive LE scan that counts advertising
reports and distinct addresses.

Framing facts (SDK 2025.6.3):
  * EZSP over CPC: one plain EZSP frame per CPC payload, no ASH, no byte stuffing, no
    randomisation, no extra header. The host side writes ezspFrameContents as is
    (protocol/zigbee/app/util/ezsp/serial-interface-cpc.c:285-290) and reads raw frames
    (:204-219); the NCP side (libzigbee-ncp-cpc.a, binary only) links sl_cpc_read/sl_cpc_write
    and no ASH code.
  * EZSP frames: legacy = seq, frame control, frame id (1 byte), parameters; extended = seq,
    frame control low, frame control high (0x01 = format version 1), frame id (u16 LE),
    parameters (protocol/zigbee/app/util/ezsp/ezsp-protocol.h:39-54). The first `version`
    command is sent in legacy format, later commands extended (ezsp.c:523-533, 629-633).
    A response is extended when (byte 2 & 0x03) == 0x01 (ezsp.c:552-566).
  * HCI over CPC: each CPC payload carries H4 packets including the packet type byte
    (0x01 command, 0x02 ACL, 0x04 event). Host to controller this is read from the source
    (protocol/bluetooth/bgstack/ll/utils/hci_packet/cpc/src/sl_hci_packet.c:61-95); controller
    to host the buffer handed to sl_cpc_write (:126-129) is the same buffer the UART transport
    writes raw (uart/src/sl_hci_packet.c:162-165), so it includes the type byte. Packets are
    reassembled from the payload byte stream by their H4 length fields, so a packet split over
    two CPC frames or two packets in one frame are handled either way.
"""

from __future__ import annotations

import argparse
import asyncio
import logging
import struct
import sys
from dataclasses import dataclass, field
from typing import Callable

import cpc

Out = Callable[[str], None]

# --------------------------------------------------------------------------------------------
# EZSP
# --------------------------------------------------------------------------------------------

EZSP_VERSION = 0x0000              # protocol/zigbee/app/util/ezsp/ezsp-enum.h:757
EZSP_INVALID_COMMAND = 0x0058      # ezsp-enum.h:779
EZSP_FC_RESPONSE = 0x80            # ezsp-protocol.h:75-77
EZSP_FC_ASYNC_CALLBACK = 0x10      # ezsp-protocol.h:129-130
EZSP_FC_HIGH_FORMAT_V1 = 0x01      # ezsp-protocol.h:150-151
BELLOWS_FIRST_VERSION = 4          # bellows asks for protocol 4 first


class EzspError(Exception):
    pass


@dataclass
class EzspResponse:
    seq: int
    frame_control: int
    frame_id: int
    params: bytes
    extended: bool
    raw: bytes


def ezsp_frame(seq: int, frame_id: int, params: bytes, *, legacy: bool) -> bytes:
    """Build a host->NCP command. Frame control low byte 0x00: command, idle, network 0."""
    if legacy:
        return bytes((seq & 0xFF, 0x00, frame_id & 0xFF)) + params
    return bytes((seq & 0xFF, 0x00, EZSP_FC_HIGH_FORMAT_V1)) + struct.pack("<H", frame_id) + params


def ezsp_parse(data: bytes) -> EzspResponse:
    if len(data) < 3:
        raise EzspError(f"EZSP frame too short: {data.hex()}")
    if len(data) >= 5 and (data[2] & 0x03) == EZSP_FC_HIGH_FORMAT_V1:
        return EzspResponse(data[0], data[1] | (data[2] << 8),
                            int.from_bytes(data[3:5], "little"), data[5:], True, data)
    return EzspResponse(data[0], data[1], data[2], data[3:], False, data)


def format_stack_version(v: int) -> str:
    return f"{(v >> 12) & 0xF}.{(v >> 8) & 0xF}.{(v >> 4) & 0xF}.{v & 0xF}"


async def ezsp_version(ep: cpc.Endpoint, seq: int, desired: int, *, legacy: bool,
                       timeout: float, out: Out) -> tuple[int, int, int, EzspResponse]:
    """Send EZSP `version` and return (protocolVersion, stackType, stackVersion, response)."""
    await ep.write(ezsp_frame(seq, EZSP_VERSION, bytes((desired,)), legacy=legacy))
    loop = asyncio.get_running_loop()
    deadline = loop.time() + timeout
    while True:
        remaining = deadline - loop.time()
        if remaining <= 0:
            raise EzspError(f"no reply to EZSP version({desired}) within {timeout} s")
        try:
            data = await ep.read(timeout=remaining)
        except cpc.CpcTimeoutError:
            raise EzspError(f"no reply to EZSP version({desired}) within {timeout} s") from None
        resp = ezsp_parse(data)
        if resp.frame_control & EZSP_FC_ASYNC_CALLBACK or resp.seq != (seq & 0xFF):
            out(f"    (skipping unrelated EZSP frame {data.hex()})")
            continue
        if not resp.frame_control & EZSP_FC_RESPONSE:
            raise EzspError(f"EZSP frame without the response bit: {data.hex()}")
        if resp.frame_id == EZSP_INVALID_COMMAND:
            status = resp.params[0] if resp.params else None
            raise EzspError(f"NCP answered invalidCommand (status {status!r}) to version({desired})")
        if resp.frame_id != EZSP_VERSION or len(resp.params) < 4:
            raise EzspError(f"unexpected reply to version({desired}): {data.hex()}")
        proto, stack_type, stack_version = struct.unpack_from("<BBH", resp.params)
        return proto, stack_type, stack_version, resp


async def probe_ezsp(primary: cpc.CpcPrimary, *, timeout: float, out: Out) -> None:
    out(f"Zigbee NCP (EZSP) on CPC endpoint {cpc.EP_ZIGBEE}")
    ep = await primary.connect_endpoint(cpc.EP_ZIGBEE, timeout=timeout)
    out("  endpoint connected")
    proto, stype, sver, resp = await ezsp_version(ep, 0, BELLOWS_FIRST_VERSION, legacy=True,
                                                  timeout=timeout, out=out)
    out(f"  version({BELLOWS_FIRST_VERSION}), legacy frame: protocolVersion={proto} "
        f"stackType={stype} stackVersion=0x{sver:04x} ({format_stack_version(sver)})  "
        f"[{resp.raw.hex()}]")
    if proto != BELLOWS_FIRST_VERSION:
        legacy = proto < 8
        proto2, stype2, sver2, resp2 = await ezsp_version(ep, 1, proto, legacy=legacy,
                                                          timeout=timeout, out=out)
        fmt = "legacy" if legacy else "extended"
        out(f"  version({proto}), {fmt} frame: protocolVersion={proto2} stackType={stype2} "
            f"stackVersion=0x{sver2:04x} ({format_stack_version(sver2)})  [{resp2.raw.hex()}]")
        if proto2 != proto:
            raise EzspError(f"NCP did not accept protocol version {proto} (answered {proto2})")


# --------------------------------------------------------------------------------------------
# HCI
# --------------------------------------------------------------------------------------------

H4_COMMAND, H4_ACL, H4_SCO, H4_EVENT, H4_ISO = 0x01, 0x02, 0x03, 0x04, 0x05

HCI_SET_EVENT_MASK = 0x0C01
HCI_RESET = 0x0C03
HCI_READ_LOCAL_VERSION = 0x1001
HCI_LE_SET_EVENT_MASK = 0x2001
HCI_LE_SET_SCAN_PARAMETERS = 0x200B
HCI_LE_SET_SCAN_ENABLE = 0x200C

EVT_COMMAND_COMPLETE = 0x0E
EVT_COMMAND_STATUS = 0x0F
EVT_HARDWARE_ERROR = 0x10
EVT_LE_META = 0x3E
LE_ADVERTISING_REPORT = 0x02
LE_EXTENDED_ADVERTISING_REPORT = 0x0D

# Event_Mask after HCI Reset is 0x00001FFFFFFFFFFF, which does not include LE Meta (bit 61);
# set it so LE Advertising Report events are delivered. LE_Event_Mask default 0x1F already has
# the advertising report (bit 1); it is set explicitly anyway.
EVENT_MASK_WITH_LE_META = 0x20001FFFFFFFFFFF
LE_EVENT_MASK_DEFAULT = 0x000000000000001F

CORE_VERSIONS = {0x06: "4.0", 0x07: "4.1", 0x08: "4.2", 0x09: "5.0", 0x0A: "5.1", 0x0B: "5.2",
                 0x0C: "5.3", 0x0D: "5.4", 0x0E: "6.0", 0x0F: "6.1"}
COMPANIES = {0x02FF: "Silicon Laboratories"}


class HciError(Exception):
    pass


class H4Reassembler:
    """Split a byte stream into H4 packets using their length fields."""

    def __init__(self) -> None:
        self._buf = bytearray()
        self.discarded = 0

    def feed(self, data: bytes) -> list[bytes]:
        buf = self._buf
        buf += data
        packets: list[bytes] = []
        while buf:
            kind = buf[0]
            if kind == H4_EVENT:
                need = 3
                total = 3 + buf[2] if len(buf) >= 3 else None
            elif kind in (H4_ACL, H4_ISO):
                need = 5
                if len(buf) >= 5:
                    n = int.from_bytes(buf[3:5], "little")
                    total = 5 + (n & 0x3FFF if kind == H4_ISO else n)
                else:
                    total = None
            elif kind == H4_SCO:
                need = 4
                total = 4 + buf[3] if len(buf) >= 4 else None
            else:
                # No length to skip by: drop what we have and wait for a fresh payload.
                self.discarded += len(buf)
                buf.clear()
                break
            if len(buf) < need or total is None or len(buf) < total:
                break
            packets.append(bytes(buf[:total]))
            del buf[:total]
        return packets


@dataclass
class ScanStats:
    reports: int = 0
    extended_reports: int = 0
    addresses: set[tuple[int, bytes]] = field(default_factory=set)
    malformed: int = 0


def parse_le_meta(packet: bytes, stats: ScanStats) -> None:
    """Count LE (Extended) Advertising Reports from an H4 event packet."""
    params = packet[3:]
    if not params:
        return
    sub = params[0]
    if sub == LE_ADVERTISING_REPORT:
        # Subevent, Num_Reports, then arrays per field: Event_Type[i], Address_Type[i],
        # Address[i], Data_Length[i], Data[i], RSSI[i] (Core spec Vol 4 Part E 7.7.65.2).
        if len(params) < 2:
            stats.malformed += 1
            return
        n = params[1]
        p = 2
        need = n * (1 + 1 + 6 + 1)
        if len(params) < p + need:
            stats.malformed += 1
            return
        addr_types = params[p + n:p + 2 * n]
        addrs = [params[p + 2 * n + 6 * i:p + 2 * n + 6 * (i + 1)] for i in range(n)]
        stats.reports += n
        for i in range(n):
            stats.addresses.add((addr_types[i], bytes(addrs[i])))
    elif sub == LE_EXTENDED_ADVERTISING_REPORT:
        if len(params) < 2:
            stats.malformed += 1
            return
        n = params[1]
        p = 2
        for _ in range(n):
            if len(params) < p + 24:
                stats.malformed += 1
                return
            addr_type = params[p + 2]
            addr = bytes(params[p + 3:p + 9])
            data_len = params[p + 23]
            p += 24 + data_len
            stats.extended_reports += 1
            stats.addresses.add((addr_type, addr))


class HciLink:
    """HCI commands and events over one CPC endpoint."""

    def __init__(self, ep: cpc.Endpoint) -> None:
        self.ep = ep
        self.h4 = H4Reassembler()
        self.scan = ScanStats()
        self.other_events: list[bytes] = []
        self._packets: asyncio.Queue[bytes | BaseException] = asyncio.Queue()
        self._task: asyncio.Task[None] | None = None

    def start(self) -> None:
        self._task = asyncio.get_running_loop().create_task(self._pump())

    async def stop(self) -> None:
        if self._task is not None:
            self._task.cancel()
            try:
                await self._task
            except (asyncio.CancelledError, Exception):
                pass

    async def _pump(self) -> None:
        try:
            while True:
                data = await self.ep.read()
                for packet in self.h4.feed(data):
                    self._packets.put_nowait(packet)
        except asyncio.CancelledError:
            raise
        except BaseException as exc:     # noqa: BLE001 - hand the error to the waiting caller
            self._packets.put_nowait(exc)

    def _handle_async(self, packet: bytes) -> None:
        if packet[0] == H4_EVENT and len(packet) >= 4 and packet[1] == EVT_LE_META:
            parse_le_meta(packet, self.scan)
        elif packet[0] == H4_EVENT and len(packet) >= 3 and packet[1] == EVT_HARDWARE_ERROR:
            raise HciError(f"controller reported Hardware Error {packet[3:].hex()}")
        else:
            self.other_events.append(packet)

    async def next_packet(self, timeout: float) -> bytes:
        async with asyncio.timeout(timeout):
            item = await self._packets.get()
        if isinstance(item, BaseException):
            raise item
        return item

    async def command(self, opcode: int, params: bytes = b"", *, timeout: float = 2.0) -> bytes:
        """Send one command; return the Command Complete return parameters (status first)."""
        await self.ep.write(bytes((H4_COMMAND,)) + struct.pack("<HB", opcode, len(params)) + params)
        loop = asyncio.get_running_loop()
        deadline = loop.time() + timeout
        while True:
            remaining = deadline - loop.time()
            try:
                if remaining <= 0:
                    raise TimeoutError
                packet = await self.next_packet(remaining)
            except TimeoutError:
                raise HciError(f"no Command Complete/Status for opcode 0x{opcode:04x} "
                               f"within {timeout} s") from None
            if packet[0] == H4_EVENT and len(packet) >= 6 and packet[1] == EVT_COMMAND_COMPLETE:
                if int.from_bytes(packet[4:6], "little") == opcode:
                    ret = packet[6:]
                    if ret and ret[0] != 0:
                        raise HciError(f"opcode 0x{opcode:04x} failed with status 0x{ret[0]:02x}")
                    return ret
            elif packet[0] == H4_EVENT and len(packet) >= 7 and packet[1] == EVT_COMMAND_STATUS:
                if int.from_bytes(packet[5:7], "little") == opcode:
                    if packet[3] != 0:
                        raise HciError(f"opcode 0x{opcode:04x} failed with status 0x{packet[3]:02x}")
                    return bytes((0,))
            self._handle_async(packet)


def describe_local_version(ret: bytes) -> str:
    if len(ret) < 9:
        raise HciError(f"short Read Local Version reply: {ret.hex()}")
    _, hci_ver, hci_rev, lmp_ver, company, lmp_sub = struct.unpack_from("<BBHBHH", ret)
    return (f"HCI version 0x{hci_ver:02x} ({CORE_VERSIONS.get(hci_ver, '?')}) revision 0x{hci_rev:04x}, "
            f"LMP version 0x{lmp_ver:02x} ({CORE_VERSIONS.get(lmp_ver, '?')}) subversion 0x{lmp_sub:04x}, "
            f"manufacturer 0x{company:04x} ({COMPANIES.get(company, 'unknown')})")


async def probe_hci(primary: cpc.CpcPrimary, *, scan_seconds: float, timeout: float,
                    out: Out) -> None:
    out(f"Bluetooth controller (HCI) on CPC endpoint {cpc.EP_BLUETOOTH_RCP}")
    ep = await primary.connect_endpoint(cpc.EP_BLUETOOTH_RCP, timeout=timeout)
    out("  endpoint connected")
    link = HciLink(ep)
    link.start()
    try:
        await link.command(HCI_RESET, timeout=timeout)
        out("  HCI Reset: OK")
        ret = await link.command(HCI_READ_LOCAL_VERSION, timeout=timeout)
        out(f"  Read Local Version Information: {describe_local_version(ret)}")
        if scan_seconds > 0:
            await scan(link, scan_seconds, timeout=timeout, out=out)
    finally:
        await link.stop()


async def scan(link: HciLink, seconds: float, *, timeout: float, out: Out) -> None:
    await link.command(HCI_SET_EVENT_MASK, struct.pack("<Q", EVENT_MASK_WITH_LE_META), timeout=timeout)
    await link.command(HCI_LE_SET_EVENT_MASK, struct.pack("<Q", LE_EVENT_MASK_DEFAULT), timeout=timeout)
    # Passive, interval 160 x 0.625 ms = 100 ms, window 48 x 0.625 ms = 30 ms, public own
    # address, accept all.
    await link.command(HCI_LE_SET_SCAN_PARAMETERS, struct.pack("<BHHBB", 0x00, 160, 48, 0x00, 0x00),
                       timeout=timeout)
    out(f"  LE passive scan for {seconds:g} s (interval 100 ms, window 30 ms)...")
    await link.command(HCI_LE_SET_SCAN_ENABLE, bytes((0x01, 0x00)), timeout=timeout)
    try:
        loop = asyncio.get_running_loop()
        deadline = loop.time() + seconds
        while (remaining := deadline - loop.time()) > 0:
            try:
                packet = await link.next_packet(remaining)
            except TimeoutError:
                break
            link._handle_async(packet)
    finally:
        await link.command(HCI_LE_SET_SCAN_ENABLE, bytes((0x00, 0x00)), timeout=timeout)
    s = link.scan
    out(f"  advertising reports: {s.reports} legacy, {s.extended_reports} extended; "
        f"distinct addresses: {len(s.addresses)}"
        + (f"; malformed events: {s.malformed}" if s.malformed else ""))


# --------------------------------------------------------------------------------------------
# Main
# --------------------------------------------------------------------------------------------

async def run_probe(reader: cpc.StreamReaderLike, writer: cpc.StreamWriterLike, *,
                    reset: bool = True, scan_seconds: float = 10.0, timeout: float = 5.0,
                    out: Out = print, primary_kwargs: dict | None = None) -> int:
    """Run all probe steps over an open stream pair. Returns 0 ok, 1 a step failed, 2 no link."""
    primary = cpc.CpcPrimary(reader, writer, **(primary_kwargs or {}))
    failures = 0
    try:
        try:
            info = await primary.start(reset=reset)
        except (cpc.CpcError, TimeoutError) as exc:
            out(f"CPC link: FAILED: {exc}")
            return 2
        reason = "not seen" if info.reset_reason is None else cpc._name(cpc.Status, info.reset_reason)
        out("CPC secondary")
        out(f"  reset reason:     {reason}")
        out(f"  protocol version: {info.protocol_version}")
        out(f"  CPC version:      {'.'.join(map(str, info.cpc_version))}")
        out(f"  app version:      {info.app_version!r}")
        out(f"  capabilities:     0x{info.capabilities:08x} ({', '.join(info.capability_names)})")
        out(f"  RX capability:    {info.rx_capability} bytes")
        try:
            state = await primary.get_security_state()
            out(f"  security state:   {cpc._name(cpc.SecurityState, state)}")
            if state != cpc.SecurityState.DISABLED:
                out("  WARNING: CPC security is active in the firmware; this host does not implement "
                    "it, so endpoint 5 and 14 traffic will be rejected (SECURITY_ISSUE)")
        except cpc.CpcPropertyError as exc:
            if exc.status == cpc.Status.UNIMPLEMENTED:
                out("  security state:   not built into the firmware")
            else:
                out(f"  security state:   unknown ({exc})")
        except (cpc.CpcError, TimeoutError) as exc:
            out(f"  security state:   FAILED: {exc}")
            failures += 1

        for step in (lambda: probe_ezsp(primary, timeout=timeout, out=out),
                     lambda: probe_hci(primary, scan_seconds=scan_seconds, timeout=timeout, out=out)):
            try:
                await step()
            except (cpc.CpcError, EzspError, HciError, TimeoutError) as exc:
                out(f"  FAILED: {exc}")
                failures += 1
        return 1 if failures else 0
    finally:
        await primary.close()


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("port", help="serial device, e.g. /dev/cu.usbserial-XXXX")
    ap.add_argument("--baud", type=int, default=460800)
    ap.add_argument("--scan-seconds", type=float, default=10.0,
                    help="passive LE scan duration; 0 skips the scan (default 10)")
    ap.add_argument("--timeout", type=float, default=5.0, help="per-step timeout in seconds")
    ap.add_argument("--no-reset", action="store_true",
                    help="do not reboot the secondary first (endpoints left connected by an "
                         "earlier session will then refuse to connect)")
    ap.add_argument("-v", "--verbose", action="store_true", help="log every CPC frame")
    args = ap.parse_args(argv)
    logging.basicConfig(level=logging.DEBUG if args.verbose else logging.WARNING,
                        format="%(asctime)s %(name)s %(levelname)s %(message)s")

    async def go() -> int:
        try:
            reader, writer = await cpc.open_serial(args.port, args.baud)
        except Exception as exc:    # noqa: BLE001 - pyserial raises SerialException/OSError
            print(f"cannot open {args.port}: {exc}")
            return 2
        print(f"{args.port} @ {args.baud} 8N1, no flow control")
        return await run_probe(reader, writer, reset=not args.no_reset,
                               scan_seconds=args.scan_seconds, timeout=args.timeout)

    try:
        return asyncio.run(go())
    except KeyboardInterrupt:
        return 130


if __name__ == "__main__":
    sys.exit(main())
