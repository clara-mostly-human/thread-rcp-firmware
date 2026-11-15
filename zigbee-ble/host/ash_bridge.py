"""ASH over TCP for ZHA, EZSP over CPC to the dongle.

The zigbee-ble firmware carries plain EZSP frames on CPC endpoint 5, but bellows (ZHA's EZSP
library) only speaks ASH, the byte-stuffed, CRC-checked, sequenced UART protocol of a classic
EZSP NCP. This bridge plays the NCP side of ASH on a TCP port (ZHA: `socket://127.0.0.1:PORT`)
and passes the EZSP frames through to endpoint 5 unchanged.

ASH, as bellows 1.2.1 implements the host side (bellows/ash.py) and Silicon Labs UG101 defines it:
  * frames end with FLAG 0x7E; ESCAPE 0x7D + (byte ^ 0x20) stuffs the reserved bytes
    0x7E 0x7D 0x11 0x13 0x18 0x1A; CANCEL 0x1A drops the frame in progress; SUBSTITUTE 0x18
    drops everything up to the next FLAG; XON/XOFF are ignored.
  * CRC-CCITT (init 0xFFFF), big-endian, over control + data.
  * DATA  0 frm(3) reTx(1) ack(3), payload XORed with the LFSR sequence 0x42, 0x21, ...
    ACK   100 r nRdy ack(3)        NAK 101 r nRdy ack(3)
    RST   0xC0 (host to NCP)       RSTACK 0xC1 0x02 code     ERROR 0xC2 0x02 code
  * ack numbers name the next frame expected. bellows sends one DATA frame at a time (TX_K = 1),
    waits t_rx_ack (1.6 s at first) for the ACK, retries with reTx up to 5 times, and waits
    2.5 s for RSTACK after RST (bellows/uart.py RESET_TIMEOUT), 3 attempts at startup.

A real NCP reboots on RST, and bellows relies on that: configuration values can only be set on
a freshly started stack. So the bridge reboots the chip through CPC on RST, unless it is
already fresh (rebooted since the last EZSP frame), which is what it arranges after every
client disconnect so ZHA's start is quick.

    uv run --no-project --with pyserial python ash_bridge.py /dev/cu.usbserial-XXXX --port 6638

The same process serves the chip's Bluetooth controller as raw HCI (hci_tcp, CPC endpoint 14)
on --hci-tcp (default 14433) for a host stack such as nimbled; --no-bluetooth turns it off.
"""

from __future__ import annotations

import argparse
import asyncio
import binascii
import contextlib
import logging
from collections.abc import Awaitable, Callable

import cpc

_LOG = logging.getLogger("ash_bridge")

FLAG, ESCAPE, XON, XOFF, SUBSTITUTE, CANCEL = 0x7E, 0x7D, 0x11, 0x13, 0x18, 0x1A
RESERVED = frozenset((FLAG, ESCAPE, XON, XOFF, SUBSTITUTE, CANCEL))
ASH_VERSION = 0x02
RESET_SOFTWARE = 0x0B          # bellows/types/named.py NcpResetCode
T_RX_ACK = 1.6                 # how long we wait for the host's ACK of our DATA frame
ACK_TIMEOUTS = 5


def _lfsr(n: int) -> bytes:
    out, r = bytearray(), 0x42
    for _ in range(n):
        out.append(r)
        r = (r >> 1) ^ 0xB8 if r & 1 else r >> 1
    return bytes(out)


_RANDOM = _lfsr(256)


def randomize(data: bytes) -> bytes:
    if len(data) > len(_RANDOM):
        raise ValueError(f"EZSP frame too long for ASH: {len(data)} bytes")
    return bytes(a ^ b for a, b in zip(data, _RANDOM))


def with_crc(body: bytes) -> bytes:
    return body + binascii.crc_hqx(body, 0xFFFF).to_bytes(2, "big")


def stuff(frame: bytes) -> bytes:
    out = bytearray()
    for c in frame:
        out += bytes((ESCAPE, c ^ 0x20)) if c in RESERVED else bytes((c,))
    return bytes(out) + bytes((FLAG,))


def data_frame(frm: int, ack: int, ezsp: bytes, re_tx: bool = False) -> bytes:
    return stuff(with_crc(bytes(((frm & 7) << 4 | int(re_tx) << 3 | (ack & 7),)) + randomize(ezsp)))


def ack_frame(ack: int) -> bytes:
    return stuff(with_crc(bytes((0x80 | (ack & 7),))))


def nak_frame(ack: int) -> bytes:
    return stuff(with_crc(bytes((0xA0 | (ack & 7),))))


def rstack_frame(code: int) -> bytes:
    return stuff(with_crc(bytes((0xC1, ASH_VERSION, code))))


class AshDecoder:
    """Turns a byte stream into unstuffed, CRC-checked frames (control byte + data)."""

    def __init__(self) -> None:
        self._buf = bytearray()
        self._discard = False

    def feed(self, data: bytes) -> list[bytes | None]:
        """Return frames; None stands for a frame that failed to parse (bad CRC or escape)."""
        frames: list[bytes | None] = []
        for c in data:
            if c == FLAG:
                if self._buf and not self._discard:
                    frames.append(self._finish(bytes(self._buf)))
                self._buf.clear()
                self._discard = False
            elif c == CANCEL:
                self._buf.clear()
                self._discard = False
            elif c == SUBSTITUTE:
                self._buf.clear()
                self._discard = True
            elif c in (XON, XOFF):
                continue
            elif not self._discard:
                self._buf.append(c)
        return frames

    @staticmethod
    def _finish(raw: bytes) -> bytes | None:
        out, esc = bytearray(), False
        for c in raw:
            if esc:
                b = c ^ 0x20
                if b not in RESERVED:
                    return None
                out.append(b)
                esc = False
            elif c == ESCAPE:
                esc = True
            else:
                out.append(c)
        if esc or len(out) < 3 or binascii.crc_hqx(bytes(out[:-2]), 0xFFFF) != int.from_bytes(out[-2:], "big"):
            return None
        return bytes(out[:-2])


class AshSession:
    """The NCP side of ASH for one connected host."""

    def __init__(self, writer: asyncio.StreamWriter, *, to_ncp: Callable[[bytes], Awaitable[None]],
                 reset_ncp: Callable[[], Awaitable[int]], t_rx_ack: float = T_RX_ACK) -> None:
        self._writer = writer
        self._to_ncp = to_ncp
        self._reset_ncp = reset_ncp
        self._t_rx_ack = t_rx_ack
        self._decoder = AshDecoder()
        self._rx_seq = 0            # next frame number expected from the host
        self._tx_seq = 0            # number of our next DATA frame
        self._acked = asyncio.Event()
        self._tx_frm: int | None = None
        self._nak = asyncio.Event()
        self._rejecting = False
        self._connected = False     # True once RST has been answered with RSTACK
        self._outbox: asyncio.Queue[bytes] = asyncio.Queue()
        self._tx_task: asyncio.Task | None = None
        self._to_ncp_lock = asyncio.Lock()
        self.failed = asyncio.Event()

    def _write(self, data: bytes) -> None:
        if not self._writer.is_closing():
            self._writer.write(data)

    def start(self) -> None:
        self._tx_task = asyncio.create_task(self._tx_loop(), name="ash-tx")

    async def stop(self) -> None:
        if self._tx_task:
            self._tx_task.cancel()
            with contextlib.suppress(asyncio.CancelledError, Exception):
                await self._tx_task

    def from_ncp(self, ezsp: bytes) -> None:
        """EZSP frame from the chip, to be delivered to the host."""
        if self._connected:
            self._outbox.put_nowait(ezsp)

    async def feed(self, data: bytes) -> None:
        for frame in self._decoder.feed(data):
            if frame is None:
                _LOG.debug("host frame failed to parse")
                self._reject()
                continue
            await self._handle(frame)

    def _reject(self) -> None:
        if self._connected and not self._rejecting:
            self._write(nak_frame(self._rx_seq))
            self._rejecting = True

    def _note_ack(self, ack: int) -> None:
        if self._tx_frm is not None and ack == (self._tx_frm + 1) % 8:
            self._acked.set()

    async def _handle(self, frame: bytes) -> None:
        control = frame[0]
        if control == 0xC0:                                   # RST
            await self._on_rst()
        elif not self._connected:
            _LOG.debug("ignoring frame 0x%02x before RST", control)
        elif control & 0x80 == 0:                             # DATA
            frm, re_tx, ack = control >> 4 & 7, bool(control & 0x08), control & 7
            self._note_ack(ack)
            if frm == self._rx_seq:
                self._rx_seq = (frm + 1) % 8
                self._rejecting = False
                self._write(ack_frame(self._rx_seq))
                async with self._to_ncp_lock:
                    await self._to_ncp(randomize(frame[1:]))
            elif re_tx:
                self._write(ack_frame(self._rx_seq))          # duplicate: ACK again
            else:
                self._reject()
        elif control & 0xE0 == 0x80:                          # ACK
            self._note_ack(control & 7)
        elif control & 0xE0 == 0xA0:                          # NAK
            self._nak.set()
        else:
            _LOG.debug("ignoring host frame 0x%02x", control)

    async def _on_rst(self) -> None:
        _LOG.info("host sent RST")
        self._connected = False
        while not self._outbox.empty():
            self._outbox.get_nowait()
        code = await self._reset_ncp()
        self._rx_seq = self._tx_seq = 0
        self._tx_frm = None
        self._rejecting = False
        self._connected = True
        self._write(rstack_frame(code))
        _LOG.info("sent RSTACK (0x%02x)", code)

    async def _tx_loop(self) -> None:
        while True:
            ezsp = await self._outbox.get()
            if not self._connected:
                continue
            frm = self._tx_frm = self._tx_seq
            self._tx_seq = (self._tx_seq + 1) % 8
            for attempt in range(ACK_TIMEOUTS):
                self._acked.clear()
                self._nak.clear()
                self._write(data_frame(frm, self._rx_seq, ezsp, re_tx=attempt > 0))
                acked = asyncio.create_task(self._acked.wait())
                nakked = asyncio.create_task(self._nak.wait())
                done, pending = await asyncio.wait({acked, nakked}, timeout=self._t_rx_ack,
                                                   return_when=asyncio.FIRST_COMPLETED)
                for t in pending:
                    t.cancel()
                if acked in done:
                    break
                _LOG.debug("DATA %d not acknowledged (attempt %d)", frm, attempt + 1)
            else:
                _LOG.warning("host stopped acknowledging; closing the connection")
                self.failed.set()
                return
            self._tx_frm = None


class Bridge:
    """Owns the dongle (through CPC) and serves one ASH host at a time over TCP."""

    def __init__(self, open_transport: Callable[[], Awaitable[tuple]], *,
                 primary_kwargs: dict | None = None, t_rx_ack: float = T_RX_ACK,
                 ble=None) -> None:
        self._open_transport = open_transport
        self._ble = ble                      # hci_tcp.HciTcpServer, attached after every reboot
        self._primary_kwargs = primary_kwargs or {}
        self._t_rx_ack = t_rx_ack
        self._primary: cpc.CpcPrimary | None = None
        self._ep: cpc.Endpoint | None = None
        self._reader_task: asyncio.Task | None = None
        self._session: AshSession | None = None
        self._fresh = False                 # rebooted since the last EZSP frame was sent
        self._reset_lock = asyncio.Lock()
        self._reboot_task: asyncio.Task | None = None
        self._handlers: set[asyncio.Task] = set()
        self._closing = False
        self._server: asyncio.base_events.Server | None = None
        self.reboots = 0
        self.ezsp_to_ncp = 0                # EZSP frames host -> chip
        self.ezsp_from_ncp = 0              # EZSP frames chip -> host (responses and callbacks)

    async def _close_ncp(self) -> None:
        if self._ble is not None:
            with contextlib.suppress(Exception):
                await self._ble.detach()
        if self._reader_task:
            self._reader_task.cancel()
            with contextlib.suppress(asyncio.CancelledError, Exception):
                await self._reader_task
            self._reader_task = None
        if self._primary:
            with contextlib.suppress(Exception):
                await self._primary.close()
        self._primary = self._ep = None

    async def reboot_ncp(self) -> None:
        """Reboot the chip through CPC and connect the Zigbee endpoint again."""
        async with self._reset_lock:
            await self._close_ncp()
            reader, writer = await self._open_transport()
            self._primary = cpc.CpcPrimary(reader, writer, **self._primary_kwargs)
            info = await self._primary.start(reset=True)
            self._ep = await self._primary.connect_endpoint(cpc.EP_ZIGBEE)
            self._reader_task = asyncio.create_task(self._read_ncp(self._ep), name="ezsp-rx")
            self._fresh = True
            self.reboots += 1
            if self._ble is not None:
                # The Bluetooth side must never take Zigbee down with it.
                try:
                    hci_ep = await self._primary.connect_endpoint(cpc.EP_BLUETOOTH_RCP)
                    await self._ble.attach(hci_ep)
                except Exception:
                    _LOG.exception("Bluetooth side failed to start; Zigbee continues")
            _LOG.info("chip rebooted (CPC %s, app %r); Zigbee endpoint connected",
                      ".".join(map(str, info.cpc_version)), info.app_version)

    async def _read_ncp(self, ep: cpc.Endpoint) -> None:
        try:
            while True:
                ezsp = await ep.read()
                self.ezsp_from_ncp += 1
                if self._session:
                    self._session.from_ncp(ezsp)
        except cpc.CpcError as exc:
            _LOG.warning("CPC link lost: %s", exc)
            self._primary = self._ep = None
            if self._session:
                self._session.failed.set()   # drop the host; it reconnects and resets

    async def _to_ncp(self, ezsp: bytes) -> None:
        if self._ep is None:
            raise cpc.CpcConnectionLost("no CPC link")
        self._fresh = False
        self.ezsp_to_ncp += 1
        await self._ep.write(ezsp)

    def _schedule_reboot(self) -> None:
        if self._reboot_task is None or self._reboot_task.done():
            self._reboot_task = asyncio.create_task(self.reboot_ncp(), name="reboot")

    async def _reset_for_host(self) -> int:
        # A reboot started when the previous host left may still be running: use it rather
        # than rebooting twice (ZHA's radio probe connects and disconnects several times).
        if self._reboot_task is not None and not self._reboot_task.done():
            with contextlib.suppress(Exception):
                await self._reboot_task
        if not self._fresh or self._ep is None:
            await self.reboot_ncp()
        return RESET_SOFTWARE

    async def _serve(self, reader: asyncio.StreamReader, writer: asyncio.StreamWriter) -> None:
        peer = writer.get_extra_info("peername")
        if self._session is not None:
            _LOG.warning("refusing %s: a host is already connected", peer)
            writer.close()
            return
        _LOG.info("host connected from %s", peer)
        me = asyncio.current_task()
        if me is not None:
            self._handlers.add(me)
        session = self._session = AshSession(writer, to_ncp=self._to_ncp,
                                             reset_ncp=self._reset_for_host, t_rx_ack=self._t_rx_ack)
        session.start()
        # No unsolicited RSTACK on connect: bellows treats one that arrives before it starts
        # waiting as an unexpected reset (bellows/uart.py reset_received). It waits 2 s on
        # socket:// ports and then sends RST, which we answer at once when the chip is fresh.
        read = asyncio.create_task(self._pump(reader, session))
        failed = asyncio.create_task(session.failed.wait())
        try:
            await asyncio.wait({read, failed}, return_when=asyncio.FIRST_COMPLETED)
        finally:
            for t in (read, failed):
                t.cancel()
            await session.stop()
            self._session = None
            writer.close()
            _LOG.info("host %s disconnected", peer)
            if me is not None:
                self._handlers.discard(me)
            if not self._fresh and not self._closing:   # a fresh chip for the next start
                self._schedule_reboot()

    @staticmethod
    async def _pump(reader: asyncio.StreamReader, session: AshSession) -> None:
        while data := await reader.read(4096):
            await session.feed(data)

    def link_counters(self) -> str:
        """CPC link error counts since the last chip reboot (a reboot starts a new link)."""
        p = self._primary
        if p is None:
            return "no link"
        d = p.decoder
        parts = [f"skipped bytes {d.discarded_bytes}, bad headers {d.header_errors}, "
                 f"checksum errors {d.fcs_errors}"]
        for ep in p._endpoints.values():
            st = ep.stats
            parts.append(f"ep{ep.id} resent {st.retransmits}, duplicates {st.rx_duplicates}, "
                         f"rejects {st.rejects_sent} sent/{st.rejects_received} received")
        return "; ".join(parts)

    async def start(self, host: str = "127.0.0.1", port: int = 6638) -> int:
        await self.reboot_ncp()
        self._server = await asyncio.start_server(self._serve, host, port)
        bound = self._server.sockets[0].getsockname()[1]
        _LOG.info("serving ASH on %s:%d", host, bound)
        return bound

    async def close(self) -> None:
        self._closing = True
        if self._server:
            self._server.close()
        # Server.wait_closed() waits for every connection handler, so end the host's session
        # first; a connected ZHA would otherwise keep shutdown waiting forever.
        for task in list(self._handlers):
            task.cancel()
        if self._handlers:
            await asyncio.gather(*self._handlers, return_exceptions=True)
        if self._reboot_task is not None:
            self._reboot_task.cancel()
            with contextlib.suppress(asyncio.CancelledError, Exception):
                await self._reboot_task
        if self._server:
            self._server.close()
            await self._server.wait_closed()
        await self._close_ncp()


async def _main(args: argparse.Namespace) -> None:
    scanner = None
    if not args.no_bluetooth:
        import hci_tcp
        scanner = hci_tcp.HciTcpServer(args.host, args.hci_tcp)
    bridge = Bridge(lambda: cpc.open_serial(args.device, args.baud), ble=scanner)
    await bridge.start(args.host, args.port)

    stalls = {"max": 0.0}

    async def loop_watch() -> None:
        # A stalled event loop stops everything at once: CPC acknowledgements, Zigbee, HCI.
        loop = asyncio.get_running_loop()
        while True:
            t = loop.time()
            await asyncio.sleep(0.1)
            lag = loop.time() - t - 0.1
            stalls["max"] = max(stalls["max"], lag)
            if lag > 0.25:
                _LOG.warning("bridge event loop stalled for %.0f ms", lag * 1000)

    async def stats() -> None:
        last = (0, 0, 0)
        while True:
            await asyncio.sleep(args.stats_interval)
            now = (bridge.ezsp_to_ncp, bridge.ezsp_from_ncp, scanner.adverts if scanner else 0)
            d = [b - a for a, b in zip(last, now)]
            _LOG.info("last %ds: EZSP %d to chip, %d from chip; Bluetooth %d HCI events; "
                      "chip reboots so far %d", args.stats_interval, d[0], d[1], d[2], bridge.reboots)
            if scanner is not None:
                c = scanner.commands.take()
                _LOG.info("last %ds: HCI commands %d, answered %d, slowest %.0f ms, over %.0f ms %d, "
                          "unanswered at %.0f s %d (%d answered later); slowest CPC write %.0f ms",
                          args.stats_interval, c.commands, c.answered, c.slowest_s * 1000,
                          hci_tcp.SLOW_COMMAND * 1000, c.slow, hci_tcp.UNANSWERED, c.unanswered,
                          c.late, c.slowest_write_s * 1000)
            _LOG.info("CPC link since chip reboot: %s; longest event loop stall in the last %ds: "
                      "%.0f ms", bridge.link_counters(), args.stats_interval, stalls["max"] * 1000)
            stalls["max"] = 0.0
            last = now

    tasks = [asyncio.create_task(stats()), asyncio.create_task(loop_watch())]
    try:
        await asyncio.Event().wait()
    finally:
        for t in tasks:
            t.cancel()
        await bridge.close()


if __name__ == "__main__":
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("device", help="serial device of the dongle, e.g. /dev/cu.usbserial-XXXX")
    ap.add_argument("--baud", type=int, default=460800)
    ap.add_argument("--host", default="127.0.0.1")
    ap.add_argument("--port", type=int, default=6638)
    ap.add_argument("--no-bluetooth", action="store_true", help="Zigbee only")
    ap.add_argument("--hci-tcp", type=int, default=14433, metavar="PORT",
                    help="serve the chip's raw HCI (H4) on this TCP port")
    ap.add_argument("--stats-interval", type=int, default=300, help="seconds between statistics lines")
    ap.add_argument("-v", "--verbose", action="store_true")
    a = ap.parse_args()
    logging.basicConfig(level=logging.DEBUG if a.verbose else logging.INFO,
                        format="%(asctime)s %(levelname)s %(name)s: %(message)s")
    with contextlib.suppress(KeyboardInterrupt):
        asyncio.run(_main(a))
