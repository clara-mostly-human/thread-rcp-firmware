"""Owns a dongle running the thread-ble firmware: Thread RCP to otbr-agent, Bluetooth to nimbled.

One process owns the UART and is the CPC host (cpc.py). It routes the chip's CPC endpoints:
  endpoint 12  OpenThread RCP (Spinel)   -> Unix socket for otbr-agent's RCP vendor interface
                                            (spinel_socket.py; radio URL spinel+cpc://<socket>)
  endpoint 14  Bluetooth controller (HCI) -> raw HCI (H4) on a local TCP port for nimbled
                                            (hci_tcp.py, the same service the zigbee-ble bridge has)

The chip is rebooted when the bridge starts, when the CPC link is lost (transport error, or the
chip reset on its own), and when otbr-agent asks for a hardware reset of its RCP. After every
reboot both endpoints are connected again. otbr-agent stays connected through a reboot and
recovers through OpenThread's RCP restoration; nimbled is disconnected and reconnects, as with
the zigbee-ble bridge. A Bluetooth failure never stops Thread.

    uv run --no-project --with pyserial python thread_ble_bridge.py /dev/cu.usbserial-XXXX \\
        --spinel-socket /path/to/spinel.sock --hci-tcp 14433
"""

from __future__ import annotations

import argparse
import asyncio
import contextlib
import logging
from collections.abc import Awaitable, Callable

import cpc
import spinel_socket

_LOG = logging.getLogger("thread_ble_bridge")

RETRY_DELAYS = (1.0, 2.0, 5.0, 10.0)     # s between attempts to bring the chip up; last repeats


class ThreadBleBridge:
    def __init__(self, open_transport: Callable[[], Awaitable[tuple]], *,
                 spinel: spinel_socket.SpinelSocketServer, ble=None,
                 primary_kwargs: dict | None = None,
                 retry_delays: tuple[float, ...] = RETRY_DELAYS) -> None:
        self._open_transport = open_transport
        self.spinel = spinel
        self.ble = ble                       # hci_tcp.HciTcpServer or None
        self._primary_kwargs = primary_kwargs or {}
        self._retry_delays = retry_delays
        self._primary: cpc.CpcPrimary | None = None
        self._reset_requested = asyncio.Event()
        self._up = asyncio.Event()
        self._task: asyncio.Task | None = None
        self.reboots = 0                     # successful bring-ups (each one reboots the chip)
        self.requested_resets = 0
        self.link_losses = 0
        self.failed_attempts = 0
        self.info: cpc.SecondaryInfo | None = None

    def request_reset(self) -> None:
        """otbr-agent asked for a hardware reset of the RCP (spinel_socket RESET)."""
        self._reset_requested.set()

    async def start(self, *, wait_up: float | None = 30.0) -> None:
        await self.spinel.start()
        self._task = asyncio.create_task(self._run(), name="thread-ble-link")
        if wait_up is not None:
            async with asyncio.timeout(wait_up):
                await self._up.wait()

    async def wait_up(self) -> None:
        await self._up.wait()

    async def _bring_up(self) -> None:
        reader, writer = await self._open_transport()
        primary = cpc.CpcPrimary(reader, writer, **self._primary_kwargs)
        self._primary = primary
        info = await primary.start(reset=True)
        ep = await primary.connect_endpoint(cpc.EP_15_4)
        await self.spinel.attach(ep, max_frame=primary.max_tx_payload,
                                 reset_reason=info.reset_reason)
        self.info = info
        self.reboots += 1
        _LOG.info("chip up (CPC %s, app %r, reset reason %s); Spinel endpoint connected",
                  ".".join(map(str, info.cpc_version)), info.app_version, info.reset_reason)
        if self.ble is not None:
            try:
                hci_ep = await primary.connect_endpoint(cpc.EP_BLUETOOTH_RCP)
                await self.ble.attach(hci_ep)
            except Exception:
                _LOG.exception("Bluetooth side failed to start; Thread continues")

    async def _tear_down(self) -> None:
        self._up.clear()
        await self.spinel.detach()
        if self.ble is not None:
            with contextlib.suppress(Exception):
                await self.ble.detach()
        if self._primary is not None:
            with contextlib.suppress(Exception):
                await self._primary.close()
            self._primary = None

    async def _run(self) -> None:
        failures = 0
        while True:
            self._reset_requested.clear()
            try:
                await self._bring_up()
            except Exception as exc:          # noqa: BLE001 - keep trying; the chip may come back
                self.failed_attempts += 1
                delay = self._retry_delays[min(failures, len(self._retry_delays) - 1)]
                failures += 1
                _LOG.warning("could not bring the chip up (%s); retrying in %.0f s", exc, delay)
                await self._tear_down()
                await asyncio.sleep(delay)
                continue
            failures = 0
            self._up.set()
            assert self._primary is not None
            dead = asyncio.create_task(self._primary.wait_dead())
            reset = asyncio.create_task(self._reset_requested.wait())
            try:
                await asyncio.wait({dead, reset}, return_when=asyncio.FIRST_COMPLETED)
            finally:
                dead.cancel()
                reset.cancel()
            if self._reset_requested.is_set():
                self.requested_resets += 1
                _LOG.warning("rebooting the chip for otbr-agent (hardware reset of the RCP)")
            else:
                self.link_losses += 1
                _LOG.warning("CPC link lost (%s); rebooting the chip", self._primary._dead)
            await self._tear_down()

    def link_counters(self) -> str:
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

    async def close(self) -> None:
        if self._task is not None:
            self._task.cancel()
            with contextlib.suppress(asyncio.CancelledError, Exception):
                await self._task
            self._task = None
        await self._tear_down()
        await self.spinel.close()
        if self.ble is not None:
            with contextlib.suppress(Exception):
                await self.ble.close()


async def _main(args: argparse.Namespace) -> None:
    ble = None
    if not args.no_bluetooth:
        import hci_tcp
        ble = hci_tcp.HciTcpServer(args.host, args.hci_tcp)
    bridge: ThreadBleBridge | None = None
    spinel = spinel_socket.SpinelSocketServer(args.spinel_socket, bus_speed=args.baud,
                                              request_reset=lambda: bridge.request_reset())
    bridge = ThreadBleBridge(lambda: cpc.open_serial(args.device, args.baud), spinel=spinel, ble=ble)
    await bridge.start(wait_up=None)

    async def stats() -> None:
        while True:
            await asyncio.sleep(args.stats_interval)
            s = spinel.stats.take()
            _LOG.info("last %ds: Spinel %d frames to chip, %d from chip (%d to otbr-agent); dropped "
                      "%d while rebooting, %d too long, %d failed; %d malformed chip payloads; "
                      "slowest CPC write %.0f ms; chip reboots so far %d (%d for otbr-agent, %d "
                      "after link loss)", args.stats_interval, s.to_rcp, s.from_rcp, s.to_client,
                      s.dropped_rebooting, s.dropped_too_long, s.dropped_write_failed,
                      s.malformed_payloads, s.slowest_write_s * 1000, bridge.reboots,
                      bridge.requested_resets, bridge.link_losses)
            if ble is not None:
                c = ble.commands.take()
                _LOG.info("last %ds: Bluetooth %d HCI events; HCI commands %d, answered %d, "
                          "slowest %.0f ms, unanswered %d", args.stats_interval, ble.adverts,
                          c.commands, c.answered, c.slowest_s * 1000, c.unanswered)
            _LOG.info("CPC link since chip reboot: %s", bridge.link_counters())

    task = asyncio.create_task(stats())
    try:
        await asyncio.Event().wait()
    finally:
        task.cancel()
        await bridge.close()


if __name__ == "__main__":
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("device", help="serial device of the dongle, e.g. /dev/cu.usbserial-XXXX")
    ap.add_argument("--baud", type=int, default=460800)
    ap.add_argument("--spinel-socket", required=True, metavar="PATH",
                    help="Unix socket for otbr-agent (radio URL spinel+cpc://PATH)")
    ap.add_argument("--host", default="127.0.0.1", help="address for the raw HCI port")
    ap.add_argument("--hci-tcp", type=int, default=14433, metavar="PORT",
                    help="serve the chip's raw HCI (H4) on this TCP port")
    ap.add_argument("--no-bluetooth", action="store_true", help="Thread only")
    ap.add_argument("--stats-interval", type=int, default=300, help="seconds between statistics lines")
    ap.add_argument("-v", "--verbose", action="store_true")
    a = ap.parse_args()
    logging.basicConfig(level=logging.DEBUG if a.verbose else logging.INFO,
                        format="%(asctime)s %(levelname)s %(name)s: %(message)s")
    with contextlib.suppress(KeyboardInterrupt):
        asyncio.run(_main(a))
