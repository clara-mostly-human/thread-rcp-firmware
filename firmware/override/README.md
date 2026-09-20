# Local overrides of SDK sources

`radio.c` — copy of `protocol/openthread/platform-abstraction/efr32/radio.c` from Simplicity SDK
2025.6.3 (BSD-3, The OpenThread Authors). The first commit of this file is byte-identical to the
SDK's; `git log -p firmware/override/radio.c` is therefore exactly what we changed.
`ot-rcp.project.mak` compiles this copy instead of the SDK's. When regenerating `firmware/` with
slc, re-apply that makefile edit.

`iostream_uart.c` — same arrangement, copy of `protocol/openthread/platform-abstraction/efr32/iostream_uart.c` (BSD-3).

`sl_iostream_uart.c` — copy of `platform/service/iostream/src/sl_iostream_uart.c` (Zlib, Silicon Labs).
