#!/usr/bin/env python3
"""Apply the Dongle-PMG24 board settings to a freshly generated zigbee-ble firmware tree.

CPC UART on USART0, TX PC01, RX PC02, no CTS/RTS; HFXO 38.4 MHz, CTUNE 100
(see ../board/dongle-pmg24.md). Run after every `slc generate`.
"""
import re
import sys
from pathlib import Path

config = Path(sys.argv[1] if len(sys.argv) > 1 else Path(__file__).parent / "firmware") / "config"

p = config / "sl_cpc_drv_uart_usart_vcom_config.h"
t = p.read_text()
start = t.index('#warning "CPC USART peripheral not configured"')
end = t.index("// [USART_SL_CPC_DRV_UART_VCOM]$")
t = t[:start] + """#define SL_CPC_DRV_UART_VCOM_PERIPHERAL                 USART0
#define SL_CPC_DRV_UART_VCOM_PERIPHERAL_NO              0

#define SL_CPC_DRV_UART_VCOM_TX_PORT                    gpioPortC
#define SL_CPC_DRV_UART_VCOM_TX_PIN                     1

#define SL_CPC_DRV_UART_VCOM_RX_PORT                    gpioPortC
#define SL_CPC_DRV_UART_VCOM_RX_PIN                     2
// Dongle-PMG24: CTS/RTS not wired (board/dongle-pmg24.md)
""" + t[end:]
p.write_text(t)

p = config / "sl_clock_manager_oscillator_config.h"
t = p.read_text()
t, n1 = re.subn(r"(#define SL_CLOCK_MANAGER_HFXO_FREQ\s+)\d+", r"\g<1>38400000", t)
t, n2 = re.subn(r"(#define SL_CLOCK_MANAGER_HFXO_CTUNE\s+)\d+", r"\g<1>100", t)
assert n1 == 1 and n2 == 1, (n1, n2)
p.write_text(t)
print("board settings applied to", config)
