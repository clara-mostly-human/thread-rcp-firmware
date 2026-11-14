"""Does the Zigbee NCP find the network already stored on the dongle?

Brings the network up with networkInit (as bellows does at start) and prints what the NCP
reports: network state, node type, channel, PAN ID, extended PAN ID and the coordinator's EUI64.
Compare with what ZHA had before the firmware swap. Note: this starts the coordinator on the
real network for a few seconds.

EZSP v18 (EmberZNet 8.2), extended frames, frame ids from
protocol/zigbee/app/util/ezsp/ezsp-enum.h:801-835; reply layouts from command-functions.h
(get_network_parameters:1088-1100, network_init:887-895) and ezsp-frame-utilities.c:121-130,301-304.
Status values are sl_status_t (u32), platform/common/inc/sl_status.h:108-110.

    uv run --no-project --with pyserial python ezsp_netcheck.py /dev/cu.usbserial-XXXX
"""

import argparse
import asyncio
import struct

import cpc
from probe import EZSP_FC_HIGH_FORMAT_V1, ezsp_frame, ezsp_parse, ezsp_version

NETWORK_INIT = 0x0017
NETWORK_STATE = 0x0018
STACK_STATUS_HANDLER = 0x0019
GET_EUI64 = 0x0026
GET_NETWORK_PARAMETERS = 0x0028

STATUS_NAMES = {0x0000: "OK", 0x0015: "NETWORK_UP", 0x0016: "NETWORK_DOWN", 0x0017: "NOT_JOINED"}
NETWORK_STATES = {0: "no network", 1: "joining", 2: "joined", 3: "joined, no parent", 4: "leaving"}
NODE_TYPES = {0: "unknown", 1: "coordinator", 2: "router", 3: "end device", 4: "sleepy end device"}


def status(v: int) -> str:
    return f"0x{v:04x} {STATUS_NAMES.get(v, '')}".strip()


class Ezsp:
    def __init__(self, ep: cpc.Endpoint, timeout: float) -> None:
        self.ep, self.timeout, self.seq, self.callbacks = ep, timeout, 1, []

    async def command(self, frame_id: int, params: bytes = b"") -> bytes:
        self.seq = (self.seq + 1) & 0xFF
        await self.ep.write(ezsp_frame(self.seq, frame_id, params, legacy=False))
        async with asyncio.timeout(self.timeout):
            while True:
                resp = ezsp_parse(await self.ep.read())
                if resp.frame_id != frame_id or resp.seq != self.seq:
                    self.callbacks.append(resp)  # callback or stray frame, keep for later
                    continue
                return resp.params

    async def wait_callback(self, frame_id: int, timeout: float):
        async with asyncio.timeout(timeout):
            while True:
                for i, cb in enumerate(self.callbacks):
                    if cb.frame_id == frame_id:
                        return self.callbacks.pop(i)
                self.callbacks.append(ezsp_parse(await self.ep.read()))


async def main(port: str, baud: int, timeout: float) -> None:
    reader, writer = await cpc.open_serial(port, baud)
    primary = cpc.CpcPrimary(reader, writer)
    try:
        info = await primary.start(reset=True)
        reason = cpc._name(cpc.Status, info.reset_reason) if info.reset_reason is not None else "none"
        print(f"CPC {'.'.join(map(str, info.cpc_version))}, reset reason after our reboot: {reason}")
        ep = await primary.connect_endpoint(cpc.EP_ZIGBEE, timeout=timeout)
        # As bellows starts: version(4) in the legacy frame, then the NCP's version extended.
        proto = (await ezsp_version(ep, 0, 4, legacy=True, timeout=timeout, out=print))[0]
        await ezsp_version(ep, 1, proto, legacy=False, timeout=timeout, out=print)
        print(f"EZSP protocol {proto}")
        ezsp = Ezsp(ep, timeout)
        (st,) = struct.unpack("<I", (await ezsp.command(NETWORK_INIT, struct.pack("<H", 0)))[:4])
        print(f"networkInit: {status(st)}")
        if st == 0:
            try:
                cb = await ezsp.wait_callback(STACK_STATUS_HANDLER, 10.0)
                print(f"stackStatusHandler: {status(struct.unpack('<I', cb.params[:4])[0])}")
            except TimeoutError:
                print("stackStatusHandler: none within 10 s")
        state = (await ezsp.command(NETWORK_STATE))[0]
        print(f"networkState: {state} ({NETWORK_STATES.get(state, '?')})")
        eui = (await ezsp.command(GET_EUI64))[:8]
        print("EUI64:", ":".join(f"{b:02x}" for b in reversed(eui)))
        p = await ezsp.command(GET_NETWORK_PARAMETERS)
        st, node_type = struct.unpack("<IB", p[:5])
        ext_pan, pan, txp, ch, join, mgr, upd, chans = struct.unpack("<8sHbBBHBI", p[5:5 + 20])
        print(f"getNetworkParameters: {status(st)}, node type {NODE_TYPES.get(node_type, node_type)}")
        if st == 0:
            print(f"  channel {ch}, PAN 0x{pan:04x}, extended PAN {ext_pan[::-1].hex(':')}, "
                  f"tx power {txp} dBm, nwk update id {upd}")
    finally:
        await primary.close()


if __name__ == "__main__":
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("port")
    ap.add_argument("--baud", type=int, default=460800)
    ap.add_argument("--timeout", type=float, default=5.0)
    a = ap.parse_args()
    asyncio.run(main(a.port, a.baud, a.timeout))
