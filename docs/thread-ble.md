# Thread + Bluetooth on one dongle (stage 8, design, 2026-11-17)

The goal: one SONOFF Dongle Plus MG24 carries both the Thread radio for otbr-agent and the
Bluetooth controller for nimbled, built from source, the way stage 1 did Zigbee + Bluetooth
(`~/Projects/infra/ha/macos-supervisor/zigbee-ble-radio.md`). Every interface is a real,
documented one: Spinel reaches otbr-agent through OpenThread's RCP vendor interface, and HCI
reaches nimbled as raw H4, the same service the zigbee-ble bridge already has.

Checked in the offline Simplicity SDK 2025.6.3 and in ot-br-posix 285bcb54 with OpenThread
3de40968 (the OTBR app's pin) unless marked otherwise. Nothing was flashed; no dongle was opened.

## The chain

```
 dongle (EFR32MG24)                          Mac
 ┌──────────────────────────────┐   UART    ┌───────────────────────────────────────────────┐
 │ OpenThread RCP (ot_ncp_cpc) ─┼─ CPC ep12 ┤ thread_ble_bridge.py (CPC host, cpc.py)       │
 │ BLE controller (hci_cpc)    ─┼─ CPC ep14 ┤   ep12 -> spinel_socket.py: Unix socket ──────┼─> otbr-agent, radio URL
 │ CPC secondary, security off  │  460800   │                                               │   spinel+cpc://<socket>
 └──────────────────────────────┘  no RTS   │   ep14 -> hci_tcp.py: raw H4, 127.0.0.1:14433 ┼─> nimbled (unchanged)
                                             └───────────────────────────────────────────────┘
```

This is Silicon Labs' own Linux split (cpcd owns the UART; otbr-agent's `spinel+cpc` vendor
interface reaches it through libcpc over a local socket; cpc-hci-bridge serves HCI), with our
own CPC host instead of cpcd/libcpc (MSLA licence, Linux-only), as in stage 1.

## 1. Firmware

**Recipe:** `protocol/openthread/sample-apps/ot-ncp/rcp-uart-802154-blehci.slcp`
("Multiprotocol (OpenThread+Zigbee+BLE) - RCP (UART)", quality production): OpenThread RCP with
the CPC transport, Bluetooth controller with HCI over CPC, dynamic multiprotocol RAIL, FreeRTOS.
Our project is `thread-ble/project/thread-ble-hci.slcp`. Changes, each with its reason:

| Change | Why |
|---|---|
| `cpc_security_secondary_none` | our host has no CPC security; without this component `cpc_secondary` pulls security in (stage 1 found this the hard way, befbdeb) |
| multipan off (`OPENTHREAD_CONFIG_MULTIPAN_RCP_ENABLE`, `MULTIPLE_INSTANCE`, `MULTIPLE_STATIC_INSTANCE` = 0) | the recipe's multipan serves zigbeed + otbr on one radio. A multipan RCP reserves Spinel IID 0 for broadcast with no instance behind it (`util/third_party/openthread/src/ncp/ncp_base.cpp` `NcpBase(Instance **, uint8_t)`, :246-268), so a standard otbr-agent (IID 0, `spinel_manager.cpp` `GetIidListFromUrl`) could not drive it. Off, the 802.15.4 side is the single-instance RCP that runs in production today, carried over CPC endpoint 12 |
| 460800 baud, no hardware flow control | the board has no CTS/RTS (`board/dongle-pmg24.md`) |
| board pins and crystal after generation | `zigbee-ble/apply-board.py thread-ble/firmware` (the generated config files are the same): USART0, TX PC01, RX PC02, HFXO 38.4 MHz, CTUNE 100 |
| series-3 (EUSART) alternatives dropped | the MG24 is series 2 |

Everything else is the recipe's, including LTO, `SL_CPC_RX_PAYLOAD_MAX_LENGTH` 256 (the largest
Spinel frame the host may send; the socket's HELLO reports it) and
`OPENTHREAD_CONFIG_LOG_OUTPUT_NONE` (production's `ot-rcp` uses `_APP`, which is where the
"RCP => Reset info" lines in the agent log come from; an option to turn on later).

The production RCP's UART fixes (`firmware/override/sl_iostream_uart.c`, `iostream_uart.c`) do not
apply: CPC has its own UART driver, and a lost byte costs a CPC checksum reject and a
retransmission, not a lost Spinel frame. That is the failure that took the HDLC RCP down in
September. The bridge counts CPC resends and rejects; watch them in the soak.

**Generation:** slc 5.11 in the offline generator image, `--network none`, about two minutes; the
generated tree is committed as `thread-ble/firmware` (26372ed), the board settings on top (6e62618).
Docker Desktop ran only for the generation (free memory 30-32% throughout, no new RCP lines in the
production OTBR log) and was quit straight after.

**Build:** `thread-ble/build.sh <tag>`: make, vendored Arm GCC 12.2, vendored SDK, about 10 s, one
warning ("RAIL PTI peripheral not configured", the debug trace pins).

| | thread-ble | zigbee-ble (for comparison) |
|---|---|---|
| code + data (flash at 0x08006000) | 239.4 kB + 5.1 kB | 384 kB + 6.4 kB |
| NVM3 at the end of flash | 40 kB | 32 kB |
| static RAM | about 29.6 kB (stack 2.7, bss 21.5, data 5.1) | about 33 kB |
| heap (memory manager) | 101.4 kB | about 98 kB |
| image | `out/thread-ble-hci-pmg24-dev1-460800.gbl`, 245,116 bytes, sha256 d7b58a8bf01b2b07f633dda655fa8197e382041c3e27407fc4d27c7207c1ec3a | 391,824 bytes |

Closed parts on the chip: the multiprotocol RAIL and the BLE link layer, as in stage 1. The
OpenThread RCP, CPC and the HCI glue are source.

## 2. The Mac host

**One process owns the UART:** `zigbee-ble/host/thread_ble_bridge.py`. It is the CPC host
(`cpc.py`, unchanged apart from the endpoint constant and `wait_dead()`), and routes:
- endpoint 12 (OpenThread RCP) to a Unix socket (`spinel_socket.py`);
- endpoint 14 (Bluetooth) to raw HCI on TCP (`hci_tcp.py`, the module the zigbee-ble bridge
  uses, so nimbled needs no change).

**Why alongside `zigbee-ble/host`:** both flavours share `cpc.py`, `hci_tcp.py` and the simulated
secondary of the tests. A separate folder would need copies or import-path tricks; the bridge app
already ships that folder. The cost is the folder name; renaming it to something like
`cpc-host/` is a single move later.

**The socket protocol** (AF_UNIX, SOCK_STREAM; module docstring of `spinel_socket.py`):

    type u8 | length u16 big-endian | payload

| Type | Direction | Payload |
|---|---|---|
| 0x00 HELLO | bridge -> client, first message | protocol version u8 (1), largest Spinel frame the RCP accepts u16 BE (its CPC RX capability, 0 = not known yet), UART bit rate u32 BE |
| 0x01 SPINEL | both | one Spinel frame, unchanged |
| 0x02 RESET | client -> bridge | empty: reboot the chip (the RCP's hardware reset) |
| 0x02 RESET | bridge -> client | the chip (re)booted and endpoint 12 is connected again; CPC reset reason u32 BE |

Endpoint 12 as the chip uses it (`protocol/openthread/platform-abstraction/ncp/ncp_cpc.cpp`): one
Spinel frame per CPC payload towards the chip (`ProcessCpc`, :309-326); towards the host, one or
more frames per payload, each after a u16 big-endian length (`SendToCPC`, :197-216). The bridge
splits those into single SPINEL messages.

**Nothing is faked.** A `SPINEL_CMD_RESET` reaches the RCP like any frame, and the RCP answers it
(`ncp_base.cpp` `CommandHandler_RESET`, :1293-1323: radio stack reset, then LAST_STATUS
RESET_POWER_ON). Silicon Labs' posix `cpc_interface.cpp` does not send that command at all and
answers it on the chip's behalf with a stored `80 06 00 72` (:238-240, `.hpp` :227 "OT is tricked
into thinking it handles resets", :257). We do not copy that.

**Behaviour:**
- One client; a new connection replaces the old one (otbr-agent restarted).
- The chip is rebooted (CPC system reset) when the bridge starts, when the CPC link is lost
  (transport error, or the chip reset on its own), and when the client sends RESET. Both endpoints
  are connected again afterwards; failed attempts retry after 1, 2, 5, 10, 10… s.
- Across a reboot the Spinel client **stays connected**: its frames are dropped and counted while
  the chip is down, and it gets a RESET notice once it is back. OpenThread then meets the new RCP's
  boot notification (or a timeout) and runs its RCP restoration (`OT_RCP_RESTORATION_MAX_COUNT=2`
  in the OTBR app), as after a crash of a UART RCP. nimbled is disconnected and reconnects, as with
  the zigbee-ble bridge.
- A Bluetooth failure never stops Thread.
- Statistics every 5 minutes: Spinel frames each way, drops by cause, slowest CPC write, reboots by
  cause, HCI command timing, CPC link counters.

## 3. otbr-agent's side: the RCP vendor interface

**The hook exists in the pinned versions and fits.** In OpenThread 3de40968 (`src/posix/platform`):
- `CMakeLists.txt:109-114`: option `OT_POSIX_RCP_VENDOR_BUS` defines
  `OPENTHREAD_POSIX_CONFIG_SPINEL_VENDOR_INTERFACE_ENABLE=1`;
- `vendor.cmake:29-60`: `OT_POSIX_CONFIG_RCP_VENDOR_INTERFACE` names the source file, built as
  `rcp-vendor-intf` and linked into `openthread-posix` (included at `CMakeLists.txt:173`);
- `vendor_interface.hpp`: class `VendorInterface : SpinelInterface`; the URL scheme is
  `OPENTHREAD_POSIX_CONFIG_SPINEL_VENDOR_INTERFACE_URL_PROTOCOL_NAME` (default `spinel+vendor`,
  `openthread-posix-config.h:106-108`), matched as a prefix (:152-156);
- `spinel_manager.cpp:119-123` creates it for a matching radio URL. The HDLC interface stays
  enabled (`openthread-posix-config.h:79-81`, default 1), so one binary takes both
  `spinel+hdlc+uart://` and `spinel+cpc://`. With both built, the interface storage is the HDLC
  interface's size (`spinel_manager.hpp:109-120`); `VendorInterface` has no data members, so the
  implementation keeps its state in static storage (Silicon Labs' does the same).
- ot-br-posix sets none of these (the app's `build-options.txt` has them at their defaults), so the
  app adds them.

This is the hook Silicon Labs' `spinel+cpc` uses (`platform-abstraction/posix/cpc_interface.cpp`,
`posix_vendor_rcp.cmake`).

**Our implementation:** `thread-ble/otbr/cpc_socket_interface.cpp` (BSD-3-Clause, 640 lines
with comments). Radio URL `spinel+cpc:///path/to/spinel.sock[?connect-timeout=<s>]`.
- `Init`: connects (retrying up to `connect-timeout`, default 10 s, while the bridge starts),
  `SO_NOSIGPIPE`, non-blocking, waits up to 2 s for HELLO, checks the version.
- `SendFrame`: one SPINEL message; a frame over the RCP's limit returns `OT_ERROR_NO_BUFS` with a
  log line instead of vanishing in the bridge.
- `WaitForFrame`, `UpdateFdSet`, `Process`: select/read like the HDLC interface; each SPINEL
  message goes into OpenThread's receive buffer and its callback.
- `GetBusSpeed`: the UART bit rate from HELLO.
- `HardwareReset`: sends RESET and waits up to 10 s for the bridge's RESET notice.
- A closed connection ends the process ("CPC host closed the Spinel connection"), as the HDLC
  interface does on a vanished UART ("RCP device disconnected (EOF)").

**URL scheme `spinel+cpc`:** it names the transport, as `spinel+hdlc` and `spinel+spi` do. It is
also Silicon Labs' scheme for their libcpc interface (`spinel+cpc://cpcd_0?iid=…`); ours takes a
socket path. If that overlap is unwanted, dropping the define gives OpenThread's default
`spinel+vendor`.

**Considered and not chosen:** `spinel+hdlc+unix://<socket>` (OpenThread #13785, 2026-10-26)
lets the HDLC interface connect to a Unix socket. The bridge would then have to re-frame Spinel
into HDLC-lite, the UART framing CPC replaced on this chip, so that otbr-agent believes it talks
to a UART RCP: the "bridge that pretends to be" the owner's rule excludes.

**What the build proved:** `thread-ble/otbr/build-otbr.sh` builds ot-br-posix 285bcb54 (cloned
from the app's cache into `build/otbr`, submodules from the cache) with the app's own
`build-options.txt` plus the three vendor options. otbr-agent and ot-ctl configure, compile with
`-Wall -Wextra -Werror` and link on macOS arm64; the agent contains both interfaces and the
`spinel+cpc` scheme. otbr-agent itself was not run: it needs root (utun, pf), and there is no
sudo on this Mac.

## 4. Tests without hardware

**Unit tests** (`zigbee-ble/host/tests/test_spinel_socket.py`, 17 tests, against a simulated RCP
modelled on `ncp_cpc.cpp`/`ncp_base.cpp`, `tests/sim_rcp.py`): codec under any chunking, record
splitting and malformed payloads, socket mode 0600 and stale-socket handling, HELLO, frames both
ways, drops while rebooting / too long / failed writes, newest client wins, unknown types; the
bridge over the simulated CPC chip: the reset reaches the RCP and the RCP answers, concatenated
frames, unexpected chip reset under a connected client, hardware reset, port open retries, Thread
and Bluetooth at the same time, a failing Bluetooth side.

    cd zigbee-ble/host
    uv run --no-project --with pyserial --with pytest pytest -q            # 71 passed, 1 skipped (bellows)
    ../../../thread-rcp-firmware/zigbee-ble/host/.venv/bin/python -m pytest -q   # 99 passed (with bellows)

**End to end** (`thread-ble/otbr/e2e/`): real OpenThread on both sides of the whole chain.

    thread-ble/otbr/e2e/build-ot.sh build/otbr/third_party/openthread/repo build/ot-e2e
    uv run --no-project --with pyserial python thread-ble/otbr/e2e/run_e2e.py build/ot-e2e

- host: posix `ot-cli` from the pinned OpenThread with `cpc_socket_interface.cpp` (the same
  source file the agent links), RCP restoration 2, no root needed;
- bridge: `thread_ble_bridge.py`, `spinel_socket.py`, `cpc.py`, unchanged;
- chip: the simulated CPC secondary from the tests, and on endpoint 12 the `ncp_cpc.cpp` framing
  in front of a real OpenThread RCP (simulation `ot-rcp`, Spinel/HDLC on stdio);
- a second Thread node (simulation `ot-cli-ftd`) on the same simulated radio.

14 checks, 14/14 in three consecutive runs:
1. the host reads the RCP version through the chain;
2. it forms a network, the peer joins (child), pings both ways;
3. the chip resets on its own (RCP killed, CPC reset reason sent): the bridge reboots it, the host
   stays connected, OpenThread logs "Unexpected RCP reset" (or, when its frame fell into the
   reboot, "radio tx timeout" about 5 s later), runs restoration ("RCP recovery is done"), pings
   work again, it is still leader;
4. the RCP hangs (process stopped, CPC still up): OpenThread's software reset gets no answer, it
   calls `HardwareReset()`, the bridge reboots the chip and the interface logs "the chip rebooted".
   OpenThread then waits for the RCP's reset notification, gets none and exits ("Failed to reset
   co-processor!"); see the next section.

**Not exercised without hardware:** the real chip's CPC timing and endpoint 12 behaviour, RAIL
sharing between Thread and Bluetooth, the 256-byte frame limit against real otbr-agent traffic
(never reached in the simulation; the drop path is unit-tested), otbr-agent itself (root),
`spinel_socket` against a real nimbled at the same time.

## 5. Resets and recovery

| Event | What happens |
|---|---|
| otbr-agent starts | connects, HELLO, sends `SPINEL_CMD_RESET` (stack); the RCP answers RESET_POWER_ON |
| chip resets on its own, CPC reports it | bridge reboots and reconnects; agent stays connected; restoration in place (seen in the e2e test) |
| CPC link errors (lost bytes) | CPC rejects and retransmits; Spinel unaffected |
| bridge restarts or crashes | socket closes; the agent exits; the Supervisor restarts it (as a vanished UART does today) |
| RCP hangs, CPC alive | OpenThread's software reset times out; `HardwareReset()` reboots the chip through the bridge; the agent then exits and restarts on a fresh chip |
| dongle unplugged | bridge retries the port (1 to 10 s); the agent's frames time out, restoration fails, it exits and is restarted |

**Why the agent exits after `HardwareReset()`:** an RCP on the CPC transport keeps everything,
including its boot notification, until the host has sent it a frame (`ncp_cpc.cpp` `mIsReady`,
:321-324), while OpenThread waits for that notification after a hardware reset
(`spinel_driver.cpp` `ResetCoprocessor`, :159-164). The outcome (a rebooted chip and a restarted
agent) recovers, but logs a failure. The clean fix is in the firmware: set `mIsReady` when the host
connects endpoint 12 (`SL_CPC_ENDPOINT_ON_CONNECT`, `sl_cpc.h:115`) so the RCP announces its reset
unprompted, like a UART RCP. That would also make unexpected resets visible at once instead of on
the next exchange. It means carrying a modified `ncp_cpc.cpp` (Zlib) as an override, like the
production RCP's UART overrides; not done, it needs the hardware test.

## 6. Packaging

**A `thread_ble_bridge` app**, a sibling of `zigbee_ble_bridge` (same shape: `build.sh` fetches
`zigbee-ble/host` from a pinned commit, `native.yaml` with pyserial, `run.py` reads the options):
- runs `thread_ble_bridge.py <device> --baud <baud> --spinel-socket $APP_DATA/spinel.sock
  --hci-tcp $PORT_14433_TCP` (or `--no-bluetooth` when the port is off);
- options `device` (serial, dropdown), `baudrate`; port 14433/tcp for nimbled;
- `startup: system`, before OTBR; runs as the user (the socket is 0600; otbr-agent runs as root
  through the Supervisor's root helper and can connect).

nimbled's app is unchanged (`hci_port` 14433). Only one bridge may serve 14433: a dongle is either
zigbee-ble or thread-ble, and Bluetooth comes from one dongle.

**The OpenThread Border Router app** (`~/Projects/ha-macos-apps/openthread_border_router`):
- `build-options.txt`:

      -OT_POSIX_CONFIG_RCP_VENDOR_INTERFACE:STRING=vendor_interface_example.cpp
      +OT_POSIX_CONFIG_RCP_VENDOR_INTERFACE:STRING=@CPCIF@/cpc_socket_interface.cpp
      -OT_POSIX_RCP_VENDOR_BUS:BOOL=OFF
      +OT_POSIX_RCP_VENDOR_BUS:BOOL=ON
      -CMAKE_CXX_FLAGS:STRING=-DOPENTHREAD_POSIX_CONFIG_DAEMON_SOCKET_BASENAME=\"/var/run/openthread-%s\"
      +CMAKE_CXX_FLAGS:STRING=-DOPENTHREAD_POSIX_CONFIG_DAEMON_SOCKET_BASENAME=\"/var/run/openthread-%s\" -DOPENTHREAD_POSIX_CONFIG_SPINEL_VENDOR_INTERFACE_URL_PROTOCOL_NAME=\"spinel+cpc\"

- `build.sh`: fetch `thread-ble/otbr/cpc_socket_interface.cpp` from a pinned thread-rcp-firmware
  commit into `$CACHE` (sparse checkout, like the bridge app), substitute `@CPCIF@`, and add
  `grep -q 'OT_POSIX_RCP_VENDOR_BUS:BOOL=ON'` to its checks. `build-otbr.sh` here does exactly
  this against a local checkout. The existing build directory must be reconfigured
  (`build-<commit>` keys on the ot-br-posix commit only).
- `config.yaml`: a new optional option, e.g. `spinel_socket: str?`, empty by default. `device`
  stays required by the schema today; it would become optional (`device?`) with one of the two set.
- `run.sh`: the radio URL becomes `spinel+cpc://$SPINEL_SOCKET` when the option is set, else the
  current `spinel+hdlc+uart://$DEVICE?uart-baudrate=$BAUD`. The txpower step via ot-ctl is unchanged.

The Supervisor has no app-to-app discovery (discovery goes to Core), so the socket path
(`<supervisor data>/apps/data/<bridge slug>/spinel.sock`) is set in the OTBR app's options.

**Install-time choice** (stage 1's plan): an MG24 dongle gets Zigbee + Bluetooth or Thread +
Bluetooth, never all three; the installer installs the matching bridge app and points ZHA or OTBR
at it.

## 7. Hardware test plan (needs a spare MG24 dongle; this Mac has none)

Never on `/dev/cu.usbserial-140` (production Thread) or `/dev/cu.usbserial-1340` (production
Zigbee + Bluetooth). Production services untouched throughout; the test bridge uses its own socket
and HCI port.

| # | Step | Pass |
|---|---|---|
| 1 | Flash `out/thread-ble-hci-pmg24-dev1-460800.gbl` with `universal-silabs-flasher --device <spare> --probe-methods bootloader:115200 --bootloader-reset rts_dtr flash --firmware …` | probe afterwards (`--probe-methods cpc:460800`) reports ApplicationType.CPC 4.7.1 at 460800 |
| 2 | `thread_ble_bridge.py <spare> --spinel-socket /tmp/tb.sock --hci-tcp 14434 -v` | "chip up", app version of the RCP, Spinel endpoint connected, CPC security not built in, endpoint 14 connected |
| 3 | posix `ot-cli` from `build-ot.sh` (no root) on `spinel+cpc:///tmp/tb.sock`: `rcp version`, `scan`, `discover` | `SL-OPENTHREAD/2.7.3.0_GitHub-fb0446f53…`; scan lists the production PAN with sane RSSI (the 2026-09-18 RCP test saw the BR at -31 dBm) |
| 4 | Form a test network on another channel, `thread start` | leader within 10 s; no "radio tx timeout" |
| 5 | Optional, with the owner's go: join the production mesh as a child with its dataset, ping the BR's mesh-local address 20 times | 20/20 (the 2026-09-18 RCP test: 5/5) |
| 6 | Bluetooth at the same time: an H4 client on 14434 (probe-style: HCI Reset, Read Local Version, passive scan 30 ms / 150 ms for 60 s) | adverts arrive; HCI answers under 200 ms; Thread unaffected (no timeouts) |
| 7 | 1-hour soak: Thread pings once a second plus continuous 20 % BLE scanning | 0 RCP timeouts, no unexpected chip resets (reset reason), CPC resends logged and rare, every HCI command answered |
| 8 | Recovery: kill the bridge (ot-cli exits by design), restart both; unplug and replug the dongle | bridge comes back by itself; ot-cli starts again; restoration logs as in the e2e test |
| 9 | otbr-agent proper | only through the Supervisor app (root), so either a local test copy with production OTBR stopped, or at a production cutover; the owner's call |

Promotion to production would follow the RCP's path: a multi-day soak on the spare first.

## Open questions

1. Which dongle carries Bluetooth in this house if thread-ble is used: today Bluetooth comes from
   the Zigbee dongle (zigbee-ble); thread-ble is the Thread + Bluetooth option for an install
   without Zigbee, or a move of Bluetooth to the Thread dongle.
2. The `ncp_cpc.cpp` override that announces the RCP's reset when endpoint 12 connects (section 5).
3. `spinel+cpc` versus `spinel+vendor` as the scheme name (section 3).
4. RCP log output `_APP` (production's) instead of the recipe's `_NONE`, to keep the "RCP => Reset
   info" lines in the agent log.
5. Thread under Bluetooth load, and Bluetooth under Thread load: the RAIL priorities
   (`sl_802154_radio_priority_config.h`, `sl_btctrl_scheduler_priority_config.h`) are the
   recipe's; stage 1's Zigbee measurements do not carry over. The soak (step 7) measures it.
6. The folder name `zigbee-ble/host` for a host that now serves both firmware flavours.
