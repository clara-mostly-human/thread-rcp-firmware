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


def test_answered_opcode():
    assert hci_tcp.answered_opcode(bytes.fromhex("040e0401030c00")) == 0x0C03       # complete
    assert hci_tcp.answered_opcode(bytes.fromhex("040f0400010d20")) == 0x200D       # status
    assert hci_tcp.answered_opcode(bytes.fromhex("040e0401000000")) is None         # NOP
    assert hci_tcp.answered_opcode(bytes.fromhex("043e0c02")) is None               # LE meta
    assert hci_tcp.answered_opcode(b"\x04\x0e") is None
    assert hci_tcp.opcode_name(0x200C) == "0x200c (LE Set Scan Enable)"
    assert hci_tcp.opcode_name(0xFC01) == "0xfc01"


async def _host(srv):
    port = srv._server.sockets[0].getsockname()[1]
    return await asyncio.open_connection("127.0.0.1", port)


async def _until(cond):
    for _ in range(300):
        if cond():
            return
        await asyncio.sleep(0.01)
    raise AssertionError("condition never became true")


@async_test
async def test_commands_are_timed_and_slow_answers_logged(caplog, monkeypatch):
    monkeypatch.setattr(hci_tcp, "SLOW_COMMAND", 0.05)
    ep = FakeEp()
    srv = hci_tcp.HciTcpServer("127.0.0.1", 0)
    await srv.attach(ep)
    reader, writer = await _host(srv)
    try:
        writer.write(bytes.fromhex("01030c00"))                 # Reset, answered at once
        await writer.drain()
        await _until(lambda: ep.written)
        ep.to_host.put_nowait(bytes.fromhex("040e0401030c00"))
        await _until(lambda: srv.commands.answered == 1)
        assert "answered after" not in caplog.text

        writer.write(bytes.fromhex("010c200201" "00"))         # Scan Enable, answered late
        await writer.drain()
        await _until(lambda: len(ep.written) == 2)
        adv = bytes.fromhex("043e0c0201000100000000000000c4")
        ep.to_host.put_nowait(adv)
        ep.to_host.put_nowait(adv)
        await asyncio.sleep(0.1)
        ep.to_host.put_nowait(bytes.fromhex("040e04010c2000"))
        await _until(lambda: srv.commands.answered == 2)
        assert "HCI command 0x200c (LE Set Scan Enable) answered after" in caplog.text
        assert "2 frames from the chip before the answer" in caplog.text
        c = srv.commands.take()
        assert (c.commands, c.answered, c.slow, c.late, c.unanswered) == (2, 2, 1, 0, 0)
        assert c.slowest_s >= 0.1
        assert srv.commands.commands == 0                       # take() starts again
    finally:
        writer.close()
        ep.to_host.put_nowait(None)
        await srv.close()


@async_test
async def test_unanswered_command_is_reported_once_then_late(caplog, monkeypatch):
    monkeypatch.setattr(hci_tcp, "UNANSWERED", 0.1)
    monkeypatch.setattr(hci_tcp, "SLOW_COMMAND", 0.05)
    ep = FakeEp()
    srv = hci_tcp.HciTcpServer("127.0.0.1", 0)
    srv.check_interval = 0.02
    await srv.attach(ep)
    reader, writer = await _host(srv)
    try:
        writer.write(bytes.fromhex("010b2007" "01a0003000" "0000"))   # Scan Parameters
        await writer.drain()
        await _until(lambda: srv.commands.unanswered == 1)
        await asyncio.sleep(0.1)
        assert srv.commands.unanswered == 1                            # reported once
        assert "HCI command 0x200b (LE Set Scan Parameters) unanswered after" in caplog.text
        assert "chip acknowledged its CPC frame after" in caplog.text
        ep.to_host.put_nowait(bytes.fromhex("040e04010b2000"))
        await _until(lambda: srv.commands.answered == 1)
        assert srv.commands.late == 1
        assert "after NimBLE's 2 s timeout" in caplog.text
    finally:
        writer.close()
        ep.to_host.put_nowait(None)
        await srv.close()


@async_test
async def test_slow_cpc_write_is_logged_and_reboot_forgets_commands(caplog, monkeypatch):
    monkeypatch.setattr(hci_tcp, "SLOW_WRITE", 0.05)

    class SlowEp(FakeEp):
        async def write(self, data):
            await asyncio.sleep(0.1)
            self.written.append(data)

    ep = SlowEp()
    srv = hci_tcp.HciTcpServer("127.0.0.1", 0)
    await srv.attach(ep)
    reader, writer = await _host(srv)
    try:
        writer.write(bytes.fromhex("01030c00"))
        await writer.drain()
        await _until(lambda: ep.written)
        await _until(lambda: "CPC write of HCI command 0x0c03 (Reset) took" in caplog.text)
        assert srv.commands.slowest_write_s >= 0.1
        assert len(srv._cmds) == 1
        await srv.detach()                                  # chip reboot
        assert srv._cmds == []
    finally:
        writer.close()
        ep.to_host.put_nowait(None)
        await srv.close()
