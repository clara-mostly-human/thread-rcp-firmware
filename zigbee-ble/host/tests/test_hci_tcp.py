"""Raw HCI over TCP: stream in, whole H4 packets out, controller frames passed through."""

import asyncio

import pytest

import cpc
import hci_tcp
from test_cpc import async_test


def test_splitter_rebuilds_packets_from_any_chunking():
    reset = bytes.fromhex("01030c00")
    scan_params = bytes.fromhex("010b200701a0003000000000")[:4] + bytes(7)
    acl = bytes.fromhex("02010004000102030405")[:5] + bytes(4)
    acl = b"\x02\x01\x00\x04\x00" + b"\xaa\xbb\xcc\xdd"
    stream = reset + scan_params + acl
    for size in (1, 2, 3, 5, 64):
        s = hci_tcp.H4Splitter()
        out = []
        for i in range(0, len(stream), size):
            out += s.feed(stream[i:i + size])
        assert out == [reset, scan_params, acl], size
    with pytest.raises(ValueError):
        hci_tcp.H4Splitter().feed(b"\x04\x0e\x00")      # events never come from the host


class FakeEp:
    def __init__(self):
        self.written = []
        self.to_host: asyncio.Queue = asyncio.Queue()

    async def write(self, data):
        self.written.append(data)

    async def read(self, timeout=None):
        item = await self.to_host.get()
        if item is None:
            raise cpc.CpcConnectionLost("closed")
        return item


@async_test
async def test_tcp_host_reaches_the_controller_and_back():
    ep = FakeEp()
    srv = hci_tcp.HciTcpServer("127.0.0.1", 0)
    await srv.attach(ep)
    port = srv._server.sockets[0].getsockname()[1]
    reader, writer = await asyncio.open_connection("127.0.0.1", port)
    try:
        writer.write(b"\x01\x03")
        await writer.drain()
        await asyncio.sleep(0.05)
        writer.write(b"\x0c\x00")
        await writer.drain()
        for _ in range(100):
            if ep.written:
                break
            await asyncio.sleep(0.01)
        assert ep.written == [b"\x01\x03\x0c\x00"]
        complete = bytes.fromhex("040e0401030c00")
        ep.to_host.put_nowait(complete)
        assert await asyncio.wait_for(reader.readexactly(len(complete)), 2) == complete
        # a new host replaces the old one: the old connection is closed, the new one gets data
        r2, w2 = await asyncio.open_connection("127.0.0.1", port)
        assert await asyncio.wait_for(reader.read(), 2) == b""
        ep.to_host.put_nowait(complete)
        assert await asyncio.wait_for(r2.readexactly(len(complete)), 2) == complete
        # a chip reboot (detach) drops the host
        await srv.detach()
        assert await asyncio.wait_for(r2.read(), 2) == b""
        w2.close()
    finally:
        writer.close()
        ep.to_host.put_nowait(None)
        await srv.close()


@async_test
async def test_host_is_refused_while_the_chip_reboots():
    srv = hci_tcp.HciTcpServer("127.0.0.1", 0)
    await srv.attach(FakeEp())
    port = srv._server.sockets[0].getsockname()[1]
    await srv.detach()                                   # chip rebooting: not listening
    with pytest.raises(ConnectionRefusedError):
        await asyncio.open_connection("127.0.0.1", port)
    srv.port = port                                      # listen on the same port again
    ep2 = FakeEp()
    await srv.attach(ep2)                                # back: hosts are accepted again
    reader, writer = await asyncio.open_connection("127.0.0.1", port)
    writer.write(bytes.fromhex("01030c00"))
    await writer.drain()
    for _ in range(100):
        if ep2.written:
            break
        await asyncio.sleep(0.01)
    assert ep2.written == [bytes.fromhex("01030c00")]
    writer.close()
    await srv.close()
