"""Spinel on a Unix socket for otbr-agent, and the thread-ble bridge over a simulated chip."""

import asyncio
import contextlib
import os
import shutil
import socket
import stat
import struct
import tempfile

import pytest

import cpc
import hci_tcp
import spinel_socket as ss
import thread_ble_bridge
from sim_rcp import (CMD_GET, CMD_IS, CMD_RESET, FLAG, PROP_PROTOCOL_VERSION, RESET_STACK,
                     STATUS_RESET_POWER_ON, STATUS_RESET_UNKNOWN, FakeRcp, last_status)
from sim_secondary import FakeHci, SimSecondary, make_link
from test_cpc import FAST, async_test


@pytest.fixture
def sock_path():
    d = tempfile.mkdtemp(prefix="sp")          # AF_UNIX paths are limited to 104 bytes on macOS
    yield os.path.join(d, "spinel.sock")
    shutil.rmtree(d, ignore_errors=True)


# --- codec -------------------------------------------------------------------------------------

def test_messages_survive_any_chunking():
    stream = (ss.hello(256) + ss.encode(ss.SPINEL, b"\x80\x01\x02") + ss.encode(ss.RESET)
              + ss.reset_notice(None) + ss.encode(ss.SPINEL, bytes(range(256)) * 5))
    for size in (1, 2, 3, 7, 4096):
        r = ss.MessageReader()
        out = []
        for i in range(0, len(stream), size):
            out += r.feed(stream[i:i + size])
        assert out == [(ss.HELLO, b"\x01\x01\x00"), (ss.SPINEL, b"\x80\x01\x02"), (ss.RESET, b""),
                       (ss.RESET, b"\xff\xff\xff\xff"), (ss.SPINEL, bytes(range(256)) * 5)], size


def test_rcp_payload_splits_into_frames():
    a, b, c = b"\x80\x06\x00\x70", b"\x81\x06\x01\x04\x03", bytes([0x80, 0x06, 0x71]) + bytes(300)
    payload = b"".join(len(f).to_bytes(2, "big") + f for f in (a, b, c))
    assert ss.split_rcp_payload(payload) == [a, b, c]
    assert ss.split_rcp_payload(b"\x00\x04" + a) == [a]
    for broken in (b"\x00", b"\x00\x05" + a, b"\x00\x04" + a + b"\x00", b"\x00\x00",
                   b"\x00\x04" + a + b"\x00\x09\x80"):
        with pytest.raises(ValueError):
            ss.split_rcp_payload(broken)


def test_encode_refuses_oversized_payload():
    with pytest.raises(ValueError):
        ss.encode(ss.SPINEL, bytes(0x10000))


# --- server against a fake endpoint ------------------------------------------------------------

class FakeEp:
    def __init__(self):
        self.written = []
        self.to_host: asyncio.Queue = asyncio.Queue()
        self.fail_writes = False

    async def write(self, data):
        if self.fail_writes:
            raise cpc.CpcConnectionLost("gone")
        self.written.append(data)

    async def read(self, timeout=None):
        item = await self.to_host.get()
        if item is None:
            raise cpc.CpcConnectionLost("closed")
        return item


class Client:
    """What the vendor interface does on its side of the socket."""

    def __init__(self, reader, writer):
        self.reader, self.writer = reader, writer
        self.split = ss.MessageReader()
        self.pending: list = []

    @classmethod
    async def connect(cls, path):
        r, w = await asyncio.open_unix_connection(path)
        return cls(r, w)

    async def recv(self, timeout=2.0):
        async with asyncio.timeout(timeout):
            while not self.pending:
                data = await self.reader.read(4096)
                if not data:
                    raise ConnectionError("server closed the connection")
                self.pending += self.split.feed(data)
        return self.pending.pop(0)

    async def recv_spinel(self, timeout=2.0):
        kind, payload = await self.recv(timeout)
        assert kind == ss.SPINEL, (kind, payload)
        return payload

    def send(self, kind, payload=b""):
        self.writer.write(ss.encode(kind, payload))

    async def closed(self, timeout=2.0):
        async with asyncio.timeout(timeout):
            return await self.reader.read(1) == b""

    def close(self):
        self.writer.close()


async def until(cond, timeout=2.0):
    async with asyncio.timeout(timeout):
        while not cond():
            await asyncio.sleep(0.005)


@contextlib.asynccontextmanager
async def server(path, **kw):
    srv = ss.SpinelSocketServer(path, **kw)
    await srv.start()
    try:
        yield srv
    finally:
        await srv.close()


@async_test
async def test_hello_then_frames_both_ways(sock_path):
    async with server(sock_path) as srv:
        ep = FakeEp()
        await srv.attach(ep, max_frame=256, reset_reason=114)
        c = await Client.connect(sock_path)
        assert await c.recv() == (ss.HELLO, struct.pack(">BH", 1, 256))
        c.send(ss.SPINEL, b"\x80\x01\x02")
        c.send(ss.SPINEL, b"\x81\x02\x01")
        await until(lambda: len(ep.written) == 2)
        assert ep.written == [b"\x80\x01\x02", b"\x81\x02\x01"]
        # the chip concatenates; the client gets them one by one, in order
        frames = [b"\x80\x06\x00\x70", b"\x81\x06\x01\x04\x03"]
        ep.to_host.put_nowait(b"".join(len(f).to_bytes(2, "big") + f for f in frames))
        assert [await c.recv_spinel(), await c.recv_spinel()] == frames
        assert srv.stats.to_rcp == 2 and srv.stats.from_rcp == 2 and srv.stats.to_client == 2
        c.close()


@async_test
async def test_socket_is_private_and_a_stale_one_is_replaced(sock_path):
    s = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    s.bind(sock_path)                          # left behind by a crashed run
    s.close()
    async with server(sock_path):
        mode = os.lstat(sock_path).st_mode
        assert stat.S_ISSOCK(mode) and stat.S_IMODE(mode) == 0o600
    assert not os.path.exists(sock_path)


@async_test
async def test_refuses_to_replace_a_regular_file(sock_path):
    with open(sock_path, "w") as f:
        f.write("not a socket")
    with pytest.raises(FileExistsError):
        async with server(sock_path):
            pass
    assert os.path.isfile(sock_path)


@async_test
async def test_frames_while_rebooting_and_oversized_frames_are_dropped(sock_path):
    async with server(sock_path) as srv:
        c = await Client.connect(sock_path)
        assert await c.recv() == (ss.HELLO, struct.pack(">BH", 1, 0))     # chip not up yet
        c.send(ss.SPINEL, b"\x80\x01\x02")
        await until(lambda: srv.stats.dropped_rebooting == 1)
        ep = FakeEp()
        await srv.attach(ep, max_frame=8, reset_reason=None)
        assert await c.recv() == (ss.RESET, b"\xff\xff\xff\xff")            # chip is up now
        c.send(ss.SPINEL, bytes([0x80]) + bytes(8))                         # 9 > 8
        c.send(ss.SPINEL, b"\x80\x00")
        await until(lambda: ep.written == [b"\x80\x00"])
        assert srv.stats.dropped_too_long == 1
        ep.fail_writes = True
        c.send(ss.SPINEL, b"\x80\x00")
        await until(lambda: srv.stats.dropped_write_failed == 1)
        # a malformed chip payload is counted and skipped; the next one still gets through
        ep.to_host.put_nowait(b"\x00\x09\x80")
        ep.to_host.put_nowait(b"\x00\x02\x80\x00")
        assert await c.recv_spinel() == b"\x80\x00"
        assert srv.stats.malformed_payloads == 1
        c.close()


@async_test
async def test_client_stays_connected_across_a_reboot_and_is_told(sock_path):
    async with server(sock_path) as srv:
        await srv.attach(FakeEp(), max_frame=256, reset_reason=114)
        c = await Client.connect(sock_path)
        await c.recv()
        await srv.detach()
        ep2 = FakeEp()
        await srv.attach(ep2, max_frame=256, reset_reason=0x72)
        assert await c.recv() == (ss.RESET, (0x72).to_bytes(4, "big"))
        c.send(ss.SPINEL, b"\x80\x00")
        await until(lambda: ep2.written == [b"\x80\x00"])
        c.close()


@async_test
async def test_reset_request_goes_to_the_bridge(sock_path):
    asked = []
    async with server(sock_path, request_reset=lambda: asked.append(1)) as srv:
        await srv.attach(FakeEp(), max_frame=256, reset_reason=114)
        c = await Client.connect(sock_path)
        await c.recv()
        c.send(ss.RESET)
        await until(lambda: asked == [1])
        assert srv.stats.reset_requests == 1
        c.close()


@async_test
async def test_unknown_message_type_closes_the_connection(sock_path):
    async with server(sock_path) as srv:
        await srv.attach(FakeEp(), max_frame=256, reset_reason=114)
        c = await Client.connect(sock_path)
        await c.recv()
        c.send(0x7F, b"?")
        assert await c.closed()


@async_test
async def test_newest_client_wins(sock_path):
    async with server(sock_path) as srv:
        ep = FakeEp()
        await srv.attach(ep, max_frame=256, reset_reason=114)
        old = await Client.connect(sock_path)
        await old.recv()
        new = await Client.connect(sock_path)
        await new.recv()
        assert await old.closed()
        ep.to_host.put_nowait(b"\x00\x02\x80\x00")
        assert await new.recv_spinel() == b"\x80\x00"
        assert srv.clients == 2
        new.close()


# --- the bridge over a simulated chip ------------------------------------------------------------

class Chips:
    """Every open of the serial port finds a freshly booted chip."""

    def __init__(self, *, fail_first: int = 0, hci: bool = True):
        self.sims: list[SimSecondary] = []
        self.rcps: list[FakeRcp] = []
        self.hcis: list[FakeHci] = []
        self.fail_first = fail_first
        self.hci = hci
        self.opens = 0

    async def open(self):
        self.opens += 1
        if self.opens <= self.fail_first:
            raise OSError("[Errno 16] Resource busy")
        (hr, hw), (sr, sw) = make_link()
        rcp, hci = FakeRcp(), FakeHci()
        apps = {12: rcp, 14: hci} if self.hci else {12: rcp}
        sim = SimSecondary(endpoints=(12, 14), apps=apps, reset_reason=114)
        sim.start(sr, sw)
        self.sims.append(sim)
        self.rcps.append(rcp)
        self.hcis.append(hci)
        return hr, hw

    async def stop(self):
        for s in self.sims:
            await s.stop()
        assert [e for s in self.sims for e in s.errors] == []


@contextlib.asynccontextmanager
async def bridge_with_chips(sock_path, *, ble=None, **chip_kw):
    chips = Chips(**chip_kw)
    holder = {}
    srv = ss.SpinelSocketServer(sock_path, request_reset=lambda: holder["b"].request_reset())
    bridge = thread_ble_bridge.ThreadBleBridge(chips.open, spinel=srv, ble=ble, primary_kwargs=FAST,
                                               retry_delays=(0.01, 0.02))
    holder["b"] = bridge
    await bridge.start(wait_up=5)
    try:
        yield bridge, chips
    finally:
        await bridge.close()
        await chips.stop()


@async_test
async def test_otbr_reset_reaches_the_rcp_and_the_rcp_answers(sock_path):
    async with bridge_with_chips(sock_path, hci=False) as (bridge, chips):
        assert bridge.reboots == 1 and bridge.info.reset_reason == 114
        c = await Client.connect(sock_path)
        assert await c.recv() == (ss.HELLO, struct.pack(">BH", 1, 256))
        # what OpenThread sends first: SPINEL_CMD_RESET with SPINEL_RESET_STACK
        reset = bytes([FLAG, CMD_RESET, RESET_STACK])
        c.send(ss.SPINEL, reset)
        # the RCP itself answers (its boot notification was cleared by the reset)
        assert await c.recv_spinel() == last_status(FLAG, STATUS_RESET_POWER_ON)
        assert chips.rcps[-1].received == [reset]                 # not swallowed on the way
        get = bytes([FLAG | 1, CMD_GET, PROP_PROTOCOL_VERSION])
        c.send(ss.SPINEL, get)
        assert await c.recv_spinel() == bytes([FLAG | 1, CMD_IS, PROP_PROTOCOL_VERSION, 4, 3])
        # frames the chip sends on its own, several per CPC payload, arrive one by one
        chips.rcps[-1].push(b"\x80\x06\x71\x01")
        assert await c.recv_spinel() == b"\x80\x06\x71\x01"
        c.close()


@async_test
async def test_unexpected_chip_reset_keeps_otbr_connected_and_rcp_tells_it(sock_path):
    async with bridge_with_chips(sock_path, hci=False) as (bridge, chips):
        c = await Client.connect(sock_path)
        await c.recv()
        c.send(ss.SPINEL, bytes([FLAG, CMD_RESET, RESET_STACK]))
        await c.recv_spinel()
        chips.sims[-1].send_reset_reason(cpc.Status.RESET_WATCHDOG)   # the chip reset on its own
        kind, payload = await c.recv(timeout=5)
        assert kind == ss.RESET
        assert bridge.link_losses == 1 and bridge.reboots == 2 and len(chips.sims) == 2
        # OpenThread's next frame meets the new RCP's boot notification first (its signal to
        # run RCP restoration), then the answer
        get = bytes([FLAG | 2, CMD_GET, PROP_PROTOCOL_VERSION])
        c.send(ss.SPINEL, get)
        assert await c.recv_spinel() == last_status(FLAG, STATUS_RESET_UNKNOWN)
        assert await c.recv_spinel() == bytes([FLAG | 2, CMD_IS, PROP_PROTOCOL_VERSION, 4, 3])
        c.close()


@async_test
async def test_otbr_hardware_reset_reboots_the_chip(sock_path):
    async with bridge_with_chips(sock_path, hci=False) as (bridge, chips):
        c = await Client.connect(sock_path)
        await c.recv()
        c.send(ss.RESET)
        kind, payload = await c.recv(timeout=5)
        assert (kind, payload) == (ss.RESET, (114).to_bytes(4, "big"))
        assert bridge.requested_resets == 1 and bridge.reboots == 2
        # the port was opened again and the chip rebooted by the CPC RESET command (as at start)
        assert len(chips.sims) == 2
        assert ("U", 0x01, None) in chips.sims[1].commands and chips.sims[1].reboots == 1
        c.send(ss.SPINEL, bytes([FLAG, CMD_RESET, RESET_STACK]))
        assert await c.recv_spinel() == last_status(FLAG, STATUS_RESET_POWER_ON)
        c.close()


@async_test
async def test_bring_up_retries_until_the_port_opens(sock_path):
    async with bridge_with_chips(sock_path, hci=False, fail_first=2) as (bridge, chips):
        assert chips.opens == 3 and bridge.failed_attempts == 2 and bridge.reboots == 1


@async_test
async def test_thread_and_bluetooth_side_by_side(sock_path):
    ble = hci_tcp.HciTcpServer("127.0.0.1", 0)
    async with bridge_with_chips(sock_path, ble=ble) as (bridge, chips):
        port = ble._server.sockets[0].getsockname()[1]
        hr, hw = await asyncio.open_connection("127.0.0.1", port)
        c = await Client.connect(sock_path)
        await c.recv()
        hw.write(bytes.fromhex("01030c00"))                    # HCI Reset
        c.send(ss.SPINEL, bytes([FLAG, CMD_RESET, RESET_STACK]))
        async with asyncio.timeout(2):
            cc = await hr.readexactly(7)
        assert cc == bytes.fromhex("040e0401030c00")
        assert await c.recv_spinel() == last_status(FLAG, STATUS_RESET_POWER_ON)
        assert chips.hcis[-1].commands == [0x0C03]
        hw.close()
        c.close()


class FailingBle:
    def __init__(self):
        self.attaches = self.detaches = 0

    async def attach(self, ep):
        self.attaches += 1
        raise RuntimeError("Bluetooth side broken")

    async def detach(self):
        self.detaches += 1

    async def close(self):
        pass


@async_test
async def test_a_failing_bluetooth_side_never_stops_thread(sock_path):
    ble = FailingBle()
    async with bridge_with_chips(sock_path, ble=ble) as (bridge, chips):
        assert ble.attaches == 1
        c = await Client.connect(sock_path)
        await c.recv()
        c.send(ss.SPINEL, bytes([FLAG, CMD_RESET, RESET_STACK]))
        assert await c.recv_spinel() == last_status(FLAG, STATUS_RESET_POWER_ON)
        c.close()
