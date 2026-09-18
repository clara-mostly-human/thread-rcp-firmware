# What the community build changes, and what we do about it

Read-only comparison made 2026-09-18 of darkxst/silabs-firmware-builder (no licence, so nothing is
copied) against Silicon Labs' `ot-rcp` sample. Their `src/openthread_rcp/{app.c,app.h,main.c}` and
`reset_util.h` are byte-identical to SDK 2024.6.3's sample; everything they add is configuration.

| Community change | Why | Ours |
|---|---|---|
| `OPENTHREAD_CONFIG_DEFAULT_TRANSMIT_POWER = 6` (SDK default 0 dBm) | sensible power before the host sets one | set explicitly; production's launcher sets 19 dBm at start anyway |
| hardware flow control default removed | most USB sticks do not wire CTS/RTS | board override: flow control none |
| board defines: USART0, TX PC01, RX PC02, 460800 baud, HFXO 38.4 MHz, CTUNE 128 | the board | `board/dongle-pmg24.md`; CTUNE unresolved (SONOFF's Zigbee firmware reports 100) |
| GBL METADATA tag (fw type, version, baud rate) | lets universal-silabs-flasher show what a file is and refuse cross-flashing | optional; SONOFF's own GBL has none. Could add to `scripts/gbl.py` |
| `-Werror`, postbuild via Commander | their CI | not needed |

Silicon Labs' own changes to the sample, 2024.6.3 -> 2025.6.3: `main.c` replaced by the `sl_main`
component; `uartdrv_usart` -> `iostream_usart` (different config names); new `ot_reset_utils`
component (replaces the hand-included `reset_util.h`); link-time optimisation on by default; an
optional host-wakeup GPIO hook in `app.c` (off by default).
