# zigbee-ble host: CPC primary, probe, tests

A small Python host (primary) for Silicon Labs CPC protocol v6 over a UART, for the
zigbee-ble firmware: Zigbee NCP (EZSP) on CPC endpoint 5 and a Bluetooth controller (HCI)
on endpoint 14. Written from the Zlib chip-side CPC sources of Simplicity SDK 2025.6.3; no
cpcd/libcpc code was read.

| File | What |
|---|---|
| `cpc.py` | asyncio CPC primary: codec, resync, reset sequence, system commands, I-frames with ack/retransmit/reject, endpoints, pyserial transport |
| `probe.py` | CLI: CPC identity, EZSP `version`, HCI Reset + Read Local Version, optional passive LE scan |
| `tests/sim_secondary.py` | simulated secondary modelled on the SDK C code, sharing no code with `cpc.py` |
| `tests/test_cpc.py` | 46 tests, simulated secondary over in-memory streams |

## Run

```sh
cd zigbee-ble/host
uv run --no-project --with pyserial --with pytest pytest -q          # tests, no hardware
uv run --no-project --with pyserial python probe.py /dev/cu.usbserial-XXXX --baud 460800 --scan-seconds 10
```

`-v` logs every CPC frame. `--no-reset` skips the reboot of the secondary (see below).
Exit code 0 = all steps passed, 1 = a step failed, 2 = no CPC link.

## Firmware as currently built has CPC security ON

The project file says "CPC security off" (`project/zigbee-ble-hci.slcp:5`), but the
generated firmware has `SL_CATALOG_CPC_SECURITY_PRESENT` (`firmware/autogen/sl_component_catalog.h:26`)
and `SL_CPC_SECURITY_ENABLED 1` (`firmware/config/sl_cpc_security_config.h:40`), so
`SL_CPC_ENDPOINT_SECURITY_ENABLED` is 1 (SDK `inc/sli_cpc.h:88-96`); the debug build links
`sli_cpc_security_init` (`firmware/build/debug/zigbee-ble-hci.map:33284`). `cpc_secondary`
requires the `cpc_security_secondary` capability and recommends the real component
(`component/cpc_secondary.slcc:46,57`); `cpc_security_secondary_none` provides the capability
without security. Add that component to the slcp to switch it off.

With security on, this host still gets through the reset sequence and the endpoint connects
(the system endpoint stays clear text until a security session exists, `sl_cpc.c:2653-2655,
5145-5157`), but endpoints 5 and 14 are encrypted: their I-frames are rejected with
`SECURITY_ISSUE` while security is INITIALIZING (`sl_cpc.c:3835-3846`) and the secondary holds
its own frames back (`sl_cpc.c:4513-4523`). The probe prints the security state
(`PROP_SECURITY_STATE`) and reports that case explicitly.

## Protocol facts used (SDK paths under `platform/service/cpc` unless noted)

Framing
- Header `0x14 | address | length u16 LE | control | HCS u16 LE` = 7 bytes; HCS covers 5 bytes
  (`inc/sli_cpc_hdlc.h:42-51`, `src/sl_cpc_hdlc.c:39-59`).
- CRC-16/XMODEM, poly 0x1021, init 0, for HCS and FCS (`src/sl_cpc_crc.c:100-144`). Known
  answers in the tests were produced by compiling that file.
- `length` counts the 2 FCS bytes: `data_length + 2`, or 0 with no payload and no FCS
  (`src/sl_cpc.c:4500`); the receiver subtracts them and requires length > 2 (`sl_cpc.c:3624-3637`).
- Control: I-frame when bits 7-6 are 0 or 1 (`inc/sli_cpc_hdlc.h:175-184`), seq bits 6-4,
  P/F bit 3, ack bits 2-0 (`:259-268`); S-frame `0b10`, function bits 5-4: 0 RR, 1 REJ with a
  1-byte reason (`:70-72, 278-286`); U-frame `0b11` + type: 0x00 info, 0x04 poll/final,
  0x31 reset-seq, 0x0E acknowledge (`:65-68, 293-300`).
- Quirk: the SDK reads U types with mask 0x37 (`inc/sli_cpc_hdlc.h:63`), which turns the
  acknowledge 0x0E into 0x06. The secondary never receives one, so the host classifies by the
  low 6 bits (exact for all four types).
- Reject reasons 1 checksum, 2 sequence, 3 out of memory, 4 security, 5 unreachable endpoint,
  6 error (`inc/sli_cpc.h:373-379`).

Link layer (as the secondary does it, mirrored by the host)
- Per-endpoint seq/ack start at 0 (`sl_cpc.c:2644-2645`); window 1 (`inc/sl_cpc.h:287-288`).
- Ack field processed on every I- and S-frame (`sl_cpc.c:3584-3592`), refreshed on every
  (re)transmission (`sl_cpc.c:4504-4508`).
- I-frame in sequence: ack+1 then RR (`sl_cpc.c:3999-4003`); duplicate (seq = ack-1): RR again
  (`:3913-3918`); otherwise REJ sequence (`:3906-3910`); bad FCS on an I-frame: REJ checksum
  (`:3650-3651`), on a U-frame: dropped (`:3652-3653`).
- REJ checksum: retransmit at once (`sl_cpc.c:4064-4067`); sequence/out of memory: timer only
  (`:4061-4074`); security/unreachable/error: endpoint fails (`:4076-4113`).
- Retransmit timeout 100 ms initial, doubled per retry, max 5 s, 10 retries then the
  endpoint fails (`inc/sli_cpc.h:351-353`, `sl_cpc.c:4978-4993`). The host uses fixed
  backoff from 100 ms rather than the secondary's RTT estimate (`sl_cpc.c:1999-2042`).
- Data on an endpoint that is not connected is answered with REJ unreachable (`sl_cpc.c:3545-3548`).
- Reset-seq on endpoint 0 zeroes its seq/ack and is answered with a U acknowledge
  (`sl_cpc.c:4212-4229`).

System endpoint (`src/sl_cpc_system_secondary.c`, `inc/sli_cpc_system_common.h`)
- Command `{id u8, seq u8, length u16 LE, payload}`, header 4 bytes (`sli_cpc_system_common.h:483-493`);
  ids 0 NOOP, 1 RESET, 2 GET, 3 SET, 6 IS (`:468-476`); property payload `{id u32 LE, value}`
  (`:501-504`); property ids (`:58-335`); status codes (`:370-409`).
- Reply echoes the request seq (`sl_cpc_system_secondary.c:1414`); the primary matches by
  seq (`src/sl_cpc_system_primary.c:408-413`).
- As U-frame poll/final the secondary accepts only RESET, GET of RX capability, capabilities,
  bus bitrate, bus max bitrate, protocol version, bootloader info, CPC version, app version,
  and SET of reboot mode, TX capability, primary version (`:1416-1457`); anything else
  asserts there. NOOP, endpoint state and security state must be I-frames with P/F set
  (`:1458-1480`, `sl_cpc.c:3923-3946`); the reply is an I-frame with P/F (`sl_cpc.c:4005-4017`)
  or a U poll/final for U polls (`sl_cpc.c:4170-4189`). (The SDK's embedded primary sends
  NOOP as a U-frame, `sl_cpc_system_primary.c:549`, which this secondary would not accept.)
- Values: protocol version u8 = 6 (`:475-484`, `inc/sli_cpc.h:84`); CPC version 3 x u32
  (`:491-505`); app version NUL-terminated string (`:512-531`); capabilities u32 (`:538-558`,
  bits `sli_cpc_system_common.h:460-463`); RX capability u16, the max user payload without FCS
  (`:565-577`, `sli_cpc.h:308-317`); security state u32 or `LAST_STATUS=UNIMPLEMENTED`
  without the component (`:686-703`); a failed get/set answers `LAST_STATUS` with a status
  (`:817-826`).
- Reading the app version marks the reset sequence done (`:1213-1216`).
- Reset reason at boot: U-frame information, `PROP_VALUE_IS LAST_STATUS` = u32 reset status
  (`:409-444`).
- Endpoint connect: SET `PROP_ENDPOINT_STATE_<id>` (0x1000+id) = `SL_CPC_STATE_CONNECTED` = 5,
  one byte (`sl_cpc.c:3014-3022`, `inc/sl_cpc.h:92-106`, `platform/common/inc/sl_enum.h:57`).
  The secondary replies CONNECTED only from OPEN/CONNECTING, otherwise CLOSED
  (`sl_cpc.c:1698-1720`), and becomes connected when that reply is acknowledged
  (`sl_cpc_system_secondary.c:321-327`) or when an I-frame arrives on the endpoint
  (`sl_cpc.c:3562-3564`).
- Host reset sequence follows the embedded primary (`src/sl_cpc_reboot_sequence.c:324-530`):
  reboot mode = application, RESET, wait for the reset reason, then reset-seq and the gets.

EZSP on endpoint 5
- One plain EZSP frame per CPC payload, no ASH, stuffing, randomisation or extra header.
  Source: the SDK host side (`protocol/zigbee/app/util/ezsp/serial-interface-cpc.c:204-219,
  285-290`). The NCP side is a binary library (`libzigbee-ncp-cpc.a`); its symbol table shows
  `sl_cpc_read/sl_cpc_write` and no ASH code.
- Legacy frame `seq, fc, id, params`; extended `seq, fc_lo, fc_hi=0x01, id u16 LE, params`
  (`ezsp-protocol.h:39-54, 150-151`); first `version` legacy, then extended (`ezsp.c:523-533,
  629-633`); response format by `byte2 & 3 == 1` (`ezsp.c:552-566`); `version` returns
  protocolVersion u8, stackType u8, stackVersion u16 (`command-functions.h:24-41`).

HCI on endpoint 14
- Host to controller: payload starts with the H4 type byte (`protocol/bluetooth/bgstack/ll/
  utils/hci_packet/cpc/src/sl_hci_packet.c:61-95`); endpoint opened with window 1
  (`sl_hci_cpc.c:51`).
- Controller to host: `hci_common_transport_transmit()` hands its buffer to `sl_cpc_write`
  (`sl_hci_packet.c:126-129`); the UART transport writes the same buffer raw
  (`uart/src/sl_hci_packet.c:162-165`, `uart/src/sl_hci_uart.c:308-319`), so it holds a full
  H4 packet with type byte. Inferred: the producer is in the binary controller library.
  The probe reassembles H4 from the byte stream either way.

## Untested on hardware

Nothing here has touched the dongle. In particular unverified:
- the pyserial transport (`open_serial`/`serial_streams`; only tested with a pipe-backed fake)
  and whether opening the CP2102N port toggles DTR/RTS into anything on this board;
- real timing: reset-to-reset-reason delay, how soon endpoints 5/14 open after boot
  (the connect retries for up to `--timeout`), retransmit timeouts against real latency;
- the EZSP NCP's actual answers (versions, whether it sends callbacks unprompted);
- the controller's event framing per CPC payload, its default event masks, and whether it
  delivers legacy advertising reports with extended scanning also built in;
- behaviour with CPC security on, beyond what the source shows (see above).
