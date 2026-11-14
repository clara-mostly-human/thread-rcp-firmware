"""Raw HCI of the chip's Bluetooth controller on a local TCP port (H4 framing).

The macOS counterpart of Silicon Labs' cpc-hci-bridge on Linux: CPC endpoint 14 carries one H4
packet per frame, and any Bluetooth host stack that speaks H4 over a socket (NimBLE's
BLE_SOCK_TYPE linux_tcp, Bumble's tcp-client transport, ...) connects here. One host at a time; a new connection replaces the previous one.

Host-to-controller bytes arrive as a TCP stream, so they are split back into whole H4 packets
before each goes out as one CPC frame. Controller-to-host frames are passed through as they are.
"""

from __future__ import annotations

import asyncio
import contextlib
import logging

import cpc

_LOG = logging.getLogger("hci_tcp")

# H4 packet type: (header length, offset of the length field in the header, its size)
_H4 = {0x01: (3, 2, 1),      # command: opcode(2) length(1)
       0x02: (4, 2, 2),      # ACL data: handle(2) length(2)
       0x03: (3, 2, 1),      # SCO data: handle(2) length(1)
       0x05: (4, 2, 2)}      # ISO data: handle(2) length(2), top 2 bits are flags


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

    async def attach(self, ep: cpc.Endpoint) -> None:
        await self.detach()
        self._ep = ep
        self._rx_task = asyncio.create_task(self._from_controller(ep), name="hci-tcp-rx")
        if self._server is None:
            self._server = await asyncio.start_server(self._serve, self.host, self.port)
            _LOG.info("raw HCI (H4) of the chip's Bluetooth controller on %s:%d", self.host, self.port)

    async def detach(self) -> None:
        if self._client is not None:
            self._client.close()               # the host stack must start over with the new chip
            self._client = None
        if self._rx_task is not None:
            self._rx_task.cancel()
            with contextlib.suppress(asyncio.CancelledError, Exception):
                await self._rx_task
            self._rx_task = None
        self._ep = None

    async def close(self) -> None:
        await self.detach()
        if self._server is not None:
            self._server.close()
            with contextlib.suppress(Exception):
                await asyncio.wait_for(self._server.wait_closed(), 5)
            self._server = None

    async def _from_controller(self, ep: cpc.Endpoint) -> None:
        try:
            while True:
                data = await ep.read()
                if data[:1] == b"\x04":
                    self.adverts += 1
                if self._client is not None and not self._client.is_closing():
                    self._client.write(data)
        except cpc.CpcError as exc:
            _LOG.warning("Bluetooth endpoint closed: %s", exc)

    async def _serve(self, reader: asyncio.StreamReader, writer: asyncio.StreamWriter) -> None:
        peer = writer.get_extra_info("peername")
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
                    await self._ep.write(packet)
        except (ValueError, ConnectionError, cpc.CpcError) as exc:
            _LOG.warning("host stack connection error: %s", exc)
        finally:
            if self._client is writer:
                self._client = None
            writer.close()
            _LOG.info("host stack %s disconnected", peer)
