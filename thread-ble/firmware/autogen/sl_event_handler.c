#include "sl_event_handler.h"

#include "sl_clock_manager.h"
#include "sl_rail_util_dma.h"
#include "pa_conversions_efr32.h"
#include "sl_rail_util_pti.h"
#include "sl_rail_util_rssi.h"
#include "btl_interface.h"
#include "sl_btctrl_rtos.h"
#include "platform-efr32.h"
#include "sl_cpc.h"
#include "sl_btctrl_linklayer.h"
#include "sl_gpio.h"
#include "gpiointerrupt.h"
#include "sl_mbedtls.h"
#include "crash_handler.h"
#include "sl_ot_rtos_adaptation.h"
#include "sl_btctrl_hci_packet.h"
#include "psa/crypto.h"
#include "sl_se_manager.h"
#include "sli_protocol_crypto.h"
#include "sli_crypto.h"
#include "cmsis_os2.h"
#include "nvm3_default.h"

void sli_driver_permanent_allocation(void)
{
}

void sli_service_permanent_allocation(void)
{
  sl_cpc_init_permanent_allocations();
}

void sli_stack_permanent_allocation(void)
{
  sl_ot_rtos_perm_allocation();
}

void sli_internal_permanent_allocation(void)
{
}

void sl_platform_init(void)
{
  sl_clock_manager_runtime_init();
  bootloader_init();
  sl_ot_crash_handler_init();
  nvm3_initDefault();
}

void sli_internal_init_early(void)
{
}

void sl_kernel_start(void)
{
  osKernelStart();
}

void sl_driver_init(void)
{
  sl_gpio_init();
  GPIOINT_Init();
}

void sl_service_init(void)
{
  sl_cpc_init();
  sl_mbedtls_init();
  psa_crypto_init();
  sl_se_init();
  sli_protocol_crypto_init();
  sli_crypto_init();
  sli_aes_seed_mask();
}

void sl_stack_init(void)
{
  sl_rail_util_dma_init();
  sl_rail_util_pa_init();
  sl_rail_util_pti_init();
  sl_rail_util_rssi_init();
  sl_btctrl_rtos_init();
  sl_ot_sys_init();
  sl_btctrl_init();
}

void sl_internal_app_init(void)
{
  sl_ot_rtos_stack_init();
  sl_ot_rtos_app_init();
}

