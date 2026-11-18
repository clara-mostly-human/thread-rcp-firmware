"""End to end without hardware: OpenThread host -> vendor interface -> socket -> bridge -> CPC -> RCP.

What runs, all real code except the CPC secondary and the RCP's CPC glue:
  host     ot-cli (posix, OpenThread 3de40968 as pinned by ot-br-posix 285bcb54) built with
           thread-ble/otbr/cpc_socket_interface.cpp, radio URL spinel+cpc://<socket>
  bridge   zigbee-ble/host/thread_ble_bridge.py + spinel_socket.py + cpc.py, unchanged
  chip     tests/sim_secondary.SimSecondary (CPC secondary modelled on the SDK, no shared code
           with cpc.py) with, on endpoint 12, ProcessRcp below: the ncp_cpc.cpp framing in front
           of a real OpenThread RCP (simulation ot-rcp, Spinel over HDLC on stdio)
  peer     a second Thread node (simulation ot-cli-ftd) on the same simulated radio

Checks:
  1. the host stack initialises the RCP through the whole chain and reads its version;
  2. the host forms a network (leader), the peer joins, pings both ways over the simulated radio;
  3. the chip resets on its own (RCP process killed, CPC reset reason sent): the bridge reboots
     and reconnects, the host stays connected, OpenThread runs RCP restoration, pings work again;
  4. the RCP hangs (process stopped, CPC link still up): OpenThread's software reset gets no
     answer, it calls HardwareReset(), the bridge reboots the chip and reports it back; the host
     then exits (the RCP holds its boot notification, see docs/thread-ble.md).

    python3 thread-ble/otbr/e2e/run_e2e.py <build dir of build-ot.sh>
"""

from __future__ import annotations

import argparse
import asyncio
import contextlib
import logging
import os
import re
import shutil
import signal
import sys
import tempfile
import time

HERE = os.path.dirname(os.path.abspath(__file__))
HOST = os.path.join(HERE, "..", "..", "..", "zigbee-ble", "host")
sys.path.insert(0, HOST)
sys.path.insert(0, os.path.join(HOST, "tests"))

import cpc  # noqa: E402
import spinel_socket  # noqa: E402
import thread_ble_bridge  # noqa: E402
from sim_secondary import SimSecondary, make_link  # noqa: E402

LOG = logging.getLogger("e2e")

# --- HDLC-lite as OpenThread frames Spinel on a UART (src/lib/hdlc/hdlc.cpp) --------------------

FLAG, ESC, XON, XOFF, SPECIAL = 0x7E, 0x7D, 0x11, 0x13, 0xF8
_ESCAPED = {FLAG, ESC, XON, XOFF, SPECIAL}


def _fcs_table() -> list[int]:
    t = []
    for i in range(256):
        c = i
        for _ in range(8):
            c = (c >> 1) ^ 0x8408 if c & 1 else c >> 1
        t.append(c)
    return t


_FCS = _fcs_table()


def fcs16(data: bytes, fcs: int = 0xFFFF) -> int:
    for b in data:
        fcs = (fcs >> 8) ^ _FCS[(fcs ^ b) & 0xFF]
    return fcs


def hdlc_encode(frame: bytes) -> bytes:
    fcs = fcs16(frame) ^ 0xFFFF
    out = bytearray()
    for b in frame + bytes((fcs & 0xFF, fcs >> 8)):
        out += bytes((ESC, b ^ 0x20)) if b in _ESCAPED else bytes((b,))
    return bytes(out) + bytes((FLAG,))


class HdlcDecoder:
    def __init__(self) -> None:
        self._buf = bytearray()
        self._esc = False
        self.bad = 0

    def feed(self, data: bytes) -> list[bytes]:
        out = []
        for b in data:
            if b == FLAG:
                if len(self._buf) >= 3 and fcs16(bytes(self._buf)) == 0xF0B8:
                    out.append(bytes(self._buf[:-2]))
                elif self._buf:
                    self.bad += 1
                self._buf.clear()
                self._esc = False
            elif b == ESC:
                self._esc = True
            else:
                self._buf.append(b ^ 0x20 if self._esc else b)
                self._esc = False
        return out


# --- the chip's endpoint 12: ncp_cpc.cpp in front of a real RCP --------------------------------

class ProcessRcp:
    """A SimSecondary app: simulation ot-rcp behind the ncp_cpc.cpp framing.

    Host frames go to the RCP one per CPC payload; the RCP's frames are queued until the host
    has sent one (mIsReady) and then sent concatenated with u16 big-endian lengths.
    """

    def __init__(self, exe: str, node_id: int, env: dict, chunk: int = 2048) -> None:
        self.exe, self.node_id, self.env, self.chunk = exe, node_id, env, chunk
        self.proc: asyncio.subprocess.Process | None = None
        self._dec = HdlcDecoder()
        self._queue: list[bytes] = []
        self._pending: list[bytes] = []
        self._sim = None
        self._ep = 12
        self.ready = False
        self.to_rcp = 0
        self.from_rcp = 0
        self._starting: asyncio.Task | None = None

    async def start(self) -> None:
        proc = await asyncio.create_subprocess_exec(
            self.exe, str(self.node_id), stdin=asyncio.subprocess.PIPE,
            stdout=asyncio.subprocess.PIPE, stderr=asyncio.subprocess.DEVNULL, env=self.env)
        self.proc = proc
        asyncio.get_running_loop().create_task(self._read(proc))
        for w in self._pending:
            proc.stdin.write(w)
        self._pending.clear()

    async def _read(self, proc) -> None:
        while data := await proc.stdout.read(4096):
            if proc is not self.proc:
                return
            for frame in self._dec.feed(data):
                self.from_rcp += 1
                self._queue.append(frame)
            self._flush()

    def kill(self) -> None:
        if self.proc is not None and self.proc.returncode is None:
            with contextlib.suppress(ProcessLookupError):
                self.proc.kill()

    def stop_process(self) -> None:
        """Freeze the RCP (SIGSTOP): a hung OpenThread task while CPC itself still answers."""
        os.kill(self.proc.pid, signal.SIGSTOP)

    def on_reboot(self) -> None:
        self.kill()
        self.proc = None
        self.ready = False
        self._queue.clear()
        self._dec = HdlcDecoder()
        self._starting = asyncio.get_running_loop().create_task(self.start())

    def __call__(self, sim, ep_id: int, data: bytes) -> None:
        self._sim, self._ep = sim, ep_id
        self.ready = True
        self.to_rcp += 1
        enc = hdlc_encode(data)
        if self.proc is not None and self.proc.returncode is None:
            self.proc.stdin.write(enc)
        else:
            self._pending.append(enc)
        self._flush()

    def _flush(self) -> None:
        if not self.ready or self._sim is None:
            return
        while self._queue:
            out = bytearray()
            while self._queue and len(out) + 2 + len(self._queue[0]) < self.chunk:
                f = self._queue.pop(0)
                out += len(f).to_bytes(2, "big") + f
            self._sim.send_data(self._ep, bytes(out))


class Chip:
    """The dongle: every open of the port is the same chip, freshly rebooted by the bridge."""

    def __init__(self, rcp_exe: str, env: dict) -> None:
        self.rcp_exe, self.env = rcp_exe, env
        self.sims: list[SimSecondary] = []
        self.rcps: list[ProcessRcp] = []

    async def open(self):
        for r in self.rcps:          # one chip: the previous incarnation is gone
            r.kill()
        (hr, hw), (sr, sw) = make_link()
        rcp = ProcessRcp(self.rcp_exe, 1, self.env)
        await rcp.start()
        sim = SimSecondary(endpoints=(12, 14), apps={12: rcp}, reset_reason=114)
        sim.start(sr, sw)
        self.sims.append(sim)
        self.rcps.append(rcp)
        return hr, hw

    def crash(self) -> None:
        """The chip resets on its own (watchdog): its RCP dies and CPC reports the reset."""
        self.rcps[-1].kill()
        self.sims[-1].send_reset_reason(cpc.Status.RESET_WATCHDOG)

    async def close(self) -> None:
        for r in self.rcps:
            r.kill()
        for s in self.sims:
            await s.stop()


# --- OpenThread CLI processes ------------------------------------------------------------------

class Cli:
    def __init__(self, name: str, argv: list[str], env: dict, cwd: str, stderr_path: str | None) -> None:
        self.name, self.argv, self.env, self.cwd = name, argv, env, cwd
        self.stderr_path = stderr_path
        self.proc: asyncio.subprocess.Process | None = None
        self._buf = ""
        self.transcript: list[str] = []

    async def start(self) -> None:
        err = open(self.stderr_path, "wb") if self.stderr_path else asyncio.subprocess.DEVNULL
        self.proc = await asyncio.create_subprocess_exec(
            *self.argv, stdin=asyncio.subprocess.PIPE, stdout=asyncio.subprocess.PIPE,
            stderr=err, env=self.env, cwd=self.cwd)

    async def cmd(self, line: str, timeout: float = 10.0) -> list[str]:
        assert self.proc is not None
        self.proc.stdin.write((line + "\n").encode())
        await self.proc.stdin.drain()
        out: list[str] = []
        async with asyncio.timeout(timeout):
            while True:
                while "\n" not in self._buf:
                    data = await self.proc.stdout.read(4096)
                    if not data:
                        raise ConnectionError(f"{self.name} exited (code {await self.proc.wait()}) "
                                              f"during {line!r}; output so far {out}")
                    self._buf += data.decode(errors="replace")
                text, self._buf = self._buf.split("\n", 1)
                text = text.strip().lstrip("> ").strip()
                if not text or text == line:
                    continue
                self.transcript.append(f"{self.name}: {text}")
                if text == "Done":
                    return out
                if text.startswith("Error"):
                    raise RuntimeError(f"{self.name} {line!r}: {text}")
                out.append(text)

    async def wait_state(self, states: tuple[str, ...], timeout: float) -> str:
        deadline = time.monotonic() + timeout
        state = ""
        while time.monotonic() < deadline:
            state = (await self.cmd("state"))[0]
            if state in states:
                return state
            await asyncio.sleep(0.5)
        raise TimeoutError(f"{self.name} state {state!r}, wanted {states}")

    async def ping(self, addr: str, timeout: float = 10.0) -> bool:
        lines = await self.cmd(f"ping {addr} 32 1 1 3", timeout=timeout)
        return any("1 packets received" in s for s in lines)

    async def close(self) -> None:
        if self.proc is not None and self.proc.returncode is None:
            self.proc.kill()
            await self.proc.wait()


# --- the test ----------------------------------------------------------------------------------

class Results:
    def __init__(self) -> None:
        self.rows: list[tuple[str, bool, str]] = []

    def check(self, name: str, ok: bool, detail: str = "") -> None:
        self.rows.append((name, ok, detail))
        LOG.info("%s %s %s", "PASS" if ok else "FAIL", name, detail)


async def run(build: str, keep: bool) -> int:
    host_cli = os.path.join(build, "posix", "src", "posix", "ot-cli")
    rcp_exe = os.path.join(build, "sim", "examples", "apps", "ncp", "ot-rcp")
    peer_exe = os.path.join(build, "sim", "examples", "apps", "cli", "ot-cli-ftd")
    work = tempfile.mkdtemp(prefix="tbe2e")
    sock = os.path.join(work, "spinel.sock")
    env = dict(os.environ, PORT_BASE="19000")   # simulated radio on its own UDP ports
    res = Results()

    chip = Chip(rcp_exe, env)
    bridge: thread_ble_bridge.ThreadBleBridge | None = None
    spinel = spinel_socket.SpinelSocketServer(sock, request_reset=lambda: bridge.request_reset())
    bridge = thread_ble_bridge.ThreadBleBridge(chip.open, spinel=spinel, ble=None)
    host_log = os.path.join(work, "host-stderr.log")
    os.makedirs(os.path.join(work, "host-data"))
    host = Cli("host", [host_cli, "-v", "-d", "4", "--data-path", os.path.join(work, "host-data"),
                        f"spinel+cpc://{sock}?connect-timeout=5"], env, work, host_log)
    peer = Cli("peer", [peer_exe, "2"], env, work, None)
    try:
        await bridge.start(wait_up=10)
        res.check("bridge brings the chip up", bridge.reboots == 1,
                  f"CPC {bridge.info.cpc_version}, app {bridge.info.app_version!r}")

        # 1. initialisation through the whole chain
        await host.start()
        version = (await host.cmd("rcp version", timeout=20))[0]
        res.check("host reads the RCP version through the vendor interface",
                  version.startswith("OPENTHREAD/"), version)
        # (Init() fails without a HELLO; the posix CLI drops log lines from inside otSysInit)
        res.check("one Spinel client, initialised over the socket",
                  spinel.clients == 1 and spinel.stats.to_rcp > 0,
                  f"{spinel.stats.to_rcp} frames to the RCP, {spinel.stats.from_rcp} back")

        # 2. a real network over the simulated radio
        await host.cmd("dataset init new")
        await host.cmd("dataset channel 15")
        await host.cmd("dataset commit active")
        tlvs = (await host.cmd("dataset active -x"))[0]
        await host.cmd("ifconfig up")
        await host.cmd("thread start")
        res.check("host forms a network", await host.wait_state(("leader",), 30) == "leader")

        await peer.start()
        await peer.cmd(f"dataset set active {tlvs}")
        await peer.cmd("ifconfig up")
        await peer.cmd("thread start")
        state = await peer.wait_state(("child", "router"), 30)
        res.check("peer joins it", True, state)
        host_ml = (await host.cmd("ipaddr mleid"))[0]
        peer_ml = (await peer.cmd("ipaddr mleid"))[0]
        res.check("peer pings host", await peer.ping(host_ml), host_ml)
        res.check("host pings peer", await host.ping(peer_ml), peer_ml)

        # 3. the chip resets on its own; the host stays connected and restores the RCP
        frames_before = spinel.stats.from_rcp
        chip.crash()
        async with asyncio.timeout(10):
            while bridge.reboots < 2:
                await asyncio.sleep(0.05)
        res.check("bridge reboots the chip after the unexpected reset",
                  bridge.link_losses == 1 and bridge.reboots == 2)
        ok = False
        for _ in range(20):                  # restoration happens on the host's next exchanges
            await asyncio.sleep(1)
            try:
                if await peer.ping(host_ml, timeout=10) and await host.ping(peer_ml, timeout=10):
                    ok = True
                    break
            except RuntimeError:
                pass
        with open(host_log, "rb") as f:
            log = f.read().decode(errors="replace")
        recovered = "RCP recovery is done" in log
        res.check("host runs RCP restoration", recovered,
                  "; ".join(ln.split("]", 1)[-1].strip() for ln in log.splitlines()
                            if re.search(r"Unexpected RCP reset|RCP failure|recover|RCP recovery", ln))[:300])
        res.check("pings work again after restoration", ok)
        res.check("host still leader", (await host.cmd("state"))[0] == "leader")
        LOG.info("Spinel frames from the chip since the reset: %d", spinel.stats.from_rcp - frames_before)

        # 4. the RCP hangs: OpenThread asks for a hardware reset
        chip.rcps[-1].stop_process()
        reboots = bridge.reboots
        try:
            await host.cmd("ping %s 32 3 1 3" % peer_ml, timeout=60)
        except (ConnectionError, RuntimeError, TimeoutError) as exc:
            LOG.info("host after the hang: %s", str(exc)[:200])
        async with asyncio.timeout(30):
            while host.proc.returncode is None and bridge.requested_resets == 0:
                await asyncio.sleep(0.2)
        async with asyncio.timeout(30):
            while bridge.reboots == reboots:
                await asyncio.sleep(0.1)
        with contextlib.suppress(TimeoutError):
            async with asyncio.timeout(15):
                await host.proc.wait()
        with open(host_log, "rb") as f:
            log = f.read().decode(errors="replace")
        hw = [ln.split("]", 1)[-1].strip() for ln in log.splitlines()
              if re.search(r"reboot the chip|chip rebooted|co-processor|Failed to reset|recover", ln)]
        res.check("hung RCP: HardwareReset() asks the bridge, the bridge reboots the chip",
                  bridge.requested_resets == 1 and bridge.reboots == reboots + 1,
                  f"requested {bridge.requested_resets}, reboots {bridge.reboots}")
        res.check("vendor interface hears the chip is back",
                  any("chip rebooted" in ln for ln in hw), "; ".join(hw[-6:])[:400])
        # Expected with the firmware as generated: after the reboot the RCP holds its boot
        # notification until the host sends a frame (ncp_cpc.cpp mIsReady), OpenThread waits for
        # it, gives up ("Failed to reset co-processor!") and exits; the Supervisor restarts it.
        res.check("host exits after the hardware reset (expected, see docs/thread-ble.md)",
                  host.proc.returncode == 1 and "Failed to reset co-processor!" in log,
                  f"exit code {host.proc.returncode}")
    except Exception as exc:                  # noqa: BLE001 - report, then clean up
        LOG.exception("e2e aborted")
        res.check("run completed", False, repr(exc)[:300])
    finally:
        await host.close()
        await peer.close()
        await bridge.close()
        await chip.close()
        LOG.info("work dir %s%s", work, " (kept)" if keep else "")
        if not keep:
            shutil.rmtree(work, ignore_errors=True)

    print("\nRESULTS")
    for name, ok, detail in res.rows:
        print(f"  {'PASS' if ok else 'FAIL'}  {name}" + (f"  [{detail}]" if detail else ""))
    return 0 if all(ok for _, ok, _ in res.rows) else 1


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("build", help="build directory of build-ot.sh")
    ap.add_argument("--keep", action="store_true", help="keep the work directory and its logs")
    ap.add_argument("-v", "--verbose", action="store_true")
    a = ap.parse_args()
    logging.basicConfig(level=logging.DEBUG if a.verbose else logging.INFO,
                        format="%(asctime)s %(levelname)s %(name)s: %(message)s")
    return asyncio.run(run(os.path.abspath(a.build), a.keep))


if __name__ == "__main__":
    sys.exit(main())
