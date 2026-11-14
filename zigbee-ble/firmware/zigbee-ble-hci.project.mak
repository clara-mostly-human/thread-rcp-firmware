####################################################################
# Automatically-generated file. Do not edit!                       #
# Makefile Version 16                                              #
####################################################################

BASE_SDK_PATH = /sdk
BASE_PKG_PATH = /root/.silabs/slt/installs
UNAME:=$(shell $(POSIX_TOOL_PATH)uname -s | $(POSIX_TOOL_PATH)sed -e 's/^\(CYGWIN\).*/\1/' | $(POSIX_TOOL_PATH)sed -e 's/^\(MINGW\).*/\1/')
ifeq ($(UNAME),MINGW)
# Translate "C:/super" into "/C/super" for MinGW make.
SDK_PATH := /$(shell $(POSIX_TOOL_PATH)echo $(BASE_SDK_PATH) | sed s/://)
PKG_PATH := /$(shell $(POSIX_TOOL_PATH)echo $(BASE_PKG_PATH) | sed s/://)
endif
SDK_PATH ?= $(BASE_SDK_PATH)
PKG_PATH ?= $(BASE_PKG_PATH)
COPIED_SDK_PATH ?= simplicity_sdk_2025.6.3

# This uses the explicit build rules below
PROJECT_SOURCE_FILES =

C_SOURCE_FILES   += $(filter %.c, $(PROJECT_SOURCE_FILES))
CXX_SOURCE_FILES += $(filter %.cpp, $(PROJECT_SOURCE_FILES))
CXX_SOURCE_FILES += $(filter %.cc, $(PROJECT_SOURCE_FILES))
ASM_SOURCE_FILES += $(filter %.s, $(PROJECT_SOURCE_FILES))
ASM_SOURCE_FILES += $(filter %.S, $(PROJECT_SOURCE_FILES))
LIB_FILES        += $(filter %.a, $(PROJECT_SOURCE_FILES))

C_DEFS += \
 '-DSL_ZIGBEE_CUSTOM_MAC_FILTER_TABLE_SIZE=15' \
 '-DEFR32MG24A020F1024IM40=1' \
 '-DSL_CODE_COMPONENT_SYSTEM=system' \
 '-DSL_APP_PROPERTIES=1' \
 '-DSL_CODE_COMPONENT_BYTE_UTILITIES=byte_utilities' \
 '-DSL_CODE_COMPONENT_CLOCK_MANAGER=clock_manager' \
 '-DconfigNUM_SDK_THREAD_LOCAL_STORAGE_POINTERS=2' \
 '-DCUSTOM_TOKEN_HEADER="sl_token_manager_af_token_header.h"' \
 '-DSL_TOKEN_MANAGER_BACKEND_INT_FLASH=1' \
 '-DSL_COMMON_TOKEN_MANAGER_ENABLE_DYNAMIC_TOKENS=1' \
 '-DSL_COMMON_TOKEN_MANAGER_ENABLE_STATIC_TOKENS=1' \
 '-DSL_COMPONENT_CATALOG_PRESENT=1' \
 '-DSL_CODE_COMPONENT_DEVICE_PERIPHERAL=device_peripheral' \
 '-DSL_CODE_COMPONENT_DMADRV=dmadrv' \
 '-DSL_CODE_COMPONENT_FREERTOS_KERNEL=freertos_kernel' \
 '-DSL_CODE_COMPONENT_GPIO=gpio' \
 '-DSL_CODE_COMPONENT_HAL_COMMON=hal_common' \
 '-DSL_CODE_COMPONENT_HAL_GPIO=hal_gpio' \
 '-DSL_CODE_COMPONENT_HAL_SYSRTC=hal_sysrtc' \
 '-DSL_CODE_COMPONENT_INTERRUPT_MANAGER=interrupt_manager' \
 '-DCMSIS_NVIC_VIRTUAL=1' \
 '-DCMSIS_NVIC_VIRTUAL_HEADER_FILE="cmsis_nvic_virtual.h"' \
 '-DSL_CODE_COMPONENT_LEGACY_HAL=legacy_hal' \
 '-DCORTEXM3=1' \
 '-DCORTEXM3_EFM32_MICRO=1' \
 '-DCORTEXM3_EFR32=1' \
 '-DPHY_RAIL=1' \
 '-DPLATFORM_HEADER="platform-header.h"' \
 '-DSL_LEGACY_HAL_ENABLE_WATCHDOG=1' \
 '-DMBEDTLS_CONFIG_FILE=<sl_mbedtls_config.h>' \
 '-DSL_CODE_COMPONENT_POWER_MANAGER=power_manager' \
 '-DMBEDTLS_PSA_CRYPTO_CONFIG_FILE=<psa_crypto_config.h>' \
 '-DSL_RAIL_LIB_MULTIPROTOCOL_SUPPORT=1' \
 '-DSL_CODE_COMPONENT_RAIL_UTIL_IEEE802154_PHY_SELECT=rail_util_ieee802154_phy_select' \
 '-DSL_CODE_COMPONENT_RAIL_UTIL_IEEE802154_STACK_EVENT=rail_util_ieee802154_stack_event' \
 '-DSL_RAIL_UTIL_PA_CONFIG_HEADER=<sl_rail_util_pa_config.h>' \
 '-DSL_CODE_COMPONENT_SE_MANAGER=se_manager' \
 '-DSL_CODE_COMPONENT_CORE=core' \
 '-DSL_RAIL_3_API=1' \
 '-DSL_CODE_COMPONENT_SLEEPTIMER=sleeptimer' \
 '-DSL_CODE_COMPONENT_SLI_CRYPTO=sli_crypto' \
 '-DSLI_RADIOAES_REQUIRES_MASKING=1' \
 '-DSL_CODE_COMPONENT_SLI_PROTOCOL_CRYPTO=sli_protocol_crypto' \
 '-DSL_CODE_COMPONENT_PSEC_OSAL=psec_osal' \
 '-DEZSP_CPC=1' \
 '-DSL_ZIGBEE_AF_NCP=1' \
 '-DSL_CODE_COMPONENT_BUFFER_MANAGER=buffer_manager' \
 '-DSL_CODE_COMPONENT_IEEE_802_15_4_MAC=ieee_802_15_4_mac' \
 '-DSL_CODE_COMPONENT_ZIGBEE_STACK=zigbee_stack' \
 '-DSL_ZIGBEE_MULTI_NETWORK_STRIPPED=1' \
 '-DSL_ZIGBEE_PHY_SELECT_STACK_SUPPORT=1' \
 '-DSL_ZIGBEE_STACK_COMPLIANCE_REVISION=22' \
 '-DSTACK_CORE_HEADER="stack/core/sl_zigbee_stack.h"' \
 '-DSTACK_HEADER="stack/include/sl_zigbee.h"' \
 '-DSTACK_TYPES_HEADER="stack/include/sl_zigbee_types.h"'

ASM_DEFS += \
 '-DSL_ZIGBEE_CUSTOM_MAC_FILTER_TABLE_SIZE=15' \
 '-DEFR32MG24A020F1024IM40=1' \
 '-DSL_CODE_COMPONENT_SYSTEM=system' \
 '-DSL_APP_PROPERTIES=1' \
 '-DSL_CODE_COMPONENT_BYTE_UTILITIES=byte_utilities' \
 '-DSL_CODE_COMPONENT_CLOCK_MANAGER=clock_manager' \
 '-DconfigNUM_SDK_THREAD_LOCAL_STORAGE_POINTERS=2' \
 '-DCUSTOM_TOKEN_HEADER="sl_token_manager_af_token_header.h"' \
 '-DSL_TOKEN_MANAGER_BACKEND_INT_FLASH=1' \
 '-DSL_COMMON_TOKEN_MANAGER_ENABLE_DYNAMIC_TOKENS=1' \
 '-DSL_COMMON_TOKEN_MANAGER_ENABLE_STATIC_TOKENS=1' \
 '-DSL_COMPONENT_CATALOG_PRESENT=1' \
 '-DSL_CODE_COMPONENT_DEVICE_PERIPHERAL=device_peripheral' \
 '-DSL_CODE_COMPONENT_DMADRV=dmadrv' \
 '-DSL_CODE_COMPONENT_FREERTOS_KERNEL=freertos_kernel' \
 '-DSL_CODE_COMPONENT_GPIO=gpio' \
 '-DSL_CODE_COMPONENT_HAL_COMMON=hal_common' \
 '-DSL_CODE_COMPONENT_HAL_GPIO=hal_gpio' \
 '-DSL_CODE_COMPONENT_HAL_SYSRTC=hal_sysrtc' \
 '-DSL_CODE_COMPONENT_INTERRUPT_MANAGER=interrupt_manager' \
 '-DCMSIS_NVIC_VIRTUAL=1' \
 '-DCMSIS_NVIC_VIRTUAL_HEADER_FILE="cmsis_nvic_virtual.h"' \
 '-DSL_CODE_COMPONENT_LEGACY_HAL=legacy_hal' \
 '-DCORTEXM3=1' \
 '-DCORTEXM3_EFM32_MICRO=1' \
 '-DCORTEXM3_EFR32=1' \
 '-DPHY_RAIL=1' \
 '-DPLATFORM_HEADER="platform-header.h"' \
 '-DSL_LEGACY_HAL_ENABLE_WATCHDOG=1' \
 '-DMBEDTLS_CONFIG_FILE=<sl_mbedtls_config.h>' \
 '-DSL_CODE_COMPONENT_POWER_MANAGER=power_manager' \
 '-DMBEDTLS_PSA_CRYPTO_CONFIG_FILE=<psa_crypto_config.h>' \
 '-DSL_RAIL_LIB_MULTIPROTOCOL_SUPPORT=1' \
 '-DSL_CODE_COMPONENT_RAIL_UTIL_IEEE802154_PHY_SELECT=rail_util_ieee802154_phy_select' \
 '-DSL_CODE_COMPONENT_RAIL_UTIL_IEEE802154_STACK_EVENT=rail_util_ieee802154_stack_event' \
 '-DSL_RAIL_UTIL_PA_CONFIG_HEADER=<sl_rail_util_pa_config.h>' \
 '-DSL_CODE_COMPONENT_SE_MANAGER=se_manager' \
 '-DSL_CODE_COMPONENT_CORE=core' \
 '-DSL_RAIL_3_API=1' \
 '-DSL_CODE_COMPONENT_SLEEPTIMER=sleeptimer' \
 '-DSL_CODE_COMPONENT_SLI_CRYPTO=sli_crypto' \
 '-DSLI_RADIOAES_REQUIRES_MASKING=1' \
 '-DSL_CODE_COMPONENT_SLI_PROTOCOL_CRYPTO=sli_protocol_crypto' \
 '-DSL_CODE_COMPONENT_PSEC_OSAL=psec_osal' \
 '-DEZSP_CPC=1' \
 '-DSL_ZIGBEE_AF_NCP=1' \
 '-DSL_CODE_COMPONENT_BUFFER_MANAGER=buffer_manager' \
 '-DSL_CODE_COMPONENT_IEEE_802_15_4_MAC=ieee_802_15_4_mac' \
 '-DSL_CODE_COMPONENT_ZIGBEE_STACK=zigbee_stack' \
 '-DSL_ZIGBEE_MULTI_NETWORK_STRIPPED=1' \
 '-DSL_ZIGBEE_PHY_SELECT_STACK_SUPPORT=1' \
 '-DSL_ZIGBEE_STACK_COMPLIANCE_REVISION=22' \
 '-DSTACK_CORE_HEADER="stack/core/sl_zigbee_stack.h"' \
 '-DSTACK_HEADER="stack/include/sl_zigbee.h"' \
 '-DSTACK_TYPES_HEADER="stack/include/sl_zigbee_types.h"'

INCLUDES += \
 -Iconfig \
 -Iconfig/prioconf \
 -Iautogen \
 -I$(SDK_PATH)/platform/Device/SiliconLabs/EFR32MG24/Include \
 -I$(SDK_PATH)/platform/common/inc \
 -I$(SDK_PATH)/protocol/bluetooth/bgcommon/inc \
 -I$(SDK_PATH)/protocol/bluetooth/bgstack/ll/inc \
 -I$(SDK_PATH)/protocol/bluetooth/bgstack/ll/utils/rtos/inc \
 -I$(SDK_PATH)/protocol/bluetooth/bgstack/ll/utils/hci_packet/inc \
 -I$(SDK_PATH)/protocol/bluetooth/bgstack/ll/utils/hci_packet/cpc/inc \
 -I$(SDK_PATH)/protocol/bluetooth/bgstack/ll/utils/hci_packet/cpc/src \
 -I$(SDK_PATH)/protocol/bluetooth/bgstack/ll/utils/sleep/inc \
 -I$(SDK_PATH)/platform/bootloader \
 -I$(SDK_PATH)/platform/bootloader/api \
 -I$(SDK_PATH)/platform/bootloader/core/flash \
 -I$(SDK_PATH)/util/plugin/byte_utilities \
 -I$(SDK_PATH)/platform/service/clock_manager/inc \
 -I$(SDK_PATH)/platform/service/clock_manager/src \
 -I$(SDK_PATH)/platform/CMSIS/Core/Include \
 -I$(SDK_PATH)/platform/CMSIS/RTOS2/Include \
 -I$(SDK_PATH)/platform/service/token_manager/inc \
 -I$(SDK_PATH)/platform/service/token_manager/src \
 -I$(SDK_PATH)/platform/service/token_manager/legacy/inc \
 -I$(SDK_PATH)/platform/service/cpc/inc \
 -I$(SDK_PATH)/platform/driver/debug/inc \
 -I$(SDK_PATH)/platform/service/device_manager/inc \
 -I$(SDK_PATH)/platform/service/device_init/inc \
 -I$(SDK_PATH)/platform/emdrv/dmadrv/inc \
 -I$(SDK_PATH)/platform/emdrv/dmadrv/inc/s2_signals \
 -I$(SDK_PATH)/platform/emdrv/common/inc \
 -I$(SDK_PATH)/platform/emlib/inc \
 -I$(SDK_PATH)/util/third_party/freertos/kernel/include \
 -I$(SDK_PATH)/util/third_party/freertos/cmsis/Include \
 -I$(SDK_PATH)/util/third_party/freertos/kernel/portable/GCC/ARM_CM33_NTZ/non_secure \
 -I$(SDK_PATH)/platform/driver/gpio/inc \
 -I$(SDK_PATH)/platform/emdrv/gpiointerrupt/inc \
 -I$(SDK_PATH)/platform/peripheral/inc \
 -I$(SDK_PATH)/platform/service/hfxo_manager/inc \
 -I$(SDK_PATH)/platform/service/interrupt_manager/inc \
 -I$(SDK_PATH)/platform/service/interrupt_manager/src \
 -I$(SDK_PATH)/platform/service/interrupt_manager/inc/arm \
 -I$(SDK_PATH)/platform/service/iostream/inc \
 -I$(SDK_PATH)/platform/service/legacy_hal/inc \
 -I$(SDK_PATH)/platform/service/legacy_hal_wdog/inc \
 -I$(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/config \
 -I$(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/config/preset \
 -I$(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/inc \
 -I$(SDK_PATH)/util/third_party/mbedtls/include \
 -I$(SDK_PATH)/util/third_party/mbedtls/library \
 -I$(SDK_PATH)/platform/service/memory_manager/inc \
 -I$(SDK_PATH)/platform/service/memory_manager/src \
 -I$(SDK_PATH)/platform/service/memory_manager/profiler/inc \
 -I$(SDK_PATH)/platform/emdrv/nvm3/inc \
 -I$(SDK_PATH)/platform/emdrv/nvm3/config \
 -I$(SDK_PATH)/platform/service/power_manager/inc \
 -I$(SDK_PATH)/util/third_party/printf \
 -I$(SDK_PATH)/util/third_party/printf/inc \
 -I$(SDK_PATH)/platform/security/sl_component/sl_psa_driver/inc \
 -I$(SDK_PATH)/platform/radio/rail_lib/common \
 -I$(SDK_PATH)/platform/radio/rail_lib/protocol/ble \
 -I$(SDK_PATH)/platform/radio/rail_lib/protocol/ieee802154 \
 -I$(SDK_PATH)/platform/radio/rail_lib/protocol/wmbus \
 -I$(SDK_PATH)/platform/radio/rail_lib/protocol/zwave \
 -I$(SDK_PATH)/platform/radio/rail_lib/chip/efr32/efr32xg2x \
 -I$(SDK_PATH)/platform/radio/rail_lib/protocol/sidewalk \
 -I$(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24 \
 -I$(SDK_PATH)/platform/radio/rail_lib/plugin \
 -I$(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/common \
 -I$(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/hal/efr32 \
 -I$(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/protocol/ble \
 -I$(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/protocol/ieee802154_uc \
 -I$(SDK_PATH)/protocol/zigbee/stack/include \
 -I$(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_ieee802154 \
 -I$(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions \
 -I$(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/efr32xg24 \
 -I$(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_power_manager_init \
 -I$(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_pti \
 -I$(SDK_PATH)/platform/security/sl_component/se_manager/inc \
 -I$(SDK_PATH)/platform/service/sl_main/inc \
 -I$(SDK_PATH)/platform/service/sl_main/src \
 -I$(SDK_PATH)/platform/service/sleeptimer/inc \
 -I$(SDK_PATH)/platform/security/sl_component/sli_crypto/inc \
 -I$(SDK_PATH)/platform/security/sl_component/sl_protocol_crypto/src \
 -I$(SDK_PATH)/platform/security/sl_component/sli_psec_osal/inc \
 -I$(SDK_PATH)/platform/service/udelay/inc \
 -I$(SDK_PATH)/platform/emdrv/ustimer/inc \
 -I$(SDK_PATH)/protocol/zigbee/stack/platform/micro \
 -I$(SDK_PATH)/protocol/zigbee/stack/framework \
 -I$(SDK_PATH)/protocol/zigbee/app/framework/plugin/debug-print \
 -I$(SDK_PATH)/protocol/zigbee/stack/gp \
 -I$(SDK_PATH)/protocol/zigbee/stack/internal/inc \
 -I$(SDK_PATH)/protocol/zigbee/app/em260 \
 -I$(SDK_PATH)/protocol/zigbee/app/xncp \
 -I$(SDK_PATH)/protocol/zigbee/app/util/ezsp \
 -I$(SDK_PATH)/protocol/zigbee/app/framework/util \
 -I$(SDK_PATH)/protocol/zigbee/app/util/security \
 -I$(SDK_PATH)/protocol/zigbee/stack/zigbee \
 -I$(SDK_PATH)/protocol/zigbee/stack/security \
 -I$(SDK_PATH)/protocol/zigbee \
 -I$(SDK_PATH)/protocol/zigbee/app/util/counters \
 -I$(SDK_PATH)/protocol/zigbee/stack \
 -I$(SDK_PATH)/platform/radio/mac/rail_mux \
 -I$(SDK_PATH)/platform/radio/mac \
 -I$(SDK_PATH)/util/silicon_labs/silabs_core \
 -I$(SDK_PATH)/protocol/zigbee/stack/core \
 -I$(SDK_PATH)/protocol/zigbee/stack/mac \
 -I$(SDK_PATH)/protocol/zigbee/stack/routing/zigbee \
 -I$(SDK_PATH)/protocol/zigbee/stack/internal/src/ipc \
 -I$(SDK_PATH)/protocol/zigbee/app/framework/common \
 -I$(SDK_PATH)/protocol/zigbee/stack/zll

GROUP_START =-Wl,--start-group
GROUP_END =-Wl,--end-group

PROJECT_LIBS = \
 -lgcc \
 -lc \
 -lm \
 -lnosys \
 $(SDK_PATH)/protocol/bluetooth/bgcommon/lib/build/gcc/cortex-m33/bgcommon/release/libbgcommon.a \
 $(SDK_PATH)/protocol/bluetooth/bgstack/ll/build/gcc/xg24/release/liblinklayer.a \
 $(SDK_PATH)/platform/radio/rail_lib/autogen/librail_release/librail_multiprotocol_efr32xg24_gcc_release.a \
 $(SDK_PATH)/protocol/zigbee/build/gcc/cortex-m33/zigbee-debug-basic/release_singlenetwork/libzigbee-debug-basic.a \
 $(SDK_PATH)/protocol/zigbee/build/gcc/cortex-m33/ncp-gp-library/release_singlenetwork/libncp-gp-library.a \
 $(SDK_PATH)/protocol/zigbee/build/gcc/cortex-m33/zigbee-gp/release_singlenetwork/libzigbee-gp.a \
 $(SDK_PATH)/protocol/zigbee/build/gcc/cortex-m33/zigbee-ncp-cpc/release_singlenetwork/libzigbee-ncp-cpc.a \
 $(SDK_PATH)/protocol/zigbee/build/gcc/cortex-m33/ncp-pro-library/release_singlenetwork/libncp-pro-library.a \
 $(SDK_PATH)/protocol/zigbee/build/gcc/cortex-m33/zigbee-pro-stack/release_singlenetwork/libzigbee-pro-stack.a \
 $(SDK_PATH)/protocol/zigbee/build/gcc/cortex-m33/zigbee-r22-support/release_singlenetwork/libzigbee-r22-support.a \
 $(SDK_PATH)/protocol/zigbee/build/gcc/cortex-m33/ncp-source-route-library/release_singlenetwork/libncp-source-route-library.a \
 $(SDK_PATH)/protocol/zigbee/build/gcc/cortex-m33/zigbee-source-route/release_singlenetwork/libzigbee-source-route.a \
 $(SDK_PATH)/protocol/zigbee/build/gcc/cortex-m33/ncp-zll-library/release_singlenetwork/libncp-zll-library.a \
 $(SDK_PATH)/protocol/zigbee/build/gcc/cortex-m33/zigbee-zll/release_singlenetwork/libzigbee-zll.a

LIBS += $(GROUP_START) $(PROJECT_LIBS) $(GROUP_END)

LIB_FILES += $(filter %.a, $(PROJECT_LIBS))

C_FLAGS += \
 -mcpu=cortex-m33 \
 -mthumb \
 -mfpu=fpv5-sp-d16 \
 -mfloat-abi=hard \
 -std=c18 \
 -mcmse \
 -Wall \
 -Wextra \
 -Os \
 -fdata-sections \
 -ffunction-sections \
 -fomit-frame-pointer \
 -g \
 -fno-builtin-printf \
 -fno-builtin-sprintf \
 -fno-lto \
 --specs=nano.specs \
 -Wno-unused-parameter \
 -Wno-missing-field-initializers \
 -Wno-missing-braces

CXX_FLAGS += \
 -mcpu=cortex-m33 \
 -mthumb \
 -mfpu=fpv5-sp-d16 \
 -mfloat-abi=hard \
 -std=c++17 \
 -fno-rtti \
 -fno-exceptions \
 -mcmse \
 -Wall \
 -Wextra \
 -Os \
 -fdata-sections \
 -ffunction-sections \
 -fomit-frame-pointer \
 -g \
 -fno-builtin-printf \
 -fno-builtin-sprintf \
 -fno-lto \
 --specs=nano.specs \
 -Wno-unused-parameter \
 -Wno-missing-field-initializers \
 -Wno-missing-braces

ASM_FLAGS += \
 -mcpu=cortex-m33 \
 -mthumb \
 -mfpu=fpv5-sp-d16 \
 -mfloat-abi=hard \
 -x assembler-with-cpp

LD_FLAGS += \
 -mcpu=cortex-m33 \
 -mthumb \
 -mfpu=fpv5-sp-d16 \
 -mfloat-abi=hard \
 -T"autogen/linkerfile.ld" \
 --specs=nano.specs \
 -Xlinker -Map=$(OUTPUT_DIR)/$(PROJECTNAME).map \
 -Wl,--wrap=_free_r -Wl,--wrap=_malloc_r -Wl,--wrap=_calloc_r -Wl,--wrap=_realloc_r \
 -Wl,--wrap=main \
 -fno-lto \
 -Wl,--gc-sections


####################################################################
# Pre/Post Build Rules                                             #
####################################################################
pre-build:
	# No pre-build defined

post-build: $(OUTPUT_DIR)/$(PROJECTNAME).out
	# No post-build defined

####################################################################
# SDK Build Rules                                                  #
####################################################################
$(OUTPUT_DIR)/sdk/platform/bootloader/api/btl_interface.o: $(SDK_PATH)/platform/bootloader/api/btl_interface.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/bootloader/api/btl_interface.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/bootloader/api/btl_interface.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/bootloader/api/btl_interface.d
OBJS += $(OUTPUT_DIR)/sdk/platform/bootloader/api/btl_interface.o

$(OUTPUT_DIR)/sdk/platform/bootloader/api/btl_interface_storage.o: $(SDK_PATH)/platform/bootloader/api/btl_interface_storage.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/bootloader/api/btl_interface_storage.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/bootloader/api/btl_interface_storage.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/bootloader/api/btl_interface_storage.d
OBJS += $(OUTPUT_DIR)/sdk/platform/bootloader/api/btl_interface_storage.o

$(OUTPUT_DIR)/sdk/platform/bootloader/app_properties/app_properties.o: $(SDK_PATH)/platform/bootloader/app_properties/app_properties.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/bootloader/app_properties/app_properties.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/bootloader/app_properties/app_properties.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/bootloader/app_properties/app_properties.d
OBJS += $(OUTPUT_DIR)/sdk/platform/bootloader/app_properties/app_properties.o

$(OUTPUT_DIR)/sdk/platform/bootloader/core/flash/btl_internal_flash.o: $(SDK_PATH)/platform/bootloader/core/flash/btl_internal_flash.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/bootloader/core/flash/btl_internal_flash.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/bootloader/core/flash/btl_internal_flash.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/bootloader/core/flash/btl_internal_flash.d
OBJS += $(OUTPUT_DIR)/sdk/platform/bootloader/core/flash/btl_internal_flash.o

$(OUTPUT_DIR)/sdk/platform/CMSIS/RTOS2/Source/os_systick.o: $(SDK_PATH)/platform/CMSIS/RTOS2/Source/os_systick.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/CMSIS/RTOS2/Source/os_systick.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/CMSIS/RTOS2/Source/os_systick.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/CMSIS/RTOS2/Source/os_systick.d
OBJS += $(OUTPUT_DIR)/sdk/platform/CMSIS/RTOS2/Source/os_systick.o

$(OUTPUT_DIR)/sdk/platform/common/src/sl_assert.o: $(SDK_PATH)/platform/common/src/sl_assert.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/common/src/sl_assert.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/common/src/sl_assert.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_assert.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_assert.o

$(OUTPUT_DIR)/sdk/platform/common/src/sl_cmsis_os2_common.o: $(SDK_PATH)/platform/common/src/sl_cmsis_os2_common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/common/src/sl_cmsis_os2_common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/common/src/sl_cmsis_os2_common.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_cmsis_os2_common.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_cmsis_os2_common.o

$(OUTPUT_DIR)/sdk/platform/common/src/sl_core_cortexm.o: $(SDK_PATH)/platform/common/src/sl_core_cortexm.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/common/src/sl_core_cortexm.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/common/src/sl_core_cortexm.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_core_cortexm.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_core_cortexm.o

$(OUTPUT_DIR)/sdk/platform/common/src/sl_event_system.o: $(SDK_PATH)/platform/common/src/sl_event_system.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/common/src/sl_event_system.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/common/src/sl_event_system.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_event_system.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_event_system.o

$(OUTPUT_DIR)/sdk/platform/common/src/sl_slist.o: $(SDK_PATH)/platform/common/src/sl_slist.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/common/src/sl_slist.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/common/src/sl_slist.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_slist.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_slist.o

$(OUTPUT_DIR)/sdk/platform/common/src/sl_syscalls.o: $(SDK_PATH)/platform/common/src/sl_syscalls.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/common/src/sl_syscalls.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/common/src/sl_syscalls.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_syscalls.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_syscalls.o

$(OUTPUT_DIR)/sdk/platform/common/src/sli_cmsis_os2_ext_task_register.o: $(SDK_PATH)/platform/common/src/sli_cmsis_os2_ext_task_register.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/common/src/sli_cmsis_os2_ext_task_register.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/common/src/sli_cmsis_os2_ext_task_register.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sli_cmsis_os2_ext_task_register.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sli_cmsis_os2_ext_task_register.o

$(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32MG24/Source/startup_efr32mg24.o: $(SDK_PATH)/platform/Device/SiliconLabs/EFR32MG24/Source/startup_efr32mg24.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/Device/SiliconLabs/EFR32MG24/Source/startup_efr32mg24.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/Device/SiliconLabs/EFR32MG24/Source/startup_efr32mg24.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32MG24/Source/startup_efr32mg24.d
OBJS += $(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32MG24/Source/startup_efr32mg24.o

$(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32MG24/Source/system_efr32mg24.o: $(SDK_PATH)/platform/Device/SiliconLabs/EFR32MG24/Source/system_efr32mg24.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/Device/SiliconLabs/EFR32MG24/Source/system_efr32mg24.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/Device/SiliconLabs/EFR32MG24/Source/system_efr32mg24.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32MG24/Source/system_efr32mg24.d
OBJS += $(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32MG24/Source/system_efr32mg24.o

$(OUTPUT_DIR)/sdk/platform/driver/debug/src/sl_debug_swo.o: $(SDK_PATH)/platform/driver/debug/src/sl_debug_swo.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/driver/debug/src/sl_debug_swo.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/driver/debug/src/sl_debug_swo.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/driver/debug/src/sl_debug_swo.d
OBJS += $(OUTPUT_DIR)/sdk/platform/driver/debug/src/sl_debug_swo.o

$(OUTPUT_DIR)/sdk/platform/driver/gpio/src/sl_gpio.o: $(SDK_PATH)/platform/driver/gpio/src/sl_gpio.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/driver/gpio/src/sl_gpio.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/driver/gpio/src/sl_gpio.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/driver/gpio/src/sl_gpio.d
OBJS += $(OUTPUT_DIR)/sdk/platform/driver/gpio/src/sl_gpio.o

$(OUTPUT_DIR)/sdk/platform/emdrv/dmadrv/src/dmadrv.o: $(SDK_PATH)/platform/emdrv/dmadrv/src/dmadrv.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emdrv/dmadrv/src/dmadrv.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emdrv/dmadrv/src/dmadrv.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/dmadrv/src/dmadrv.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/dmadrv/src/dmadrv.o

$(OUTPUT_DIR)/sdk/platform/emdrv/gpiointerrupt/src/gpiointerrupt.o: $(SDK_PATH)/platform/emdrv/gpiointerrupt/src/gpiointerrupt.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emdrv/gpiointerrupt/src/gpiointerrupt.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emdrv/gpiointerrupt/src/gpiointerrupt.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/gpiointerrupt/src/gpiointerrupt.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/gpiointerrupt/src/gpiointerrupt.o

$(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3.o: $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3.o

$(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_cache.o: $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_cache.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_cache.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_cache.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_cache.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_cache.o

$(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_default_common_linker.o: $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_default_common_linker.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_default_common_linker.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_default_common_linker.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_default_common_linker.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_default_common_linker.o

$(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_hal_flash.o: $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_hal_flash.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_hal_flash.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_hal_flash.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_hal_flash.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_hal_flash.o

$(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_lock.o: $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_lock.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_lock.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_lock.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_lock.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_lock.o

$(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_object.o: $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_object.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_object.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_object.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_object.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_object.o

$(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_page.o: $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_page.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_page.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_page.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_page.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_page.o

$(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_utils.o: $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_utils.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_utils.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_utils.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_utils.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_utils.o

$(OUTPUT_DIR)/sdk/platform/emdrv/ustimer/src/ustimer.o: $(SDK_PATH)/platform/emdrv/ustimer/src/ustimer.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emdrv/ustimer/src/ustimer.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emdrv/ustimer/src/ustimer.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/ustimer/src/ustimer.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/ustimer/src/ustimer.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_burtc.o: $(SDK_PATH)/platform/emlib/src/em_burtc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_burtc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_burtc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_burtc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_burtc.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_cmu.o: $(SDK_PATH)/platform/emlib/src/em_cmu.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_cmu.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_cmu.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_cmu.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_cmu.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_emu.o: $(SDK_PATH)/platform/emlib/src/em_emu.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_emu.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_emu.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_emu.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_emu.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_gpio.o: $(SDK_PATH)/platform/emlib/src/em_gpio.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_gpio.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_gpio.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_gpio.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_gpio.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_ldma.o: $(SDK_PATH)/platform/emlib/src/em_ldma.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_ldma.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_ldma.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_ldma.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_ldma.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_msc.o: $(SDK_PATH)/platform/emlib/src/em_msc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_msc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_msc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_msc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_msc.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_prs.o: $(SDK_PATH)/platform/emlib/src/em_prs.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_prs.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_prs.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_prs.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_prs.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_rmu.o: $(SDK_PATH)/platform/emlib/src/em_rmu.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_rmu.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_rmu.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_rmu.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_rmu.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_system.o: $(SDK_PATH)/platform/emlib/src/em_system.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_system.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_system.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_system.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_system.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_timer.o: $(SDK_PATH)/platform/emlib/src/em_timer.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_timer.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_timer.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_timer.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_timer.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_usart.o: $(SDK_PATH)/platform/emlib/src/em_usart.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_usart.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_usart.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_usart.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_usart.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_wdog.o: $(SDK_PATH)/platform/emlib/src/em_wdog.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_wdog.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_wdog.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_wdog.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_wdog.o

$(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_gpio.o: $(SDK_PATH)/platform/peripheral/src/sl_hal_gpio.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/peripheral/src/sl_hal_gpio.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/peripheral/src/sl_hal_gpio.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_gpio.d
OBJS += $(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_gpio.o

$(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_sysrtc.o: $(SDK_PATH)/platform/peripheral/src/sl_hal_sysrtc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/peripheral/src/sl_hal_sysrtc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/peripheral/src/sl_hal_sysrtc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_sysrtc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_sysrtc.o

$(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_timer.o: $(SDK_PATH)/platform/peripheral/src/sl_hal_timer.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/peripheral/src/sl_hal_timer.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/peripheral/src/sl_hal_timer.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_timer.d
OBJS += $(OUTPUT_DIR)/sdk/platform/peripheral/src/sl_hal_timer.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/coexistence/common/coexistence-pwm.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/common/coexistence-pwm.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/common/coexistence-pwm.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/common/coexistence-pwm.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/coexistence/common/coexistence-pwm.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/coexistence/common/coexistence-pwm.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/coexistence/common/coexistence.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/common/coexistence.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/common/coexistence.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/common/coexistence.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/coexistence/common/coexistence.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/coexistence/common/coexistence.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/coexistence/hal/efr32/coexistence-directional-priority.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/hal/efr32/coexistence-directional-priority.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/hal/efr32/coexistence-directional-priority.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/hal/efr32/coexistence-directional-priority.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/coexistence/hal/efr32/coexistence-directional-priority.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/coexistence/hal/efr32/coexistence-directional-priority.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/coexistence/hal/efr32/coexistence-hal.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/hal/efr32/coexistence-hal.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/hal/efr32/coexistence-hal.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/hal/efr32/coexistence-hal.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/coexistence/hal/efr32/coexistence-hal.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/coexistence/hal/efr32/coexistence-hal.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/coexistence/protocol/ble/coexistence-ble-counters.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/protocol/ble/coexistence-ble-counters.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/protocol/ble/coexistence-ble-counters.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/protocol/ble/coexistence-ble-counters.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/coexistence/protocol/ble/coexistence-ble-counters.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/coexistence/protocol/ble/coexistence-ble-counters.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/coexistence/protocol/ble/coexistence-ble.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/protocol/ble/coexistence-ble.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/protocol/ble/coexistence-ble.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/protocol/ble/coexistence-ble.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/coexistence/protocol/ble/coexistence-ble.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/coexistence/protocol/ble/coexistence-ble.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/coexistence/protocol/ieee802154_uc/coexistence-802154.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/protocol/ieee802154_uc/coexistence-802154.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/protocol/ieee802154_uc/coexistence-802154.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/protocol/ieee802154_uc/coexistence-802154.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/coexistence/protocol/ieee802154_uc/coexistence-802154.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/coexistence/protocol/ieee802154_uc/coexistence-802154.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/coexistence/protocol/ieee802154_uc/sl_zigbee_coexistence_cb.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/protocol/ieee802154_uc/sl_zigbee_coexistence_cb.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/protocol/ieee802154_uc/sl_zigbee_coexistence_cb.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/protocol/ieee802154_uc/sl_zigbee_coexistence_cb.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/coexistence/protocol/ieee802154_uc/sl_zigbee_coexistence_cb.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/coexistence/protocol/ieee802154_uc/sl_zigbee_coexistence_cb.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/pa-conversions/pa_conversions_efr32.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/pa_conversions_efr32.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/pa_conversions_efr32.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/pa_conversions_efr32.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/pa-conversions/pa_conversions_efr32.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/pa-conversions/pa_conversions_efr32.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/pa-conversions/pa_curves_efr32.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/pa_curves_efr32.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/pa_curves_efr32.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/pa_curves_efr32.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/pa-conversions/pa_curves_efr32.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/pa-conversions/pa_curves_efr32.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_ant_div/sl_rail_util_ant_div.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_ant_div/sl_rail_util_ant_div.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_ant_div/sl_rail_util_ant_div.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_ant_div/sl_rail_util_ant_div.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_ant_div/sl_rail_util_ant_div.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_ant_div/sl_rail_util_ant_div.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ble_config_38M4Hz.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ble_config_38M4Hz.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ble_config_38M4Hz.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ble_config_38M4Hz.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ble_config_38M4Hz.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ble_config_38M4Hz.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ble_config_39MHz.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ble_config_39MHz.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ble_config_39MHz.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ble_config_39MHz.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ble_config_39MHz.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ble_config_39MHz.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ble_config_40MHz.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ble_config_40MHz.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ble_config_40MHz.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ble_config_40MHz.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ble_config_40MHz.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ble_config_40MHz.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ieee802154_config_38M4Hz.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ieee802154_config_38M4Hz.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ieee802154_config_38M4Hz.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ieee802154_config_38M4Hz.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ieee802154_config_38M4Hz.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ieee802154_config_38M4Hz.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ieee802154_config_39MHz.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ieee802154_config_39MHz.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ieee802154_config_39MHz.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ieee802154_config_39MHz.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ieee802154_config_39MHz.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ieee802154_config_39MHz.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ieee802154_config_40MHz.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ieee802154_config_40MHz.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ieee802154_config_40MHz.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ieee802154_config_40MHz.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ieee802154_config_40MHz.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_ieee802154_config_40MHz.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_rfsense_ook_config_38M4Hz.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_rfsense_ook_config_38M4Hz.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_rfsense_ook_config_38M4Hz.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_rfsense_ook_config_38M4Hz.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_rfsense_ook_config_38M4Hz.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_rfsense_ook_config_38M4Hz.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_rfsense_ook_config_39MHz.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_rfsense_ook_config_39MHz.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_rfsense_ook_config_39MHz.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_rfsense_ook_config_39MHz.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_rfsense_ook_config_39MHz.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_rfsense_ook_config_39MHz.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_rfsense_ook_config_40MHz.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_rfsense_ook_config_40MHz.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_rfsense_ook_config_40MHz.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_rfsense_ook_config_40MHz.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_rfsense_ook_config_40MHz.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_built_in_phys/efr32xg24/sl_rail_rfsense_ook_config_40MHz.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_built_in_phys/sl_rail_phy_overrides.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_built_in_phys/sl_rail_phy_overrides.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_built_in_phys/sl_rail_phy_overrides.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_built_in_phys/sl_rail_phy_overrides.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_built_in_phys/sl_rail_phy_overrides.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_built_in_phys/sl_rail_phy_overrides.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_power_manager_init/sl_rail_util_power_manager_init.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_power_manager_init/sl_rail_util_power_manager_init.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_power_manager_init/sl_rail_util_power_manager_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_power_manager_init/sl_rail_util_power_manager_init.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_power_manager_init/sl_rail_util_power_manager_init.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_power_manager_init/sl_rail_util_power_manager_init.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_sequencer/sl_rail_util_sequencer.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_sequencer/sl_rail_util_sequencer.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_sequencer/sl_rail_util_sequencer.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_sequencer/sl_rail_util_sequencer.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_sequencer/sl_rail_util_sequencer.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_sequencer/sl_rail_util_sequencer.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager.o: $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_attestation.o: $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_attestation.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_attestation.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_attestation.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_attestation.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_attestation.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_cipher.o: $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_cipher.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_cipher.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_cipher.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_cipher.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_cipher.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_entropy.o: $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_entropy.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_entropy.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_entropy.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_entropy.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_entropy.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_hash.o: $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_hash.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_hash.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_hash.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_hash.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_hash.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_key_derivation.o: $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_key_derivation.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_key_derivation.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_key_derivation.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_key_derivation.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_key_derivation.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_key_handling.o: $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_key_handling.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_key_handling.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_key_handling.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_key_handling.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_key_handling.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_signature.o: $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_signature.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_signature.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_signature.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_signature.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_signature.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_util.o: $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_util.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_util.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/se_manager/src/sl_se_manager_util.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_util.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sl_se_manager_util.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sli_se_manager_mailbox.o: $(SDK_PATH)/platform/security/sl_component/se_manager/src/sli_se_manager_mailbox.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/se_manager/src/sli_se_manager_mailbox.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/se_manager/src/sli_se_manager_mailbox.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sli_se_manager_mailbox.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/se_manager/src/sli_se_manager_mailbox.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.o: $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_psa_crypto.o: $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sl_psa_crypto.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sl_psa_crypto.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sl_psa_crypto.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_psa_crypto.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_psa_crypto.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sli_psa_crypto.o: $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sli_psa_crypto.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sli_psa_crypto.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sli_psa_crypto.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sli_psa_crypto.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sli_psa_crypto.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_protocol_crypto/src/sli_protocol_crypto_radioaes.o: $(SDK_PATH)/platform/security/sl_component/sl_protocol_crypto/src/sli_protocol_crypto_radioaes.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_protocol_crypto/src/sli_protocol_crypto_radioaes.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_protocol_crypto/src/sli_protocol_crypto_radioaes.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_protocol_crypto/src/sli_protocol_crypto_radioaes.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_protocol_crypto/src/sli_protocol_crypto_radioaes.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_protocol_crypto/src/sli_radioaes_management.o: $(SDK_PATH)/platform/security/sl_component/sl_protocol_crypto/src/sli_radioaes_management.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_protocol_crypto/src/sli_radioaes_management.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_protocol_crypto/src/sli_radioaes_management.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_protocol_crypto/src/sli_radioaes_management.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_protocol_crypto/src/sli_radioaes_management.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sl_psa_its_nvm3.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sl_psa_its_nvm3.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sl_psa_its_nvm3.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sl_psa_its_nvm3.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sl_psa_its_nvm3.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sl_psa_its_nvm3.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_common.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_common.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_common.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_common.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_init.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_init.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_init.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_init.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_init.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_psa_trng.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_psa_trng.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_psa_trng.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_psa_trng.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_psa_trng.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_psa_trng.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_aead.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_aead.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_aead.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_aead.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_aead.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_aead.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_builtin_keys.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_builtin_keys.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_builtin_keys.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_builtin_keys.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_builtin_keys.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_builtin_keys.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_cipher.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_cipher.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_cipher.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_cipher.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_cipher.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_cipher.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_key_derivation.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_key_derivation.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_key_derivation.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_key_derivation.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_key_derivation.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_key_derivation.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_key_management.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_key_management.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_key_management.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_key_management.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_key_management.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_key_management.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_mac.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_mac.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_mac.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_mac.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_mac.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_mac.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_signature.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_signature.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_signature.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_signature.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_signature.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_driver_signature.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_aead.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_aead.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_aead.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_aead.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_aead.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_aead.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_cipher.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_cipher.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_cipher.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_cipher.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_cipher.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_cipher.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_mac.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_mac.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_mac.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_mac.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_mac.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_driver_mac.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_key_derivation.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_key_derivation.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_key_derivation.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_key_derivation.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_key_derivation.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_opaque_key_derivation.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_aead.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_aead.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_aead.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_aead.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_aead.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_aead.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_cipher.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_cipher.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_cipher.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_cipher.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_cipher.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_cipher.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_hash.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_hash.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_hash.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_hash.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_hash.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_hash.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_mac.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_mac.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_mac.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_mac.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_mac.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_driver_mac.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_key_derivation.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_key_derivation.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_key_derivation.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_key_derivation.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_key_derivation.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_transparent_key_derivation.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_version_dependencies.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_version_dependencies.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_version_dependencies.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_version_dependencies.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_version_dependencies.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_version_dependencies.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sli_crypto/src/sl_crypto_s2.o: $(SDK_PATH)/platform/security/sl_component/sli_crypto/src/sl_crypto_s2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sli_crypto/src/sl_crypto_s2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sli_crypto/src/sl_crypto_s2.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sli_crypto/src/sl_crypto_s2.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sli_crypto/src/sl_crypto_s2.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sli_psec_osal/src/sli_psec_osal_cmsis_rtos2.o: $(SDK_PATH)/platform/security/sl_component/sli_psec_osal/src/sli_psec_osal_cmsis_rtos2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sli_psec_osal/src/sli_psec_osal_cmsis_rtos2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sli_psec_osal/src/sli_psec_osal_cmsis_rtos2.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sli_psec_osal/src/sli_psec_osal_cmsis_rtos2.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sli_psec_osal/src/sli_psec_osal_cmsis_rtos2.o

$(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager.o: $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager.o

$(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_hal_s2.o: $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_hal_s2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_hal_s2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_hal_s2.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_hal_s2.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_hal_s2.o

$(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_init.o: $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_init.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_init.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_init.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_init.o

$(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.o: $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.o

$(OUTPUT_DIR)/sdk/platform/service/cpc/src/sl_cpc.o: $(SDK_PATH)/platform/service/cpc/src/sl_cpc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/cpc/src/sl_cpc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/cpc/src/sl_cpc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/cpc/src/sl_cpc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/cpc/src/sl_cpc.o

$(OUTPUT_DIR)/sdk/platform/service/cpc/src/sl_cpc_crc.o: $(SDK_PATH)/platform/service/cpc/src/sl_cpc_crc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/cpc/src/sl_cpc_crc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/cpc/src/sl_cpc_crc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/cpc/src/sl_cpc_crc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/cpc/src/sl_cpc_crc.o

$(OUTPUT_DIR)/sdk/platform/service/cpc/src/sl_cpc_dispatcher.o: $(SDK_PATH)/platform/service/cpc/src/sl_cpc_dispatcher.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/cpc/src/sl_cpc_dispatcher.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/cpc/src/sl_cpc_dispatcher.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/cpc/src/sl_cpc_dispatcher.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/cpc/src/sl_cpc_dispatcher.o

$(OUTPUT_DIR)/sdk/platform/service/cpc/src/sl_cpc_drv_uart.o: $(SDK_PATH)/platform/service/cpc/src/sl_cpc_drv_uart.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/cpc/src/sl_cpc_drv_uart.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/cpc/src/sl_cpc_drv_uart.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/cpc/src/sl_cpc_drv_uart.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/cpc/src/sl_cpc_drv_uart.o

$(OUTPUT_DIR)/sdk/platform/service/cpc/src/sl_cpc_hdlc.o: $(SDK_PATH)/platform/service/cpc/src/sl_cpc_hdlc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/cpc/src/sl_cpc_hdlc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/cpc/src/sl_cpc_hdlc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/cpc/src/sl_cpc_hdlc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/cpc/src/sl_cpc_hdlc.o

$(OUTPUT_DIR)/sdk/platform/service/cpc/src/sl_cpc_instance.o: $(SDK_PATH)/platform/service/cpc/src/sl_cpc_instance.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/cpc/src/sl_cpc_instance.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/cpc/src/sl_cpc_instance.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/cpc/src/sl_cpc_instance.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/cpc/src/sl_cpc_instance.o

$(OUTPUT_DIR)/sdk/platform/service/cpc/src/sl_cpc_memory.o: $(SDK_PATH)/platform/service/cpc/src/sl_cpc_memory.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/cpc/src/sl_cpc_memory.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/cpc/src/sl_cpc_memory.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/cpc/src/sl_cpc_memory.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/cpc/src/sl_cpc_memory.o

$(OUTPUT_DIR)/sdk/platform/service/cpc/src/sl_cpc_security.o: $(SDK_PATH)/platform/service/cpc/src/sl_cpc_security.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/cpc/src/sl_cpc_security.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/cpc/src/sl_cpc_security.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/cpc/src/sl_cpc_security.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/cpc/src/sl_cpc_security.o

$(OUTPUT_DIR)/sdk/platform/service/cpc/src/sl_cpc_system_secondary.o: $(SDK_PATH)/platform/service/cpc/src/sl_cpc_system_secondary.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/cpc/src/sl_cpc_system_secondary.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/cpc/src/sl_cpc_system_secondary.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/cpc/src/sl_cpc_system_secondary.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/cpc/src/sl_cpc_system_secondary.o

$(OUTPUT_DIR)/sdk/platform/service/cpc/src/sl_cpc_system_secondary_efr.o: $(SDK_PATH)/platform/service/cpc/src/sl_cpc_system_secondary_efr.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/cpc/src/sl_cpc_system_secondary_efr.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/cpc/src/sl_cpc_system_secondary_efr.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/cpc/src/sl_cpc_system_secondary_efr.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/cpc/src/sl_cpc_system_secondary_efr.o

$(OUTPUT_DIR)/sdk/platform/service/cpc/src/sli_cpc_assert.o: $(SDK_PATH)/platform/service/cpc/src/sli_cpc_assert.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/cpc/src/sli_cpc_assert.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/cpc/src/sli_cpc_assert.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/cpc/src/sli_cpc_assert.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/cpc/src/sli_cpc_assert.o

$(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_dcdc_s2.o: $(SDK_PATH)/platform/service/device_init/src/sl_device_init_dcdc_s2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/device_init/src/sl_device_init_dcdc_s2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/device_init/src/sl_device_init_dcdc_s2.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_dcdc_s2.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_dcdc_s2.o

$(OUTPUT_DIR)/sdk/platform/service/device_manager/clocks/sl_device_clock_efr32xg24.o: $(SDK_PATH)/platform/service/device_manager/clocks/sl_device_clock_efr32xg24.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/device_manager/clocks/sl_device_clock_efr32xg24.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/device_manager/clocks/sl_device_clock_efr32xg24.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/clocks/sl_device_clock_efr32xg24.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/clocks/sl_device_clock_efr32xg24.o

$(OUTPUT_DIR)/sdk/platform/service/device_manager/devices/sl_device_peripheral_hal_efr32xg24.o: $(SDK_PATH)/platform/service/device_manager/devices/sl_device_peripheral_hal_efr32xg24.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/device_manager/devices/sl_device_peripheral_hal_efr32xg24.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/device_manager/devices/sl_device_peripheral_hal_efr32xg24.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/devices/sl_device_peripheral_hal_efr32xg24.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/devices/sl_device_peripheral_hal_efr32xg24.o

$(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_clock.o: $(SDK_PATH)/platform/service/device_manager/src/sl_device_clock.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/device_manager/src/sl_device_clock.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/device_manager/src/sl_device_clock.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_clock.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_clock.o

$(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_gpio.o: $(SDK_PATH)/platform/service/device_manager/src/sl_device_gpio.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/device_manager/src/sl_device_gpio.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/device_manager/src/sl_device_gpio.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_gpio.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_gpio.o

$(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_peripheral.o: $(SDK_PATH)/platform/service/device_manager/src/sl_device_peripheral.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/device_manager/src/sl_device_peripheral.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/device_manager/src/sl_device_peripheral.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_peripheral.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_peripheral.o

$(OUTPUT_DIR)/sdk/platform/service/hfxo_manager/src/sl_hfxo_manager.o: $(SDK_PATH)/platform/service/hfxo_manager/src/sl_hfxo_manager.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/hfxo_manager/src/sl_hfxo_manager.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/hfxo_manager/src/sl_hfxo_manager.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/hfxo_manager/src/sl_hfxo_manager.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/hfxo_manager/src/sl_hfxo_manager.o

$(OUTPUT_DIR)/sdk/platform/service/hfxo_manager/src/sl_hfxo_manager_hal_s2.o: $(SDK_PATH)/platform/service/hfxo_manager/src/sl_hfxo_manager_hal_s2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/hfxo_manager/src/sl_hfxo_manager_hal_s2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/hfxo_manager/src/sl_hfxo_manager_hal_s2.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/hfxo_manager/src/sl_hfxo_manager_hal_s2.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/hfxo_manager/src/sl_hfxo_manager_hal_s2.o

$(OUTPUT_DIR)/sdk/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.o: $(SDK_PATH)/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.o

$(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream.o: $(SDK_PATH)/platform/service/iostream/src/sl_iostream.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/iostream/src/sl_iostream.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/iostream/src/sl_iostream.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream.o

$(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_debug.o: $(SDK_PATH)/platform/service/iostream/src/sl_iostream_debug.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/iostream/src/sl_iostream_debug.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/iostream/src/sl_iostream_debug.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_debug.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_debug.o

$(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_swo_itm_8.o: $(SDK_PATH)/platform/service/iostream/src/sl_iostream_swo_itm_8.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/iostream/src/sl_iostream_swo_itm_8.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/iostream/src/sl_iostream_swo_itm_8.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_swo_itm_8.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_swo_itm_8.o

$(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/base-replacement.o: $(SDK_PATH)/platform/service/legacy_hal/src/base-replacement.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/legacy_hal/src/base-replacement.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/legacy_hal/src/base-replacement.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/base-replacement.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/base-replacement.o

$(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/crc.o: $(SDK_PATH)/platform/service/legacy_hal/src/crc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/legacy_hal/src/crc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/legacy_hal/src/crc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/crc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/crc.o

$(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/diagnostic.o: $(SDK_PATH)/platform/service/legacy_hal/src/diagnostic.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/legacy_hal/src/diagnostic.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/legacy_hal/src/diagnostic.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/diagnostic.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/diagnostic.o

$(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/ember-phy.o: $(SDK_PATH)/platform/service/legacy_hal/src/ember-phy.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/legacy_hal/src/ember-phy.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/legacy_hal/src/ember-phy.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/ember-phy.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/ember-phy.o

$(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/faults.o: $(SDK_PATH)/platform/service/legacy_hal/src/faults.s
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/legacy_hal/src/faults.s'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(ASMFLAGS) -c -o $@ $(SDK_PATH)/platform/service/legacy_hal/src/faults.s
ASMDEPS_s += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/faults.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/faults.o

$(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/random.o: $(SDK_PATH)/platform/service/legacy_hal/src/random.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/legacy_hal/src/random.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/legacy_hal/src/random.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/random.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/random.o

$(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/token_legacy.o: $(SDK_PATH)/platform/service/legacy_hal/src/token_legacy.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/legacy_hal/src/token_legacy.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/legacy_hal/src/token_legacy.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/token_legacy.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/token_legacy.o

$(OUTPUT_DIR)/sdk/platform/service/legacy_hal_wdog/src/sl_legacy_hal_wdog.o: $(SDK_PATH)/platform/service/legacy_hal_wdog/src/sl_legacy_hal_wdog.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/legacy_hal_wdog/src/sl_legacy_hal_wdog.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/legacy_hal_wdog/src/sl_legacy_hal_wdog.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal_wdog/src/sl_legacy_hal_wdog.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal_wdog/src/sl_legacy_hal_wdog.o

$(OUTPUT_DIR)/sdk/platform/service/memory_manager/profiler/src/sli_memory_profiler_stubs.o: $(SDK_PATH)/platform/service/memory_manager/profiler/src/sli_memory_profiler_stubs.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/memory_manager/profiler/src/sli_memory_profiler_stubs.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/memory_manager/profiler/src/sli_memory_profiler_stubs.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/profiler/src/sli_memory_profiler_stubs.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/profiler/src/sli_memory_profiler_stubs.o

$(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager.o: $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager.o

$(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_dynamic_reservation.o: $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_dynamic_reservation.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_dynamic_reservation.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_dynamic_reservation.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_dynamic_reservation.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_dynamic_reservation.o

$(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_pool.o: $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_pool.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_pool.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_pool.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_pool.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_pool.o

$(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_pool_common.o: $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_pool_common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_pool_common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_pool_common.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_pool_common.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_pool_common.o

$(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_region.o: $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_region.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_region.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_region.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_region.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_region.o

$(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_retarget.o: $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_retarget.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_retarget.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_retarget.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_retarget.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_retarget.o

$(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sli_memory_manager_common.o: $(SDK_PATH)/platform/service/memory_manager/src/sli_memory_manager_common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/memory_manager/src/sli_memory_manager_common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/memory_manager/src/sli_memory_manager_common.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sli_memory_manager_common.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sli_memory_manager_common.o

$(OUTPUT_DIR)/sdk/platform/service/power_manager/src/common/sl_power_manager_common.o: $(SDK_PATH)/platform/service/power_manager/src/common/sl_power_manager_common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/power_manager/src/common/sl_power_manager_common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/power_manager/src/common/sl_power_manager_common.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/common/sl_power_manager_common.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/common/sl_power_manager_common.o

$(OUTPUT_DIR)/sdk/platform/service/power_manager/src/common/sl_power_manager_em4.o: $(SDK_PATH)/platform/service/power_manager/src/common/sl_power_manager_em4.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/power_manager/src/common/sl_power_manager_em4.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/power_manager/src/common/sl_power_manager_em4.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/common/sl_power_manager_em4.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/common/sl_power_manager_em4.o

$(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sleep_loop/sl_power_manager.o: $(SDK_PATH)/platform/service/power_manager/src/sleep_loop/sl_power_manager.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/power_manager/src/sleep_loop/sl_power_manager.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/power_manager/src/sleep_loop/sl_power_manager.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sleep_loop/sl_power_manager.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sleep_loop/sl_power_manager.o

$(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sleep_loop/sl_power_manager_debug.o: $(SDK_PATH)/platform/service/power_manager/src/sleep_loop/sl_power_manager_debug.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/power_manager/src/sleep_loop/sl_power_manager_debug.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/power_manager/src/sleep_loop/sl_power_manager_debug.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sleep_loop/sl_power_manager_debug.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sleep_loop/sl_power_manager_debug.o

$(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sleep_loop/sl_power_manager_hal_s2.o: $(SDK_PATH)/platform/service/power_manager/src/sleep_loop/sl_power_manager_hal_s2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/power_manager/src/sleep_loop/sl_power_manager_hal_s2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/power_manager/src/sleep_loop/sl_power_manager_hal_s2.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sleep_loop/sl_power_manager_hal_s2.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sleep_loop/sl_power_manager_hal_s2.o

$(OUTPUT_DIR)/sdk/platform/service/sl_main/src/rtos/main_retarget.o: $(SDK_PATH)/platform/service/sl_main/src/rtos/main_retarget.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/sl_main/src/rtos/main_retarget.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/sl_main/src/rtos/main_retarget.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sl_main/src/rtos/main_retarget.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sl_main/src/rtos/main_retarget.o

$(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_init.o: $(SDK_PATH)/platform/service/sl_main/src/sl_main_init.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/sl_main/src/sl_main_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/sl_main/src/sl_main_init.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_init.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_init.o

$(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_init_memory.o: $(SDK_PATH)/platform/service/sl_main/src/sl_main_init_memory.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/sl_main/src/sl_main_init_memory.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/sl_main/src/sl_main_init_memory.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_init_memory.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_init_memory.o

$(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_kernel.o: $(SDK_PATH)/platform/service/sl_main/src/sl_main_kernel.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/sl_main/src/sl_main_kernel.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/sl_main/src/sl_main_kernel.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_kernel.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_kernel.o

$(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer.o: $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer.o

$(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_burtc.o: $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_burtc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_burtc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_burtc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_burtc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_burtc.o

$(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_sysrtc.o: $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_sysrtc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_sysrtc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_sysrtc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_sysrtc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_sysrtc.o

$(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.o: $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.o

$(OUTPUT_DIR)/sdk/platform/service/token_manager/legacy/src/sl_token_def.o: $(SDK_PATH)/platform/service/token_manager/legacy/src/sl_token_def.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/token_manager/legacy/src/sl_token_def.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/token_manager/legacy/src/sl_token_def.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/token_manager/legacy/src/sl_token_def.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/token_manager/legacy/src/sl_token_def.o

$(OUTPUT_DIR)/sdk/platform/service/token_manager/legacy/src/sl_token_manager.o: $(SDK_PATH)/platform/service/token_manager/legacy/src/sl_token_manager.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/token_manager/legacy/src/sl_token_manager.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/token_manager/legacy/src/sl_token_manager.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/token_manager/legacy/src/sl_token_manager.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/token_manager/legacy/src/sl_token_manager.o

$(OUTPUT_DIR)/sdk/platform/service/token_manager/legacy/src/sl_token_manufacturing.o: $(SDK_PATH)/platform/service/token_manager/legacy/src/sl_token_manufacturing.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/token_manager/legacy/src/sl_token_manufacturing.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/token_manager/legacy/src/sl_token_manufacturing.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/token_manager/legacy/src/sl_token_manufacturing.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/token_manager/legacy/src/sl_token_manufacturing.o

$(OUTPUT_DIR)/sdk/platform/service/token_manager/legacy/src/sl_token_manufacturing_generic.o: $(SDK_PATH)/platform/service/token_manager/legacy/src/sl_token_manufacturing_generic.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/token_manager/legacy/src/sl_token_manufacturing_generic.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/token_manager/legacy/src/sl_token_manufacturing_generic.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/token_manager/legacy/src/sl_token_manufacturing_generic.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/token_manager/legacy/src/sl_token_manufacturing_generic.o

$(OUTPUT_DIR)/sdk/platform/service/token_manager/src/sl_token_manager_api.o: $(SDK_PATH)/platform/service/token_manager/src/sl_token_manager_api.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/token_manager/src/sl_token_manager_api.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/token_manager/src/sl_token_manager_api.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/token_manager/src/sl_token_manager_api.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/token_manager/src/sl_token_manager_api.o

$(OUTPUT_DIR)/sdk/platform/service/token_manager/src/sl_token_manager_lock.o: $(SDK_PATH)/platform/service/token_manager/src/sl_token_manager_lock.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/token_manager/src/sl_token_manager_lock.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/token_manager/src/sl_token_manager_lock.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/token_manager/src/sl_token_manager_lock.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/token_manager/src/sl_token_manager_lock.o

$(OUTPUT_DIR)/sdk/platform/service/token_manager/src/sli_token_manager_dynamic.o: $(SDK_PATH)/platform/service/token_manager/src/sli_token_manager_dynamic.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/token_manager/src/sli_token_manager_dynamic.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/token_manager/src/sli_token_manager_dynamic.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/token_manager/src/sli_token_manager_dynamic.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/token_manager/src/sli_token_manager_dynamic.o

$(OUTPUT_DIR)/sdk/platform/service/token_manager/src/sli_token_manager_internal.o: $(SDK_PATH)/platform/service/token_manager/src/sli_token_manager_internal.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/token_manager/src/sli_token_manager_internal.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/token_manager/src/sli_token_manager_internal.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/token_manager/src/sli_token_manager_internal.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/token_manager/src/sli_token_manager_internal.o

$(OUTPUT_DIR)/sdk/platform/service/token_manager/src/sli_token_manager_manufacturing.o: $(SDK_PATH)/platform/service/token_manager/src/sli_token_manager_manufacturing.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/token_manager/src/sli_token_manager_manufacturing.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/token_manager/src/sli_token_manager_manufacturing.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/token_manager/src/sli_token_manager_manufacturing.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/token_manager/src/sli_token_manager_manufacturing.o

$(OUTPUT_DIR)/sdk/platform/service/udelay/src/sl_udelay.o: $(SDK_PATH)/platform/service/udelay/src/sl_udelay.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/udelay/src/sl_udelay.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/udelay/src/sl_udelay.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/udelay/src/sl_udelay.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/udelay/src/sl_udelay.o

$(OUTPUT_DIR)/sdk/platform/service/udelay/src/sl_udelay_armv6m_gcc.o: $(SDK_PATH)/platform/service/udelay/src/sl_udelay_armv6m_gcc.S
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/udelay/src/sl_udelay_armv6m_gcc.S'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(ASMFLAGS) -c -o $@ $(SDK_PATH)/platform/service/udelay/src/sl_udelay_armv6m_gcc.S
ASMDEPS_S += $(OUTPUT_DIR)/sdk/platform/service/udelay/src/sl_udelay_armv6m_gcc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/udelay/src/sl_udelay_armv6m_gcc.o

$(OUTPUT_DIR)/sdk/protocol/bluetooth/bgcommon/src/sli_bgcommon_debug_efr32.o: $(SDK_PATH)/protocol/bluetooth/bgcommon/src/sli_bgcommon_debug_efr32.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/bluetooth/bgcommon/src/sli_bgcommon_debug_efr32.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/bluetooth/bgcommon/src/sli_bgcommon_debug_efr32.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/bgcommon/src/sli_bgcommon_debug_efr32.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/bgcommon/src/sli_bgcommon_debug_efr32.o

$(OUTPUT_DIR)/sdk/protocol/bluetooth/bgstack/ll/src/sl_btctrl_init.o: $(SDK_PATH)/protocol/bluetooth/bgstack/ll/src/sl_btctrl_init.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/bluetooth/bgstack/ll/src/sl_btctrl_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/bluetooth/bgstack/ll/src/sl_btctrl_init.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/bgstack/ll/src/sl_btctrl_init.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/bgstack/ll/src/sl_btctrl_init.o

$(OUTPUT_DIR)/sdk/protocol/bluetooth/bgstack/ll/src/sl_btctrl_init_tasklets.o: $(SDK_PATH)/protocol/bluetooth/bgstack/ll/src/sl_btctrl_init_tasklets.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/bluetooth/bgstack/ll/src/sl_btctrl_init_tasklets.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/bluetooth/bgstack/ll/src/sl_btctrl_init_tasklets.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/bgstack/ll/src/sl_btctrl_init_tasklets.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/bgstack/ll/src/sl_btctrl_init_tasklets.o

$(OUTPUT_DIR)/sdk/protocol/bluetooth/bgstack/ll/utils/hci_packet/cpc/src/sl_hci_cpc.o: $(SDK_PATH)/protocol/bluetooth/bgstack/ll/utils/hci_packet/cpc/src/sl_hci_cpc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/bluetooth/bgstack/ll/utils/hci_packet/cpc/src/sl_hci_cpc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/bluetooth/bgstack/ll/utils/hci_packet/cpc/src/sl_hci_cpc.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/bgstack/ll/utils/hci_packet/cpc/src/sl_hci_cpc.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/bgstack/ll/utils/hci_packet/cpc/src/sl_hci_cpc.o

$(OUTPUT_DIR)/sdk/protocol/bluetooth/bgstack/ll/utils/hci_packet/cpc/src/sl_hci_cpc_rtos.o: $(SDK_PATH)/protocol/bluetooth/bgstack/ll/utils/hci_packet/cpc/src/sl_hci_cpc_rtos.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/bluetooth/bgstack/ll/utils/hci_packet/cpc/src/sl_hci_cpc_rtos.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/bluetooth/bgstack/ll/utils/hci_packet/cpc/src/sl_hci_cpc_rtos.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/bgstack/ll/utils/hci_packet/cpc/src/sl_hci_cpc_rtos.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/bgstack/ll/utils/hci_packet/cpc/src/sl_hci_cpc_rtos.o

$(OUTPUT_DIR)/sdk/protocol/bluetooth/bgstack/ll/utils/hci_packet/cpc/src/sl_hci_packet.o: $(SDK_PATH)/protocol/bluetooth/bgstack/ll/utils/hci_packet/cpc/src/sl_hci_packet.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/bluetooth/bgstack/ll/utils/hci_packet/cpc/src/sl_hci_packet.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/bluetooth/bgstack/ll/utils/hci_packet/cpc/src/sl_hci_packet.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/bgstack/ll/utils/hci_packet/cpc/src/sl_hci_packet.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/bgstack/ll/utils/hci_packet/cpc/src/sl_hci_packet.o

$(OUTPUT_DIR)/sdk/protocol/bluetooth/bgstack/ll/utils/hci_packet/src/sl_btctrl_reset.o: $(SDK_PATH)/protocol/bluetooth/bgstack/ll/utils/hci_packet/src/sl_btctrl_reset.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/bluetooth/bgstack/ll/utils/hci_packet/src/sl_btctrl_reset.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/bluetooth/bgstack/ll/utils/hci_packet/src/sl_btctrl_reset.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/bgstack/ll/utils/hci_packet/src/sl_btctrl_reset.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/bgstack/ll/utils/hci_packet/src/sl_btctrl_reset.o

$(OUTPUT_DIR)/sdk/protocol/bluetooth/bgstack/ll/utils/rtos/src/sl_btctrl_rtos.o: $(SDK_PATH)/protocol/bluetooth/bgstack/ll/utils/rtos/src/sl_btctrl_rtos.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/bluetooth/bgstack/ll/utils/rtos/src/sl_btctrl_rtos.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/bluetooth/bgstack/ll/utils/rtos/src/sl_btctrl_rtos.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/bgstack/ll/utils/rtos/src/sl_btctrl_rtos.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/bgstack/ll/utils/rtos/src/sl_btctrl_rtos.o

$(OUTPUT_DIR)/sdk/protocol/bluetooth/bgstack/ll/utils/sleep/src/sl_hci_sleep.o: $(SDK_PATH)/protocol/bluetooth/bgstack/ll/utils/sleep/src/sl_hci_sleep.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/bluetooth/bgstack/ll/utils/sleep/src/sl_hci_sleep.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/bluetooth/bgstack/ll/utils/sleep/src/sl_hci_sleep.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/bgstack/ll/utils/sleep/src/sl_hci_sleep.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/bluetooth/bgstack/ll/utils/sleep/src/sl_hci_sleep.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/em260/command-handlers-binding-generated.o: $(SDK_PATH)/protocol/zigbee/app/em260/command-handlers-binding-generated.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/em260/command-handlers-binding-generated.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/em260/command-handlers-binding-generated.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/em260/command-handlers-binding-generated.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/em260/command-handlers-binding-generated.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/em260/command-handlers-green-power-generated.o: $(SDK_PATH)/protocol/zigbee/app/em260/command-handlers-green-power-generated.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/em260/command-handlers-green-power-generated.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/em260/command-handlers-green-power-generated.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/em260/command-handlers-green-power-generated.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/em260/command-handlers-green-power-generated.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/em260/command-handlers-messaging-generated.o: $(SDK_PATH)/protocol/zigbee/app/em260/command-handlers-messaging-generated.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/em260/command-handlers-messaging-generated.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/em260/command-handlers-messaging-generated.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/em260/command-handlers-messaging-generated.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/em260/command-handlers-messaging-generated.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/em260/command-handlers-networking-generated.o: $(SDK_PATH)/protocol/zigbee/app/em260/command-handlers-networking-generated.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/em260/command-handlers-networking-generated.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/em260/command-handlers-networking-generated.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/em260/command-handlers-networking-generated.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/em260/command-handlers-networking-generated.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/em260/command-handlers-security-generated.o: $(SDK_PATH)/protocol/zigbee/app/em260/command-handlers-security-generated.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/em260/command-handlers-security-generated.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/em260/command-handlers-security-generated.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/em260/command-handlers-security-generated.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/em260/command-handlers-security-generated.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/em260/command-handlers-trust-center-generated.o: $(SDK_PATH)/protocol/zigbee/app/em260/command-handlers-trust-center-generated.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/em260/command-handlers-trust-center-generated.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/em260/command-handlers-trust-center-generated.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/em260/command-handlers-trust-center-generated.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/em260/command-handlers-trust-center-generated.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/em260/command-handlers-zll-generated.o: $(SDK_PATH)/protocol/zigbee/app/em260/command-handlers-zll-generated.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/em260/command-handlers-zll-generated.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/em260/command-handlers-zll-generated.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/em260/command-handlers-zll-generated.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/em260/command-handlers-zll-generated.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/em260/em260-common.o: $(SDK_PATH)/protocol/zigbee/app/em260/em260-common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/em260/em260-common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/em260/em260-common.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/em260/em260-common.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/em260/em260-common.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/em260/ncp-stack-stub.o: $(SDK_PATH)/protocol/zigbee/app/em260/ncp-stack-stub.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/em260/ncp-stack-stub.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/em260/ncp-stack-stub.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/em260/ncp-stack-stub.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/em260/ncp-stack-stub.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/common/sl_zigbee_system_common.o: $(SDK_PATH)/protocol/zigbee/app/framework/common/sl_zigbee_system_common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/common/sl_zigbee_system_common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/common/sl_zigbee_system_common.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/common/sl_zigbee_system_common.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/common/sl_zigbee_system_common.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/common/zigbee_enhanced_routing.o: $(SDK_PATH)/protocol/zigbee/app/framework/common/zigbee_enhanced_routing.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/common/zigbee_enhanced_routing.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/common/zigbee_enhanced_routing.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/common/zigbee_enhanced_routing.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/common/zigbee_enhanced_routing.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/common/zigbee_ncp_framework_cb.o: $(SDK_PATH)/protocol/zigbee/app/framework/common/zigbee_ncp_framework_cb.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/common/zigbee_ncp_framework_cb.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/common/zigbee_ncp_framework_cb.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/common/zigbee_ncp_framework_cb.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/common/zigbee_ncp_framework_cb.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/common/zigbee_stack_rtos_adaptation.o: $(SDK_PATH)/protocol/zigbee/app/framework/common/zigbee_stack_rtos_adaptation.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/common/zigbee_stack_rtos_adaptation.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/common/zigbee_stack_rtos_adaptation.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/common/zigbee_stack_rtos_adaptation.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/common/zigbee_stack_rtos_adaptation.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/common/zigbee_stack_sleep.o: $(SDK_PATH)/protocol/zigbee/app/framework/common/zigbee_stack_sleep.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/common/zigbee_stack_sleep.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/common/zigbee_stack_sleep.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/common/zigbee_stack_sleep.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/common/zigbee_stack_sleep.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/debug-print/sl_zigbee_debug_print.o: $(SDK_PATH)/protocol/zigbee/app/framework/plugin/debug-print/sl_zigbee_debug_print.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/plugin/debug-print/sl_zigbee_debug_print.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/plugin/debug-print/sl_zigbee_debug_print.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/debug-print/sl_zigbee_debug_print.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/debug-print/sl_zigbee_debug_print.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/counters/counters.o: $(SDK_PATH)/protocol/zigbee/app/util/counters/counters.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/util/counters/counters.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/util/counters/counters.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/counters/counters.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/counters/counters.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/xncp/xncp-stubs.o: $(SDK_PATH)/protocol/zigbee/app/xncp/xncp-stubs.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/xncp/xncp-stubs.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/xncp/xncp-stubs.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/xncp/xncp-stubs.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/xncp/xncp-stubs.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/config/sl_zigbee_callback_stubs.o: $(SDK_PATH)/protocol/zigbee/stack/config/sl_zigbee_callback_stubs.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/config/sl_zigbee_callback_stubs.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/config/sl_zigbee_callback_stubs.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/config/sl_zigbee_callback_stubs.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/config/sl_zigbee_callback_stubs.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/config/sl_zigbee_configuration.o: $(SDK_PATH)/protocol/zigbee/stack/config/sl_zigbee_configuration.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/config/sl_zigbee_configuration.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/config/sl_zigbee_configuration.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/config/sl_zigbee_configuration.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/config/sl_zigbee_configuration.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/config/sl_zigbee_configuration_access.o: $(SDK_PATH)/protocol/zigbee/stack/config/sl_zigbee_configuration_access.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/config/sl_zigbee_configuration_access.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/config/sl_zigbee_configuration_access.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/config/sl_zigbee_configuration_access.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/config/sl_zigbee_configuration_access.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/config/sl_zigbee_endpoint_stubs.o: $(SDK_PATH)/protocol/zigbee/stack/config/sl_zigbee_endpoint_stubs.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/config/sl_zigbee_endpoint_stubs.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/config/sl_zigbee_endpoint_stubs.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/config/sl_zigbee_endpoint_stubs.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/config/sl_zigbee_endpoint_stubs.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/core/multi-pan-common.o: $(SDK_PATH)/protocol/zigbee/stack/core/multi-pan-common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/core/multi-pan-common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/core/multi-pan-common.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/core/multi-pan-common.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/core/multi-pan-common.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/core/multi-pan-stub.o: $(SDK_PATH)/protocol/zigbee/stack/core/multi-pan-stub.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/core/multi-pan-stub.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/core/multi-pan-stub.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/core/multi-pan-stub.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/core/multi-pan-stub.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/core/sl_zigbee_multi_network_stub.o: $(SDK_PATH)/protocol/zigbee/stack/core/sl_zigbee_multi_network_stub.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/core/sl_zigbee_multi_network_stub.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/core/sl_zigbee_multi_network_stub.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/core/sl_zigbee_multi_network_stub.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/core/sl_zigbee_multi_network_stub.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/framework/aes-ecb.o: $(SDK_PATH)/protocol/zigbee/stack/framework/aes-ecb.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/framework/aes-ecb.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/framework/aes-ecb.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/framework/aes-ecb.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/framework/aes-ecb.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/framework/debug-extended-stub.o: $(SDK_PATH)/protocol/zigbee/stack/framework/debug-extended-stub.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/framework/debug-extended-stub.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/framework/debug-extended-stub.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/framework/debug-extended-stub.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/framework/debug-extended-stub.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/framework/strong-random-api.o: $(SDK_PATH)/protocol/zigbee/stack/framework/strong-random-api.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/framework/strong-random-api.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/framework/strong-random-api.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/framework/strong-random-api.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/framework/strong-random-api.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/framework/zigbee-event-logger-stub-gen.o: $(SDK_PATH)/protocol/zigbee/stack/framework/zigbee-event-logger-stub-gen.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/framework/zigbee-event-logger-stub-gen.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/framework/zigbee-event-logger-stub-gen.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/framework/zigbee-event-logger-stub-gen.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/framework/zigbee-event-logger-stub-gen.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/aes-mmo-baremetal-wrapper.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/aes-mmo-baremetal-wrapper.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/aes-mmo-baremetal-wrapper.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/aes-mmo-baremetal-wrapper.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/aes-mmo-baremetal-wrapper.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/aes-mmo-baremetal-wrapper.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/binding-table-baremetal-callbacks.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/binding-table-baremetal-callbacks.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/binding-table-baremetal-callbacks.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/binding-table-baremetal-callbacks.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/binding-table-baremetal-callbacks.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/binding-table-baremetal-callbacks.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/binding-table-baremetal-wrapper.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/binding-table-baremetal-wrapper.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/binding-table-baremetal-wrapper.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/binding-table-baremetal-wrapper.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/binding-table-baremetal-wrapper.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/binding-table-baremetal-wrapper.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/bootload_baremetal_callbacks.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/bootload_baremetal_callbacks.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/bootload_baremetal_callbacks.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/bootload_baremetal_callbacks.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/bootload_baremetal_callbacks.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/bootload_baremetal_callbacks.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/bootload_baremetal_wrapper.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/bootload_baremetal_wrapper.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/bootload_baremetal_wrapper.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/bootload_baremetal_wrapper.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/bootload_baremetal_wrapper.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/bootload_baremetal_wrapper.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/child_baremetal_callbacks.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/child_baremetal_callbacks.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/child_baremetal_callbacks.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/child_baremetal_callbacks.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/child_baremetal_callbacks.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/child_baremetal_callbacks.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/child_baremetal_wrapper.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/child_baremetal_wrapper.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/child_baremetal_wrapper.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/child_baremetal_wrapper.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/child_baremetal_wrapper.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/child_baremetal_wrapper.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/gp-proxy-table-baremetal-wrapper.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/gp-proxy-table-baremetal-wrapper.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/gp-proxy-table-baremetal-wrapper.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/gp-proxy-table-baremetal-wrapper.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/gp-proxy-table-baremetal-wrapper.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/gp-proxy-table-baremetal-wrapper.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/gp-sink-table-baremetal-wrapper.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/gp-sink-table-baremetal-wrapper.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/gp-sink-table-baremetal-wrapper.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/gp-sink-table-baremetal-wrapper.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/gp-sink-table-baremetal-wrapper.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/gp-sink-table-baremetal-wrapper.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/gp-types-baremetal-wrapper.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/gp-types-baremetal-wrapper.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/gp-types-baremetal-wrapper.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/gp-types-baremetal-wrapper.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/gp-types-baremetal-wrapper.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/gp-types-baremetal-wrapper.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/library_baremetal_wrapper.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/library_baremetal_wrapper.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/library_baremetal_wrapper.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/library_baremetal_wrapper.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/library_baremetal_wrapper.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/library_baremetal_wrapper.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/mac-layer-baremetal-wrapper.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/mac-layer-baremetal-wrapper.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/mac-layer-baremetal-wrapper.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/mac-layer-baremetal-wrapper.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/mac-layer-baremetal-wrapper.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/mac-layer-baremetal-wrapper.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/message_baremetal_callbacks.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/message_baremetal_callbacks.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/message_baremetal_callbacks.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/message_baremetal_callbacks.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/message_baremetal_callbacks.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/message_baremetal_callbacks.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/message_baremetal_wrapper.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/message_baremetal_wrapper.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/message_baremetal_wrapper.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/message_baremetal_wrapper.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/message_baremetal_wrapper.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/message_baremetal_wrapper.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/multi-phy-baremetal-wrapper.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/multi-phy-baremetal-wrapper.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/multi-phy-baremetal-wrapper.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/multi-phy-baremetal-wrapper.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/multi-phy-baremetal-wrapper.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/multi-phy-baremetal-wrapper.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/network-formation-baremetal-callbacks.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/network-formation-baremetal-callbacks.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/network-formation-baremetal-callbacks.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/network-formation-baremetal-callbacks.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/network-formation-baremetal-callbacks.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/network-formation-baremetal-callbacks.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/network-formation-baremetal-wrapper.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/network-formation-baremetal-wrapper.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/network-formation-baremetal-wrapper.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/network-formation-baremetal-wrapper.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/network-formation-baremetal-wrapper.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/network-formation-baremetal-wrapper.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/raw-message-baremetal-callbacks.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/raw-message-baremetal-callbacks.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/raw-message-baremetal-callbacks.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/raw-message-baremetal-callbacks.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/raw-message-baremetal-callbacks.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/raw-message-baremetal-callbacks.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/raw-message-baremetal-wrapper.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/raw-message-baremetal-wrapper.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/raw-message-baremetal-wrapper.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/raw-message-baremetal-wrapper.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/raw-message-baremetal-wrapper.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/raw-message-baremetal-wrapper.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/security_baremetal_callbacks.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/security_baremetal_callbacks.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/security_baremetal_callbacks.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/security_baremetal_callbacks.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/security_baremetal_callbacks.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/security_baremetal_callbacks.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/security_baremetal_wrapper.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/security_baremetal_wrapper.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/security_baremetal_wrapper.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/security_baremetal_wrapper.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/security_baremetal_wrapper.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/security_baremetal_wrapper.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_address_info_baremetal_wrapper.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_address_info_baremetal_wrapper.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_address_info_baremetal_wrapper.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_address_info_baremetal_wrapper.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_address_info_baremetal_wrapper.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_address_info_baremetal_wrapper.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_duty_cycle_baremetal_callbacks.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_duty_cycle_baremetal_callbacks.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_duty_cycle_baremetal_callbacks.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_duty_cycle_baremetal_callbacks.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_duty_cycle_baremetal_callbacks.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_duty_cycle_baremetal_callbacks.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_duty_cycle_baremetal_wrapper.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_duty_cycle_baremetal_wrapper.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_duty_cycle_baremetal_wrapper.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_duty_cycle_baremetal_wrapper.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_duty_cycle_baremetal_wrapper.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_duty_cycle_baremetal_wrapper.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_memory_usage_baremetal_wrapper.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_memory_usage_baremetal_wrapper.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_memory_usage_baremetal_wrapper.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_memory_usage_baremetal_wrapper.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_memory_usage_baremetal_wrapper.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_memory_usage_baremetal_wrapper.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_random_api_baremetal_wrapper.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_random_api_baremetal_wrapper.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_random_api_baremetal_wrapper.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_random_api_baremetal_wrapper.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_random_api_baremetal_wrapper.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_random_api_baremetal_wrapper.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_token_baremetal_wrapper.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_token_baremetal_wrapper.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_token_baremetal_wrapper.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_token_baremetal_wrapper.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_token_baremetal_wrapper.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/sl_zigbee_token_baremetal_wrapper.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/source-route-baremetal-wrapper.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/source-route-baremetal-wrapper.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/source-route-baremetal-wrapper.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/source-route-baremetal-wrapper.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/source-route-baremetal-wrapper.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/source-route-baremetal-wrapper.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/stack-info-baremetal-callbacks.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/stack-info-baremetal-callbacks.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/stack-info-baremetal-callbacks.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/stack-info-baremetal-callbacks.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/stack-info-baremetal-callbacks.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/stack-info-baremetal-callbacks.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/stack-info-baremetal-wrapper.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/stack-info-baremetal-wrapper.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/stack-info-baremetal-wrapper.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/stack-info-baremetal-wrapper.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/stack-info-baremetal-wrapper.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/stack-info-baremetal-wrapper.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/trust-center-baremetal-callbacks.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/trust-center-baremetal-callbacks.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/trust-center-baremetal-callbacks.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/trust-center-baremetal-callbacks.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/trust-center-baremetal-callbacks.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/trust-center-baremetal-callbacks.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/trust-center-baremetal-wrapper.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/trust-center-baremetal-wrapper.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/trust-center-baremetal-wrapper.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/trust-center-baremetal-wrapper.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/trust-center-baremetal-wrapper.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/trust-center-baremetal-wrapper.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/zigbee-device-stack-baremetal-wrapper.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/zigbee-device-stack-baremetal-wrapper.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/zigbee-device-stack-baremetal-wrapper.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/zigbee-device-stack-baremetal-wrapper.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/zigbee-device-stack-baremetal-wrapper.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/zigbee-device-stack-baremetal-wrapper.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/zigbee-security-manager-baremetal-wrapper.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/zigbee-security-manager-baremetal-wrapper.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/zigbee-security-manager-baremetal-wrapper.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/zigbee-security-manager-baremetal-wrapper.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/zigbee-security-manager-baremetal-wrapper.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/zigbee-security-manager-baremetal-wrapper.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/zll-api-baremetal-callbacks.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/zll-api-baremetal-callbacks.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/zll-api-baremetal-callbacks.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/zll-api-baremetal-callbacks.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/zll-api-baremetal-callbacks.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/zll-api-baremetal-callbacks.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/zll-api-baremetal-wrapper.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/zll-api-baremetal-wrapper.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/zll-api-baremetal-wrapper.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/baremetal/zll-api-baremetal-wrapper.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/zll-api-baremetal-wrapper.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/baremetal/zll-api-baremetal-wrapper.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/stubs/sl_zigbee_memory_usage_internal_weak_stubs.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/stubs/sl_zigbee_memory_usage_internal_weak_stubs.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/stubs/sl_zigbee_memory_usage_internal_weak_stubs.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/stubs/sl_zigbee_memory_usage_internal_weak_stubs.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/stubs/sl_zigbee_memory_usage_internal_weak_stubs.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/stubs/sl_zigbee_memory_usage_internal_weak_stubs.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/stubs/sl_zigbee_token_internal_weak_stubs.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/stubs/sl_zigbee_token_internal_weak_stubs.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/stubs/sl_zigbee_token_internal_weak_stubs.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/stubs/sl_zigbee_token_internal_weak_stubs.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/stubs/sl_zigbee_token_internal_weak_stubs.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/stubs/sl_zigbee_token_internal_weak_stubs.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/stubs/stack-info-internal-weak-stubs.o: $(SDK_PATH)/protocol/zigbee/stack/internal/src/stubs/stack-info-internal-weak-stubs.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/internal/src/stubs/stack-info-internal-weak-stubs.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/internal/src/stubs/stack-info-internal-weak-stubs.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/stubs/stack-info-internal-weak-stubs.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/internal/src/stubs/stack-info-internal-weak-stubs.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/platform/sl_zigbee_token_legacy.o: $(SDK_PATH)/protocol/zigbee/stack/platform/sl_zigbee_token_legacy.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/platform/sl_zigbee_token_legacy.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/platform/sl_zigbee_token_legacy.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/platform/sl_zigbee_token_legacy.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/platform/sl_zigbee_token_legacy.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/platform/zigbee_token_interface_stub.o: $(SDK_PATH)/protocol/zigbee/stack/platform/zigbee_token_interface_stub.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/platform/zigbee_token_interface_stub.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/platform/zigbee_token_interface_stub.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/platform/zigbee_token_interface_stub.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/platform/zigbee_token_interface_stub.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-163k1-stub.o: $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-163k1-stub.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-163k1-stub.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-163k1-stub.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-163k1-stub.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-163k1-stub.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-283k1-stub.o: $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-283k1-stub.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-283k1-stub.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-283k1-stub.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-283k1-stub.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-283k1-stub.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-sign-stub.o: $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-sign-stub.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-sign-stub.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-sign-stub.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-sign-stub.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-sign-stub.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-verify-283k1-stub.o: $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-verify-283k1-stub.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-verify-283k1-stub.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-verify-283k1-stub.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-verify-283k1-stub.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-verify-283k1-stub.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-verify-stub.o: $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-verify-stub.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-verify-stub.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-verify-stub.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-verify-stub.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-verify-stub.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-stub.o: $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-stub.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-stub.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-stub.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-stub.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-stub.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/security-address-cache.o: $(SDK_PATH)/protocol/zigbee/stack/security/security-address-cache.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/security/security-address-cache.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/security/security-address-cache.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/security-address-cache.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/security-address-cache.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/zigbee-security-manager-no-vault.o: $(SDK_PATH)/protocol/zigbee/stack/security/zigbee-security-manager-no-vault.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/security/zigbee-security-manager-no-vault.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/security/zigbee-security-manager-no-vault.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/zigbee-security-manager-no-vault.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/zigbee-security-manager-no-vault.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/zigbee-security-manager.o: $(SDK_PATH)/protocol/zigbee/stack/security/zigbee-security-manager.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/security/zigbee-security-manager.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/security/zigbee-security-manager.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/zigbee-security-manager.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/zigbee-security-manager.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/stubs/sl_zigbee_dynamic_commissioning_stubs.o: $(SDK_PATH)/protocol/zigbee/stack/stubs/sl_zigbee_dynamic_commissioning_stubs.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/stubs/sl_zigbee_dynamic_commissioning_stubs.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/stubs/sl_zigbee_dynamic_commissioning_stubs.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/stubs/sl_zigbee_dynamic_commissioning_stubs.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/stubs/sl_zigbee_dynamic_commissioning_stubs.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/stubs/sl_zigbee_fragmentation_stubs.o: $(SDK_PATH)/protocol/zigbee/stack/stubs/sl_zigbee_fragmentation_stubs.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/stubs/sl_zigbee_fragmentation_stubs.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/stubs/sl_zigbee_fragmentation_stubs.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/stubs/sl_zigbee_fragmentation_stubs.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/stubs/sl_zigbee_fragmentation_stubs.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/stubs/sl_zigbee_r23_misc_support_stubs.o: $(SDK_PATH)/protocol/zigbee/stack/stubs/sl_zigbee_r23_misc_support_stubs.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/stubs/sl_zigbee_r23_misc_support_stubs.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/stubs/sl_zigbee_r23_misc_support_stubs.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/stubs/sl_zigbee_r23_misc_support_stubs.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/stubs/sl_zigbee_r23_misc_support_stubs.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/zigbee/aps-keys-full.o: $(SDK_PATH)/protocol/zigbee/stack/zigbee/aps-keys-full.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/zigbee/aps-keys-full.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/zigbee/aps-keys-full.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/zigbee/aps-keys-full.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/zigbee/aps-keys-full.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/zigbee/sli_zigbee_zdo_cluster_filter.o: $(SDK_PATH)/protocol/zigbee/stack/zigbee/sli_zigbee_zdo_cluster_filter.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/zigbee/sli_zigbee_zdo_cluster_filter.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/zigbee/sli_zigbee_zdo_cluster_filter.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/zigbee/sli_zigbee_zdo_cluster_filter.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/zigbee/sli_zigbee_zdo_cluster_filter.o

$(OUTPUT_DIR)/sdk/util/plugin/byte_utilities/byte-utilities.o: $(SDK_PATH)/util/plugin/byte_utilities/byte-utilities.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/plugin/byte_utilities/byte-utilities.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/plugin/byte_utilities/byte-utilities.c
CDEPS += $(OUTPUT_DIR)/sdk/util/plugin/byte_utilities/byte-utilities.d
OBJS += $(OUTPUT_DIR)/sdk/util/plugin/byte_utilities/byte-utilities.o

$(OUTPUT_DIR)/sdk/util/third_party/freertos/cmsis/Source/cmsis_os2.o: $(SDK_PATH)/util/third_party/freertos/cmsis/Source/cmsis_os2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/freertos/cmsis/Source/cmsis_os2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/freertos/cmsis/Source/cmsis_os2.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/cmsis/Source/cmsis_os2.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/cmsis/Source/cmsis_os2.o

$(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/croutine.o: $(SDK_PATH)/util/third_party/freertos/kernel/croutine.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/freertos/kernel/croutine.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/freertos/kernel/croutine.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/croutine.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/croutine.o

$(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/event_groups.o: $(SDK_PATH)/util/third_party/freertos/kernel/event_groups.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/freertos/kernel/event_groups.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/freertos/kernel/event_groups.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/event_groups.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/event_groups.o

$(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/list.o: $(SDK_PATH)/util/third_party/freertos/kernel/list.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/freertos/kernel/list.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/freertos/kernel/list.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/list.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/list.o

$(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/portable/GCC/ARM_CM33_NTZ/non_secure/mpu_wrappers_v2_asm.o: $(SDK_PATH)/util/third_party/freertos/kernel/portable/GCC/ARM_CM33_NTZ/non_secure/mpu_wrappers_v2_asm.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/freertos/kernel/portable/GCC/ARM_CM33_NTZ/non_secure/mpu_wrappers_v2_asm.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/freertos/kernel/portable/GCC/ARM_CM33_NTZ/non_secure/mpu_wrappers_v2_asm.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/portable/GCC/ARM_CM33_NTZ/non_secure/mpu_wrappers_v2_asm.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/portable/GCC/ARM_CM33_NTZ/non_secure/mpu_wrappers_v2_asm.o

$(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/portable/GCC/ARM_CM33_NTZ/non_secure/port.o: $(SDK_PATH)/util/third_party/freertos/kernel/portable/GCC/ARM_CM33_NTZ/non_secure/port.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/freertos/kernel/portable/GCC/ARM_CM33_NTZ/non_secure/port.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/freertos/kernel/portable/GCC/ARM_CM33_NTZ/non_secure/port.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/portable/GCC/ARM_CM33_NTZ/non_secure/port.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/portable/GCC/ARM_CM33_NTZ/non_secure/port.o

$(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/portable/GCC/ARM_CM33_NTZ/non_secure/portasm.o: $(SDK_PATH)/util/third_party/freertos/kernel/portable/GCC/ARM_CM33_NTZ/non_secure/portasm.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/freertos/kernel/portable/GCC/ARM_CM33_NTZ/non_secure/portasm.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/freertos/kernel/portable/GCC/ARM_CM33_NTZ/non_secure/portasm.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/portable/GCC/ARM_CM33_NTZ/non_secure/portasm.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/portable/GCC/ARM_CM33_NTZ/non_secure/portasm.o

$(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/portable/MemMang/heap_3.o: $(SDK_PATH)/util/third_party/freertos/kernel/portable/MemMang/heap_3.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/freertos/kernel/portable/MemMang/heap_3.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/freertos/kernel/portable/MemMang/heap_3.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/portable/MemMang/heap_3.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/portable/MemMang/heap_3.o

$(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/portable/SiliconLabs/cortexm/tick_power_manager.o: $(SDK_PATH)/util/third_party/freertos/kernel/portable/SiliconLabs/cortexm/tick_power_manager.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/freertos/kernel/portable/SiliconLabs/cortexm/tick_power_manager.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/freertos/kernel/portable/SiliconLabs/cortexm/tick_power_manager.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/portable/SiliconLabs/cortexm/tick_power_manager.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/portable/SiliconLabs/cortexm/tick_power_manager.o

$(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/queue.o: $(SDK_PATH)/util/third_party/freertos/kernel/queue.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/freertos/kernel/queue.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/freertos/kernel/queue.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/queue.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/queue.o

$(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/stream_buffer.o: $(SDK_PATH)/util/third_party/freertos/kernel/stream_buffer.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/freertos/kernel/stream_buffer.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/freertos/kernel/stream_buffer.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/stream_buffer.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/stream_buffer.o

$(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/tasks.o: $(SDK_PATH)/util/third_party/freertos/kernel/tasks.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/freertos/kernel/tasks.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/freertos/kernel/tasks.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/tasks.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/tasks.o

$(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/timers.o: $(SDK_PATH)/util/third_party/freertos/kernel/timers.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/freertos/kernel/timers.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/freertos/kernel/timers.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/timers.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/freertos/kernel/timers.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/bignum.o: $(SDK_PATH)/util/third_party/mbedtls/library/bignum.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/bignum.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/bignum.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/bignum.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/bignum.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/bignum_core.o: $(SDK_PATH)/util/third_party/mbedtls/library/bignum_core.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/bignum_core.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/bignum_core.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/bignum_core.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/bignum_core.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/bignum_mod.o: $(SDK_PATH)/util/third_party/mbedtls/library/bignum_mod.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/bignum_mod.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/bignum_mod.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/bignum_mod.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/bignum_mod.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/bignum_mod_raw.o: $(SDK_PATH)/util/third_party/mbedtls/library/bignum_mod_raw.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/bignum_mod_raw.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/bignum_mod_raw.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/bignum_mod_raw.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/bignum_mod_raw.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/cipher.o: $(SDK_PATH)/util/third_party/mbedtls/library/cipher.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/cipher.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/cipher.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/cipher.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/cipher.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/cipher_wrap.o: $(SDK_PATH)/util/third_party/mbedtls/library/cipher_wrap.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/cipher_wrap.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/cipher_wrap.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/cipher_wrap.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/cipher_wrap.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/constant_time.o: $(SDK_PATH)/util/third_party/mbedtls/library/constant_time.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/constant_time.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/constant_time.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/constant_time.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/constant_time.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/platform.o: $(SDK_PATH)/util/third_party/mbedtls/library/platform.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/platform.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/platform.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/platform.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/platform.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/platform_util.o: $(SDK_PATH)/util/third_party/mbedtls/library/platform_util.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/platform_util.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/platform_util.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/platform_util.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/platform_util.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto.o: $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_aead.o: $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_aead.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_aead.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_aead.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_aead.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_aead.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_cipher.o: $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_cipher.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_cipher.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_cipher.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_cipher.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_cipher.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_client.o: $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_client.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_client.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_client.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_client.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_client.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_driver_wrappers_no_static.o: $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_driver_wrappers_no_static.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_driver_wrappers_no_static.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_driver_wrappers_no_static.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_driver_wrappers_no_static.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_driver_wrappers_no_static.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_ecp.o: $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_ecp.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_ecp.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_ecp.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_ecp.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_ecp.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_ffdh.o: $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_ffdh.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_ffdh.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_ffdh.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_ffdh.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_ffdh.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_hash.o: $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_hash.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_hash.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_hash.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_hash.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_hash.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_mac.o: $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_mac.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_mac.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_mac.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_mac.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_mac.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_pake.o: $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_pake.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_pake.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_pake.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_pake.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_pake.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_rsa.o: $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_rsa.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_rsa.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_rsa.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_rsa.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_rsa.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_se.o: $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_se.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_se.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_se.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_se.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_se.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_slot_management.o: $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_slot_management.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_slot_management.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_slot_management.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_slot_management.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_slot_management.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_storage.o: $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_storage.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_storage.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_storage.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_storage.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_storage.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_util.o: $(SDK_PATH)/util/third_party/mbedtls/library/psa_util.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/psa_util.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/psa_util.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_util.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_util.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/threading.o: $(SDK_PATH)/util/third_party/mbedtls/library/threading.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/threading.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/threading.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/threading.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/threading.o

$(OUTPUT_DIR)/sdk/util/third_party/printf/printf.o: $(SDK_PATH)/util/third_party/printf/printf.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/printf/printf.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/printf/printf.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/printf/printf.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/printf/printf.o

$(OUTPUT_DIR)/sdk/util/third_party/printf/src/iostream_printf.o: $(SDK_PATH)/util/third_party/printf/src/iostream_printf.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/printf/src/iostream_printf.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/printf/src/iostream_printf.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/printf/src/iostream_printf.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/printf/src/iostream_printf.o

$(OUTPUT_DIR)/project/app.o: app.c
	@$(POSIX_TOOL_PATH)echo 'Building app.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ app.c
CDEPS += $(OUTPUT_DIR)/project/app.d
OBJS += $(OUTPUT_DIR)/project/app.o

$(OUTPUT_DIR)/project/autogen/coexistence_event.o: autogen/coexistence_event.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/coexistence_event.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/coexistence_event.c
CDEPS += $(OUTPUT_DIR)/project/autogen/coexistence_event.d
OBJS += $(OUTPUT_DIR)/project/autogen/coexistence_event.o

$(OUTPUT_DIR)/project/autogen/sl_cpc_instance_handles.o: autogen/sl_cpc_instance_handles.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_cpc_instance_handles.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_cpc_instance_handles.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_cpc_instance_handles.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_cpc_instance_handles.o

$(OUTPUT_DIR)/project/autogen/sl_event_handler.o: autogen/sl_event_handler.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_event_handler.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_event_handler.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_event_handler.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_event_handler.o

$(OUTPUT_DIR)/project/autogen/sl_iostream_handles.o: autogen/sl_iostream_handles.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_iostream_handles.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_iostream_handles.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_iostream_handles.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_iostream_handles.o

$(OUTPUT_DIR)/project/autogen/sl_rail_util_ieee802154_phy_select.o: autogen/sl_rail_util_ieee802154_phy_select.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_rail_util_ieee802154_phy_select.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_rail_util_ieee802154_phy_select.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_rail_util_ieee802154_phy_select.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_rail_util_ieee802154_phy_select.o

$(OUTPUT_DIR)/project/autogen/sl_rail_util_ieee802154_stack_event.o: autogen/sl_rail_util_ieee802154_stack_event.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_rail_util_ieee802154_stack_event.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_rail_util_ieee802154_stack_event.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_rail_util_ieee802154_stack_event.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_rail_util_ieee802154_stack_event.o

$(OUTPUT_DIR)/project/autogen/zigbee_common_callback_dispatcher.o: autogen/zigbee_common_callback_dispatcher.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/zigbee_common_callback_dispatcher.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/zigbee_common_callback_dispatcher.c
CDEPS += $(OUTPUT_DIR)/project/autogen/zigbee_common_callback_dispatcher.d
OBJS += $(OUTPUT_DIR)/project/autogen/zigbee_common_callback_dispatcher.o

$(OUTPUT_DIR)/project/autogen/zigbee_ncp_callback_dispatcher.o: autogen/zigbee_ncp_callback_dispatcher.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/zigbee_ncp_callback_dispatcher.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/zigbee_ncp_callback_dispatcher.c
CDEPS += $(OUTPUT_DIR)/project/autogen/zigbee_ncp_callback_dispatcher.d
OBJS += $(OUTPUT_DIR)/project/autogen/zigbee_ncp_callback_dispatcher.o

$(OUTPUT_DIR)/project/autogen/zigbee_stack_callback_dispatcher.o: autogen/zigbee_stack_callback_dispatcher.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/zigbee_stack_callback_dispatcher.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/zigbee_stack_callback_dispatcher.c
CDEPS += $(OUTPUT_DIR)/project/autogen/zigbee_stack_callback_dispatcher.d
OBJS += $(OUTPUT_DIR)/project/autogen/zigbee_stack_callback_dispatcher.o

$(OUTPUT_DIR)/project/main.o: main.c
	@$(POSIX_TOOL_PATH)echo 'Building main.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ main.c
CDEPS += $(OUTPUT_DIR)/project/main.d
OBJS += $(OUTPUT_DIR)/project/main.o

# Automatically-generated Simplicity Studio Metadata
# Please do not edit or delete these lines!
# SIMPLICITY_STUDIO_METADATA=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END_SIMPLICITY_STUDIO_METADATA
# END OF METADATA