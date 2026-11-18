"""Spinel of the chip's OpenThread RCP on a Unix socket, for otbr-agent's RCP vendor interface.

The thread-ble firmware runs the OpenThread RCP with Silicon Labs' CPC transport (ot_ncp_cpc):
Spinel on CPC endpoint 12 (SL_CPC_ENDPOINT_15_4). On the Mac, otbr-agent reaches it through
OpenThread's RCP vendor interface (build option OT_POSIX_RCP_VENDOR_BUS, our implementation in
thread-ble/otbr/cpc_socket_interface.cpp), which connects to this socket. That is the split of
Silicon Labs' own Linux stack, where cpcd owns the UART and otbr-agent's spinel+cpc vendor
interface talks to it through libcpc over a local socket. Here the dongle owner is our own CPC
host (cpc.py) and the socket protocol is ours, documented below and in docs/thread-ble.md.

Endpoint 12 as the chip uses it (SDK protocol/openthread/platform-abstraction/ncp/ncp_cpc.cpp):
  host -> chip  one Spinel frame per CPC payload (ProcessCpc, :309-326)
  chip -> host  one or more Spinel frames per CPC payload, each preceded by its length as a
                u16 big-endian (SendToCPC, :197-216), at most OPENTHREAD_CONFIG_NCP_CPC_TX_CHUNK_SIZE
  The chip holds everything it has to say until the host has sent it a frame (mIsReady,
  :321-324), including the reset notification it queues at boot.

The socket (AF_UNIX, SOCK_STREAM) carries messages

    type u8 | length u16 big-endian | payload (length bytes)

  0x00 HELLO   server -> client, the first message on every connection:
               protocol version u8 (1) | largest Spinel frame the chip accepts, u16 big-endian
               (its CPC RX capability; 0 while not known yet) | UART bit rate to the chip,
               u32 big-endian (OpenThread's bus speed, used for its bus transfer times)
  0x01 SPINEL  one Spinel frame, either direction, passed through unchanged
  0x02 RESET   client -> server, empty: reboot the chip (the RCP's hardware reset)
               server -> client: the chip has (re)booted and endpoint 12 is connected again;
               payload: the CPC reset reason, u32 big-endian (0xFFFFFFFF: unknown)

Nothing here interprets Spinel. A SPINEL_CMD_RESET goes to the chip like any other frame and the
RCP answers it itself (ncp_base.cpp CommandHandler_RESET: radio stack reset, then LAST_STATUS
RESET_POWER_ON). Silicon Labs' posix cpc_interface.cpp instead answers that command on the
chip's behalf without sending it; we do not.

One client at a time; a new connection replaces the old one (otbr-agent restarted). While the
chip reboots, the client stays connected and its frames are dropped and counted: OpenThread then
meets the RCP's own reset notification on its next exchange and recovers through its RCP
restoration, the same path as after a crash of a UART RCP.
"""

from __future__ import annotations

import asyncio
import contextlib
import logging
import os
import stat
import struct
import time
from collections.abc import Callable
from dataclasses import dataclass, fields

import cpc

_LOG = logging.getLogger("spinel_socket")

HELLO, SPINEL, RESET = 0x00, 0x01, 0x02
PROTOCOL_VERSION = 1
HEADER = struct.Struct(">BH")
UNKNOWN_REASON = 0xFFFFFFFF
SLOW_WRITE = 0.1              # s: a CPC write the chip took longer to acknowledge is logged

_NAMES = {HELLO: "HELLO", SPINEL: "SPINEL", RESET: "RESET"}


def encode(kind: int, payload: bytes = b"") -> bytes:
    if len(payload) > 0xFFFF:
        raise ValueError(f"message payload of {len(payload)} bytes does not fit a u16 length")
    return HEADER.pack(kind, len(payload)) + payload


def hello(max_frame: int, bus_speed: int) -> bytes:
    return encode(HELLO, struct.pack(">BHI", PROTOCOL_VERSION, max_frame, bus_speed))


def reset_notice(reason: int | None) -> bytes:
    return encode(RESET, struct.pack(">I", UNKNOWN_REASON if reason is None else reason))


class MessageReader:
    """Splits the socket's byte stream back into (type, payload) messages."""

    def __init__(self) -> None:
        self._buf = bytearray()

    def feed(self, data: bytes) -> list[tuple[int, bytes]]:
        self._buf += data
        out = []
        while len(self._buf) >= HEADER.size:
            kind, length = HEADER.unpack_from(self._buf)
            if len(self._buf) < HEADER.size + length:
                break
            out.append((kind, bytes(self._buf[HEADER.size:HEADER.size + length])))
            del self._buf[:HEADER.size + length]
        return out


def split_rcp_payload(payload: bytes) -> list[bytes]:
    """The Spinel frames in one CPC payload from the chip (u16 big-endian length + frame, repeated).

    Raises ValueError for a payload that does not divide into whole records, the case in which
    Silicon Labs' posix reader (cpc_interface.cpp Read) stops at the broken record.
    """
    frames, off = [], 0
    while off < len(payload):
        if len(payload) - off < 2:
            raise ValueError(f"1 stray byte after {len(frames)} frame(s)")
        n = int.from_bytes(payload[off:off + 2], "big")
        off += 2
        if n == 0 or len(payload) - off < n:
            raise ValueError(f"record of {n} bytes at offset {off - 2} in a {len(payload)}-byte "
                             f"payload, after {len(frames)} frame(s)")
        frames.append(bytes(payload[off:off + n]))
        off += n
    return frames


@dataclass
class SpinelStats:
    to_rcp: int = 0                # Spinel frames written to endpoint 12
    from_rcp: int = 0              # Spinel frames read from endpoint 12
    to_client: int = 0             # of those, delivered to a connected client
    dropped_rebooting: int = 0     # client frames while the chip was not attached
    dropped_too_long: int = 0      # client frames above the chip's RX capability
    dropped_write_failed: int = 0  # client frames the CPC link failed to deliver
    malformed_payloads: int = 0    # chip payloads that did not split into whole records
    reset_requests: int = 0        # RESET messages from the client
    slowest_write_s: float = 0.0

    def take(self) -> SpinelStats:
        """Return the counts so far and start again from zero."""
        out = SpinelStats(**{f.name: getattr(self, f.name) for f in fields(self)})
        for f in fields(self):
            setattr(self, f.name, f.default)
        return out


class SpinelSocketServer:
    """Serves CPC endpoint 12 to one Spinel client (otbr-agent) on a Unix socket.

    attach()/detach() follow the chip's reboots, like hci_tcp.HciTcpServer; the listening socket
    and the client connection outlive them.
    """

    def __init__(self, path: str, *, bus_speed: int = 460800,
                 request_reset: Callable[[], None] | None = None, mode: int = 0o600) -> None:
        self.path = path
        self.bus_speed = bus_speed
        self.mode = mode
        self._request_reset = request_reset
        self._server: asyncio.base_events.Server | None = None
        self._ep: cpc.Endpoint | None = None
        self._max_frame = 0
        self._client: asyncio.StreamWriter | None = None
        self._rx_task: asyncio.Task | None = None
        self._handlers: set[asyncio.Task] = set()
        self.stats = SpinelStats()
        self.clients = 0
        self.attaches = 0

    @property
    def attached(self) -> bool:
        return self._ep is not None

    @property
    def client_connected(self) -> bool:
        return self._client is not None and not self._client.is_closing()

    async def start(self) -> None:
        with contextlib.suppress(FileNotFoundError):
            if stat.S_ISSOCK(os.lstat(self.path).st_mode):
                os.unlink(self.path)          # left behind by a previous run
            else:
                raise FileExistsError(f"{self.path} exists and is not a socket")
        old = os.umask(0o777 & ~self.mode)    # the socket is created with the right mode
        try:
            self._server = await asyncio.start_unix_server(self._serve, self.path)
        finally:
            os.umask(old)
        _LOG.info("Spinel of the chip's OpenThread RCP on %s", self.path)

    async def attach(self, ep: cpc.Endpoint, *, max_frame: int, reset_reason: int | None) -> None:
        """Endpoint 12 of a freshly (re)booted chip is connected."""
        await self.detach()
        self._ep = ep
        self._max_frame = max_frame
        self.attaches += 1
        self._rx_task = asyncio.create_task(self._from_rcp(ep), name="spinel-rx")
        if self.client_connected:
            _LOG.info("chip rebooted under a connected client; telling it")
            self._send(reset_notice(reset_reason))

    async def detach(self) -> None:
        """The chip is going away (reboot or lost link). The client stays connected."""
        self._ep = None
        if self._rx_task is not None:
            self._rx_task.cancel()
            with contextlib.suppress(asyncio.CancelledError, Exception):
                await self._rx_task
            self._rx_task = None

    async def close(self) -> None:
        await self.detach()
        if self._server is not None:
            self._server.close()
        if self._client is not None:
            self._client.close()
        for task in list(self._handlers):
            task.cancel()
        if self._handlers:
            await asyncio.gather(*self._handlers, return_exceptions=True)
        if self._server is not None:
            await self._server.wait_closed()
            self._server = None
        with contextlib.suppress(FileNotFoundError):
            os.unlink(self.path)

    def _send(self, data: bytes) -> None:
        if self.client_connected:
            assert self._client is not None
            self._client.write(data)

    async def _from_rcp(self, ep: cpc.Endpoint) -> None:
        try:
            while True:
                payload = await ep.read()
                try:
                    frames = split_rcp_payload(payload)
                except ValueError as exc:
                    self.stats.malformed_payloads += 1
                    _LOG.warning("chip payload of %d bytes is not whole Spinel records (%s): %s",
                                 len(payload), exc, payload[:32].hex())
                    continue
                for frame in frames:
                    self.stats.from_rcp += 1
                    if self.client_connected:
                        self.stats.to_client += 1
                        self._send(encode(SPINEL, frame))
        except cpc.CpcError as exc:
            _LOG.warning("Spinel endpoint closed: %s", exc)

    async def _to_rcp(self, frame: bytes) -> None:
        ep = self._ep
        if ep is None:
            self.stats.dropped_rebooting += 1
            if self.stats.dropped_rebooting == 1:
                _LOG.info("chip not attached (rebooting); dropping Spinel frames from the client")
            return
        if self._max_frame and len(frame) > self._max_frame:
            self.stats.dropped_too_long += 1
            _LOG.error("dropping a %d-byte Spinel frame: the chip accepts at most %d bytes",
                       len(frame), self._max_frame)
            return
        t0 = time.monotonic()
        try:
            await ep.write(frame)
        except (cpc.CpcError, ValueError) as exc:
            self.stats.dropped_write_failed += 1
            _LOG.warning("Spinel frame to the chip failed: %s", exc)
            return
        took = time.monotonic() - t0
        self.stats.to_rcp += 1
        self.stats.slowest_write_s = max(self.stats.slowest_write_s, took)
        if took > SLOW_WRITE:
            _LOG.warning("CPC write of a %d-byte Spinel frame took %.0f ms", len(frame), took * 1000)

    async def _serve(self, reader: asyncio.StreamReader, writer: asyncio.StreamWriter) -> None:
        me = asyncio.current_task()
        if me is not None:
            self._handlers.add(me)
        if self.client_connected:
            _LOG.warning("a new Spinel client replaces the previous connection")
            assert self._client is not None
            self._client.close()
        self._client = writer
        self.clients += 1
        _LOG.info("Spinel client connected (chip %s)", "attached" if self.attached else "rebooting")
        writer.write(hello(self._max_frame, self.bus_speed))
        split = MessageReader()
        try:
            while data := await reader.read(4096):
                for kind, payload in split.feed(data):
                    if kind == SPINEL:
                        if payload:
                            await self._to_rcp(payload)
                    elif kind == RESET:
                        self.stats.reset_requests += 1
                        if self._request_reset is None:
                            _LOG.warning("client asked for a chip reset; not supported here")
                        else:
                            _LOG.warning("client asked for a hardware reset of the RCP: "
                                         "rebooting the chip")
                            self._request_reset()
                    else:
                        _LOG.error("unknown message type 0x%02x from the Spinel client; closing "
                                   "the connection", kind)
                        return
                if writer.is_closing():
                    return                      # replaced by a newer client
        except ConnectionError as exc:
            _LOG.warning("Spinel client connection error: %s", exc)
        finally:
            if self._client is writer:
                self._client = None
            writer.close()
            _LOG.info("Spinel client disconnected")
            if me is not None:
                self._handlers.discard(me)
