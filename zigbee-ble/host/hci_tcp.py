"""Raw HCI of the chip's Bluetooth controller on a local TCP port (H4 framing).

The macOS counterpart of Silicon Labs' cpc-hci-bridge on Linux: CPC endpoint 14 carries one H4
packet per frame, and any Bluetooth host stack that speaks H4 over a socket (NimBLE's
BLE_SOCK_TYPE linux_tcp, Bumble's tcp-client transport, ...) connects here. One host at a time; a new connection replaces the previous one.

Host-to-controller bytes arrive as a TCP stream, so they are split back into whole H4 packets
before each goes out as one CPC frame. Controller-to-host frames are passed through as they are.

Every HCI command from the host is timed until the Command Complete or Command Status that
answers it comes back from the controller. Logged: an answer slower than 200 ms, a command still
unanswered after NimBLE's 2 s timeout, and a CPC write the chip was slow to acknowledge, each
with the frames the chip sent meanwhile and its longest silence. That places a stall: in the
chip's answer, on the CPC link, or after the bridge.
"""

from __future__ import annotations

import asyncio
import contextlib
import logging
import time
from dataclasses import dataclass, fields

import cpc

_LOG = logging.getLogger("hci_tcp")

# H4 packet type: (header length, offset of the length field in the header, its size)
_H4 = {0x01: (3, 2, 1),      # command: opcode(2) length(1)
       0x02: (4, 2, 2),      # ACL data: handle(2) length(2)
       0x03: (3, 2, 1),      # SCO data: handle(2) length(1)
       0x05: (4, 2, 2)}      # ISO data: handle(2) length(2), top 2 bits are flags


SLOW_COMMAND = 0.2     # s: an answer later than this is logged
UNANSWERED = 2.0       # s: NimBLE's HCI command timeout (BLE_HCI_CMD_TIMEOUT_MS)
SLOW_WRITE = 0.1       # s: a CPC write the chip took longer to acknowledge is logged
FORGET = 30.0          # s: an unanswered command is dropped from the books

_NAMES = {0x0406: "Disconnect", 0x0C01: "Set Event Mask", 0x0C03: "Reset",
          0x1009: "Read BD_ADDR", 0x2001: "LE Set Event Mask", 0x200B: "LE Set Scan Parameters",
          0x200C: "LE Set Scan Enable", 0x200D: "LE Create Connection",
          0x200E: "LE Create Connection Cancel", 0x2013: "LE Connection Update",
          0x2016: "LE Read Remote Features", 0x2019: "LE Enable Encryption",
          0x2022: "LE Set Data Length"}


def opcode_name(op: int) -> str:
    return f"0x{op:04x} ({_NAMES[op]})" if op in _NAMES else f"0x{op:04x}"


def answered_opcode(packet: bytes) -> int | None:
    """The opcode a Command Complete or Command Status (H4 framing) answers, else None."""
    if len(packet) >= 6 and packet[0] == 0x04 and packet[1] == 0x0E:
        op = packet[4] | packet[5] << 8
    elif len(packet) >= 7 and packet[0] == 0x04 and packet[1] == 0x0F:
        op = packet[5] | packet[6] << 8
    else:
        return None
    return op or None          # opcode 0: the controller only reports free command slots


@dataclass
class _Command:
    opcode: int
    sent: float                     # monotonic time the bridge got it from the host
    write_s: float | None = None    # until the chip acknowledged its CPC frame
    frames: int = 0                 # frames from the chip since it was sent
    silence_s: float = 0.0          # longest gap between frames from the chip since then
    reported: bool = False          # already logged as unanswered

    def acked_text(self) -> str:
        if self.write_s is None:
            return "its CPC frame not yet acknowledged"
        return f"chip acknowledged its CPC frame after {self.write_s * 1000:.0f} ms"


@dataclass
class CommandStats:
    commands: int = 0
    answered: int = 0
    slow: int = 0               # answered after SLOW_COMMAND
    late: int = 0               # answered after UNANSWERED
    unanswered: int = 0         # still unanswered at UNANSWERED
    slowest_s: float = 0.0
    slowest_write_s: float = 0.0

    def take(self) -> CommandStats:
        """Return the counts so far and start again from zero."""
        out = CommandStats(**{f.name: getattr(self, f.name) for f in fields(self)})
        for f in fields(self):
            setattr(self, f.name, f.default)
        return out


class H4Splitter:
    def __init__(self) -> None:
        self._buf = bytearray()

    def feed(self, data: bytes) -> list[bytes]:
        self._buf += data
        out = []
        while self._buf:
            kind = self._buf[0]
            if kind not in _H4:
                raise ValueError(f"not an H4 host packet type: 0x{kind:02x}")
            hdr, off, size = _H4[kind]
            if len(self._buf) < 1 + hdr:
                break
            length = int.from_bytes(self._buf[1 + off:1 + off + size], "little")
            if kind == 0x05:
                length &= 0x3FFF
            total = 1 + hdr + length
            if len(self._buf) < total:
                break
            out.append(bytes(self._buf[:total]))
            del self._buf[:total]
        return out


class HciTcpServer:
    """Same attach()/detach() shape as ble_proxy.BleScanner, so the bridge can carry either."""

    def __init__(self, host: str = "127.0.0.1", port: int = 14433) -> None:
        self.host, self.port = host, port
        self._ep: cpc.Endpoint | None = None
        self._server: asyncio.base_events.Server | None = None
        self._client: asyncio.StreamWriter | None = None
        self._rx_task: asyncio.Task | None = None
        self.adverts = 0                       # bridge statistics read this; HCI events seen
        self.to_controller = 0
        self.commands = CommandStats()
        self.check_interval = 0.5              # s between checks for unanswered commands
        self._cmds: list[_Command] = []
        self._last_rx = 0.0
        self._watch_task: asyncio.Task | None = None

    async def attach(self, ep: cpc.Endpoint) -> None:
        await self.detach()
        self._ep = ep
        self._rx_task = asyncio.create_task(self._from_controller(ep), name="hci-tcp-rx")
        self._watch_task = asyncio.create_task(self._watch(), name="hci-tcp-watch")
        if self._server is None:
            self._server = await asyncio.start_server(self._serve, self.host, self.port)
            _LOG.info("raw HCI (H4) of the chip's Bluetooth controller on %s:%d", self.host, self.port)

    async def detach(self) -> None:
        if self._server is not None:
            # Stop listening while there is no controller: a host stack's reconnect is refused
            # until attach() listens again, instead of being accepted and dropped.
            self._server.close()
            self._server = None
        if self._client is not None:
            self._client.close()               # the host stack must start over with the new chip
            self._client = None
        for task in (self._rx_task, self._watch_task):
            if task is not None:
                task.cancel()
                with contextlib.suppress(asyncio.CancelledError, Exception):
                    await task
        self._rx_task = self._watch_task = None
        self._cmds.clear()                     # a rebooted chip answers nothing it was sent before
        self._ep = None

    async def close(self) -> None:
        await self.detach()

    async def _from_controller(self, ep: cpc.Endpoint) -> None:
        try:
            while True:
                data = await ep.read()
                self._note_from_controller(data, time.monotonic())
                if data[:1] == b"\x04":
                    self.adverts += 1
                if self._client is not None and not self._client.is_closing():
                    self._client.write(data)
        except cpc.CpcError as exc:
            _LOG.warning("Bluetooth endpoint closed: %s", exc)

    def _note_from_controller(self, data: bytes, now: float) -> None:
        for c in self._cmds:
            c.frames += 1
            c.silence_s = max(c.silence_s, now - max(self._last_rx, c.sent))
        self._last_rx = now
        op = answered_opcode(data)
        if op is None:
            return
        cmd = next((c for c in self._cmds if c.opcode == op), None)
        if cmd is None:
            return
        self._cmds.remove(cmd)
        took = now - cmd.sent
        st = self.commands
        st.answered += 1
        st.slowest_s = max(st.slowest_s, took)
        if took > UNANSWERED:
            st.late += 1
        if took > SLOW_COMMAND:
            st.slow += 1
            _LOG.warning("HCI command %s answered after %.0f ms%s (%s; %d frames from the chip "
                         "before the answer, longest silence %.0f ms)", opcode_name(op),
                         took * 1000, ", after NimBLE's 2 s timeout" if took > UNANSWERED else "",
                         cmd.acked_text(), cmd.frames - 1, cmd.silence_s * 1000)

    async def _watch(self) -> None:
        while True:
            await asyncio.sleep(self.check_interval)
            now = time.monotonic()
            for c in list(self._cmds):
                age = now - c.sent
                if age > FORGET:
                    self._cmds.remove(c)
                elif age > UNANSWERED and not c.reported:
                    c.reported = True
                    self.commands.unanswered += 1
                    silence = max(c.silence_s, now - max(self._last_rx, c.sent))
                    _LOG.warning("HCI command %s unanswered after %.0f ms (%s; %d frames from the "
                                 "chip since, longest silence %.0f ms)", opcode_name(c.opcode),
                                 age * 1000, c.acked_text(), c.frames, silence * 1000)

    async def _serve(self, reader: asyncio.StreamReader, writer: asyncio.StreamWriter) -> None:
        peer = writer.get_extra_info("peername")
        if self._ep is None:
            # The chip is rebooting: refuse now, so the host stack retries its connection
            # shortly instead of sending commands into the void and waiting out its timeout.
            _LOG.debug("refusing host stack %s: Bluetooth controller not attached yet", peer)
            writer.close()
            return
        if self._client is not None and not self._client.is_closing():
            # The newest host stack wins: a new connection means the previous host restarted or
            # its connection went stale (and a readiness probe must not lock the real host out).
            _LOG.warning("host stack %s replaces the previous connection", peer)
            self._client.close()
        self._client = writer
        _LOG.info("host stack connected from %s", peer)
        split = H4Splitter()
        try:
            while data := await reader.read(4096):
                for packet in split.feed(data):
                    if self._ep is None:
                        continue
                    self.to_controller += 1
                    cmd = None
                    if packet[0] == 0x01:
                        cmd = _Command(packet[1] | packet[2] << 8, time.monotonic())
                        self._cmds.append(cmd)
                        self.commands.commands += 1
                    t0 = time.monotonic()
                    await self._ep.write(packet)
                    took = time.monotonic() - t0
                    self.commands.slowest_write_s = max(self.commands.slowest_write_s, took)
                    if cmd is not None:
                        cmd.write_s = took
                    if took > SLOW_WRITE:
                        _LOG.warning("CPC write of HCI %s took %.0f ms",
                                     f"command {opcode_name(cmd.opcode)}" if cmd else "data",
                                     took * 1000)
        except (ValueError, ConnectionError, cpc.CpcError) as exc:
            _LOG.warning("host stack connection error: %s", exc)
        finally:
            if self._client is writer:
                self._client = None
            writer.close()
            _LOG.info("host stack %s disconnected", peer)
