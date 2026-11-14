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
# SIMPLICITY_STUDIO_METADATA=eJzsvWuP5DaWLfpXjPp40FFRlVn2uA33DOa63TM+6DrdcLkvcM7UQFAoGBFy6tV6ZGV6MP/9khQlURIfm+RmVvXBBRruykzttRY336/N/3r115//8j9//OGX5Oe//OWXV9+9+q+Pr37+8c//+stP/++Pifynj6+++/jq46v/fvW72eLDX/728w8/fqBG3//LU1l89UjaLq+rP3x89fb1m4+vviJVVp/z6kp/8bdf/nT49uOrf/nnj9X3TVv/SrL+K2pSdd+V9ZkU9Itb3zffHY+fPn163eVFeupeZ3V57Lrjh3445/VrktUtoaDUuiFt//who/9P7QTax1cU+quvvr/UxZm0X1Vpyf6Y1dUlv4q/7f7atHnNvpj/zr7ICyL/vc3752SEeb18/9XQ5vQD9vF3x3roj+MXx+mLo970OGk5jmJmaRJxVyRlmldJ16dtn/Rp9zDh3PTcRqOjhiZrsuTcPiYDsxk69t9H6ncYnd1YR/tbfj0RkpzJabgm1DdVD2M02lnIaEFhvsmAvjRYWYi6emgzkrQUjzhxaQwtdNeWkCpp6k+kdWJT29nSRrKBl+sirx6SB/LcuaXQZG6hLvLrrR8NXSiVZkqqSWNBSAOg0HxuSUXb151DjTZY6YhOfda3BQx+960FtMtu5DwUtMRsGzgQj9FcS10MpK/r/pakZ9rD9HkHLegWSyXhn2it+PmXv3z4wUqw/9LUyIIbVFib/UDaigAzWfm9DrxN8yIZevqfps9h+DoTO0VWkydXjo0NmKQs68qTa2OqpDz1RUK7I9JeUtqEZxcjifJjGGzS3WXvnLBnC215KmravZVplV5p/ai7LC+KtK+BlQxgDSPuaX3yodzYKcmqx/Kejhou6VBARhqaz5XQTZcmWfvc9DUAWPmxEvZcpmxoZYfcfajzdl8/0P5+8hrI0ToTbYYOXU/Hf6PZjaR0eGvLSrWFhYAqGmjx7iludfWgM9vbOyIKWNE5Rw5tUSyWOsJxmNt9gpQszeeW/pyPK1x68I2BaRx1Jo95BqnRuu8BXVTq3EOlkGJMZ5rAlmj9pQ6QjxH7vITWO+X3OvDyRM59AczG/cc2WHA2mmx0JOSR0Clc99z1BDjn1FjoCMbpjVOjpzPR11Ke2LzK++ScnYFDPYOVNkdIWbfPbonR2uhICnJNs+fklhbJp3N9hbHojXQ0t8tT7ZYSjYWSgLbywMq2/9Le6nTk7wOpMqhws6GO7ts3d2+/fkeNz3ntONmymQLLV0uu4A7OZqqkTJsmEat5OYG0X1oDJbxUKO3Qyo8BHdCqreCV2bVDMiGMAlYrhZslzHTo6yupdCucr7siY8tXPdGtcb7O2rntof9UqBYUxwXruDMCLmrSDCzyLOXDn/65IUovTXya75WZ8vMvPyY/1GVTV7R36Iyw+0/1wwDxVUIlpEWtzlRJrtLANIvPK+pP2iDQcledC2IWbrBx4jDlscEGtIJsKPwbCoWJeZAwSlEP8CXs3ccwVItTdh/rUPO6o/PRtITmqOp7MLZFtOp7KzZvgab8h8vfm2mY8s0QNBFoFiaTGZSpb9Oqu9Rt6cupBNCy87m+WxrVJkaG05AXfV75MOlNlYxsMSynw27WLvD6YCx/yq/tHWpOCBHjl+b2TEdMBZ0t2wo6wNyJedzvsacRaK8eneTVA2nZb14XZwPH5jvThLvKGtrxFMWJsZ/zrkn77GZpMe2mPowmp9lNTYzpZbVcY26gDDbGDaBxu8/Pk0ZjP1aAN43GJtZpcdsvsWZrT15Acs3WSl7Wsi1zBwPF9kP7GLzLSzZMZZOs7vyQ3L25+/r1N6/vtacOirRnnchqRL764o98bUD6++6LDzklrKs/p6du9dnuwx//9PP93ft/u3u3+WyPyPeed19tW8xx3YVc2vu78nr3bpdZ1AHHKYHHMR1HSexx1nMcCY8qxKNFBDvgMDSoKlSQWxmbyY3GkT9VWTGcrZ6cmdI3d28ub9/cvcvLd292lQ6eEsF71ANb3DobJmlWNphKZkC4AsXQM0jAekxq5T8NbVqiKpgRXTT0GbaGERGsISsHVAUCD8zPVkZRBUyAcAUUv7rUuCIWTLiOMqV2XdbmTV/vO+cgOTtouKqmKHC1CECwAoJcQoljCSX83BuuhBkSrOLStRluGZ0RwRquTdbiVtYZ0UFDjuuGCdBJQdLUyEVihQrWcrtgl4oZ0UHDE7aEJzcF+R1uqRR4cP4UuQ+bAOEKspTOjXA1zJBgFey0Z5bul6ZCZEiYYB0F7e9QRUyATgqeTiluLy6DOithh53yCnnQrQKHKyN8YxZX0IIJ14HehhbObWiB3YYWrm1omebFqX5CFSFhwnU06e2EPTWTQeFKOtxGXeCB+Zuswh1iTIBwBYrV1yABrVsLQb9PuvxapQW6DhkXrIdOoNgaZJOeUeWsYeFqSIw6u0KFa0Geo3WOc7SODhIUB7KDJMyQLiqwF3QWSLAK/F7VvU8d8DvVwb1XxZ+4u8/bH88pbomYAMEK2Hk9VAUToE1BKY5AYpDLWLbNg+1+Qzi9ChK0d6D45e5X+19sb7iyrTDTXlFeZbs9ovUmeNrXZW4phyPPkYIdVxZHI/Ipt9SwNaz43IyZlV3eJXV3J7YBXQhUtka2XDIhT+JaLTveSLPc0oyumK04ljTXZ5JkRdp1+UUciHNKttrclvIgUq29OaWkOudpRWeLlkHdOoFrKxvDYJk/bLEHxdTAdJLdCX1jZ2ahviS2TmtTU2cLWwlzrkuwGsRPReaqk3tm7NnGht5aupAtcqvoJvYXNmjFdIGdDSy4fdoPTiV7sTiauon9oYTW1urv2kLjLrpQRWGV7ehuu9ypHYUzW3EcaqlDerd2oFrqgL9Y2Es7+09Pnpz0b+0spZQtqhbF/oCpgUG2gdQtF+jJwFgDbAOlU133Rc0OgJkGS+srBqYatP7SnJ6Fe3OH4bhHcavmaZObRK4uAztozI87S0Omrq8cd33dptcANhnBwCpfDpBcaGxbN7R6CEtqSdvWLRvfONHtLKE+dWZZWYJzrknbztZPGzNuAXAuLf6kEoKFtSUdYafUbcc5FHRrU7c6OgYuMp3Su9BB8k1xQk/ltSotEv49uIIx/iM3OapRdpNVCzHUeWbifX4p58hbLeywtZsC2SqoC6Fl23YwcxWawJzp+xGaor9fRTpglyzMuS4UHld28yBACWbMfD7g2pmxa3LmLDDpMCFaxGgsk+4O1S0SppMgLBEe2YKaI16ZgZwPuizQNBKWFS9QzfLw3zSpVIK5lR0kdgBxjsWsALJmlr27XAUdCW9C1zFMaH8OK6Irs6mIKrGs3l5bTb2gvwwToq3MrS1Z7qG5YwLz9QeoGDr5A1IV1qbnZ/qnPMPLGwnQUcoqRg2eoB2se/M63pW3XShR1U1LefRJ5ShGWSIhV0kmkzO5YLELKChzcD5rPGDKZaCa5Eoq0vpVB6sqGdzvpo2qm7e2/xdzuCh4ykTna4V38Dy8NwYrclHA+jMkdgHlV+oQdSiB/WpmDEX+PqKELATKXRxHyehhLUcUeRK47z6715xhP/zzSJ663VCXTLMA0JldBxGGY7qAYSSWignMTUJwXVVqsVRWr+lN1uw35tzXhRpgp0w/nOfXDWQYyoOz3M6FF/5sCCFhd3t8OIQdhGIKSOLFIxtDyMYYWF5UiymEyHBXHkKmviyvIcy5CWRDc8+2tYWkTZyl6khWV+fU050qEB9ydqQLRcAEBMpdERjJL28l40jrZg2wU2fKpgWqRt1XK1L/iaQPbCuur1m8L2DftqZSYUBKuStXDkzXqhr4cGjP8GiovDy3MQURzVE47UeHdIQ7CBAxLeZ+dMIQRML7Mi+WyRJEY700q2PR3I1VO4yFBvZ02WQKIpo7TS8u2RpEJzpOL7LFFlarWutGvLZWtcqdeE0nNHcaDpsS6wZwD+FSnZduM6RGr1BA9Mu2rR/x2h6Wp/bLENo8Vd968JoSiFjAaFseU/hl+PL+WsE0otji2Iqv+J7fmQ+nnWCArA1p84YOaqE7K0buNVickdTKu6AyuJEsavwWxyWXwml1ARI0rNbL+CBSzRV8e8kIp16DOStwGZwBdegGbZByygvN9pijuaiO91yerrawW5pUjIzbcrsGdU/HiAVOiOQ8ds4gLEWCW503O3i87oL17Wh9xRKHHnqGQzLcNJ5brKjN50zmVKe46k2bIgMh5JIcrz48m2Q0WP7IFlMGbVFszdcq5r7LAR8bOfyEVb62czstoJBhwItTTlc+d1ctCukWxclr3rR7GISKwV3eDk0Pqx1qH68Pwa+CaSpdMt4aqWhCk8e87QdoCdqJ5Z5J2R0FJSJ4J3tdSHY0Iep0eO7lG9Ay5XjapwoKEA/wIOyajE2NGRejNogI6uFdxIQETLD4ek6nZG319RT1fVwbCuJbMMCs7IWrvC+TbwOZVzhxGv/Zq7AqMSmdarFkbW3wg6hyF65t3gWlzWF9UZFxYWldA3mUv7CUG9i9mpLlDZvAxgS8M7sw8soF2Zk9pR05tIRCZaRUBdiHEKlAjKznPL1W1O/Qs2wbvrW5kYmUJ9Iemhtw53JDtLI28vC3KbvX20jmEJLF1MjQptW5BvYmG4bF1MgwHrYYbb14tgBYjfj21k++q1K7tIxfwVoEKRW8TeCmxwXB7zikGJfc25RKhdlH7URzXOP4ad63VTu54JstG53s/3UXWQCD8rQD9qQbWmFnbgPnnYoDIU1b+zEpUcy8Q99DN2q3ZLOpkQG8mbktVIC9THIp7++SMs9a4Lr1hmNjb2nF756eDvzS5+FMLsAF2y2hAsTCWuQn3RtaMMY1gJEtoGJZsedZU3fgbvciUoEYWQtiCb2nIRJ2Rmxebg4uRx02JFsAAJvDXoGSDHaaw79GwerShHJwOXK/YVJgQMYuPlSLqZlhqtZ+JLK1eeIROq6wMvBB1GF11PUwHgA/+NVbG6CrGiwRkEme9A4oa36u7Rgc4lbXD341EYCJOvXj8ffCF5M2gK6jc240LbgosOKstmyJHPNrFL3PNHVEQ698Wr+TG55NazxYLq1tpkzaI9mqyubNX3HTkUfKaB/HaG9oenTo1jWj3fvX9khXRl0GREd/taRP2ysBLoCAnCRDOnoGVldALoE0sxvhTV0X4XljQfXQhCzGq5RccSvSAhinDUYoVqIFDi5VIqloEiRA13aH1kxS9eJN9L6tgQM6pSoYuHvuNm3NpGx7JVC/pPfAhJp0/XCyhEnTJHuC2LY3e+iI94h3rF45OCdlk5UyqO+VRvvoY/XWvM/gwxZ5WOm5zRP3Ls38ynLcYhCRAfWo9vuqa0tSAo99wcUISL/S2BWENElR142ra32TsTDukuLjUIdNYSct+p1imyKXk0tukvTHmBQNyNq0aXM6jgXeKLCoMmC/6AXpddnxSJnod3c4tp5fVVCQ6B02qJGSrwBCmHqy4Uyab9tr92a/7ev9OdvtkiIlcpzgCHnj9iGlOO4wPI9WcRx45DxZx9baOv5kHz+QtiLAmYOKbLG3DzKl70Glbc23AwClj5+TdbnrrPMo/NZzvjfyT+4GJdIsaC42TkKnaYds7VLovMkCykBQAl0yAtLE0T6RX8wKX1lbsKClfPp+CVstI9j8unw9DirGl32CqTdgjirGB6NxRMxYjhqQ8mCNZW1w1obQQr6hV8HEaW+ksuYqdX7AQEZw8I8n4RYCofoPZ1Kk27h0HlV/xIEVufHbqbgtlrZCPn6ZpG35+E2ZXLPs9Qdfug1InAImUgbKayFSFKzF0j2LbQGZf3j/4acPpnDMP1hDb4tHnCwHIvlZf9hDJlzTkRHPD0Ttzc2HaPjnj6TtrMuXWjLJ2rzd+htfNCRPlpGKgmhtCkgRK6B+qRGWZg7+xEV5f+/OIVuaj0o0A69tlpO/Co6VJUJb9/Mvf/lwh1ay686y0z+miJNuskaYGt1Wd7TntV1yVlFIhu7N2od6aDNL8ikBi1eQ2+7Jy+JG3OPaFL9tO7f5o/mtEr4wgXEDlMKww+hmF4x6jvzr5cKnZBrrmudEYSw9K3XzxU7JFKHOsavu4e62R0cQaWEfTo5Wx0LA8rE9FIAsSXhXffEfo+ST8tw+Ggt+mW6/cM+KEcScE1zJcfxyvAgwG8U5an43vTxsPcTNhcDeP16lgufeTHPc4/gsswm3uKlYjBDqpnIzyrUqEPuLPmMqpCfaiOYtH98GZj70Gli8V1iQUr4y4IV9BxGh9VlzAFy/lslyYAeBkBPV4+4ehWvKGAQLqcou20ASxr7n6dkaGodW7GNndBAqLISvSrspPO+OJUuzG6jOrTlmMzuDdf1GhQ855D59CHkVScOhewpJxWSPE6QiAUUF4l/Wp19J5lFUFzs7R5PanvpSMUxWdnxAkDYVASxAG/+UPSQF6m/XDLNZhEv4coMhDkIkRV492JZNJZ2suTfD2FshVy4QqqjozumYzVxqsDPLyhRYg51JQNHX5JrozLDYAWuwM8NkBa1fzgSzmXv9Gq9LAaoY5GKWpG38/LgxxVjn7jD2uAQKxNXiU+5tySzCcHBCB/h4EsWaWMksxnS0yE+m6ajlqWVSQvbROIu4A67bK9vCZuXgACq+NkMSJ0gCgbQveKwwNUsdG9CCzh4dQKfPzaBl55JJ4mszZNNaGzMJUnxthmydsqiFZBHkQewVKuglbPodqImRcHVtywZ26KwB0lew8/dmWPtNpxWq6jITJPwVrLWwNIFMx3jld/ne0lrc8sYBdfrc3gQ5YI5fWyH5XllqnYuskSUjAwHbeXbTvbYwa4dEeV/p1oV235cJ66RjVSJsj1gDw7avfay5u7xroNLyMlQuJViyMEODNkVX0NqN0L07WuvMceWM1vbktPgKupCyAdcvo6j6bDg2gZRj+47AClOzF6Dqs+Gg0+f2PhuOKb62Qro3QGsj+6AAjiy+tg8KHOobpAzQPj67WKc7EupiABptOAELAwiwR33bG0KGNXB83exEOayBw87fA4Y1cFTVdWfnSdMSAtk0c7KMhbpCnBy0VJeFbA6XupgZxwL8Q3tjpyYAtHriS3EA04NjsYSygJouExmsGZNiXHukTmntwuaTShOI3buAOq/2qrLyAw4zm1cV5DJonLJIoqZAzKn2QIG+7Hpw6I4d673rQaKcMTo3Vx3JKG//bFzm4ZfJm7oilW1ztkjKEzn3RZd0Q9PU7fZ76BqkYu4yAadZRgoyhhKxHcsc03aUE3Dca5wWLE0sgFtuk2ldVnnDwjVU1ksQ/vo2JJBLeF0a2XcqBs+roKAntIUU23llYEKmWzoLKOC2JU1x1j43vfXZFzcRa1xg5kYQsgWOeM18djxOsZzu2yygFi+mhFZ624EFJ3oJ0cKdZSUyt4Ro4y7TDJtcgrSV3ek1kRKvtRwjgG1wbTpu6VtkL8iQdva7r7/B55dA7Qq+fnuHr0ACtSi4oteBK7gOkOzXJn0gyPwbVIuG/taS9Mwfa0dVscN16tVQG+M1rluvhilkCwzzyGNaDPaglO4eWXBBvSvo4MyIrDhIr/oYFtWGAfZtZY1voXHAomc1tJgQgYVhRABdanfTsQF2kwML7OIlyCG6S57QTk8s+idn0pDqTKosJ77jY4UwAwFMnkjVaciLnl++fsZVp8F3EkeN5LFDBHl7BmeBtP7msFCDvgLXDE4CU9rhxJA14TqJoWPRGFoErJMUftegH1rLMTI/QStwJ1kZX1yKoWlBhgnq27TqmrSl2BHFGVm8hd6s5yjDZd40By7BItFrpoHDWyR2jdVTuEuM2PaaaWBS6yb9+xCt6VOiOwmL6D4tg4/nIrQ6OgIfeejVWA0fcbVPNcj1m1lJCZJndzvogPEzmjADgduM40J4V48oTQPuPu7DdNYG12dUE0HOghwybI8gbM8QMvGJJNBtWXY35o6gSsA6NcTs0B5zMm7joAJ3kgV6N8VHkvZBFfuQKY6rtAzuAvGdpkTHW92bX2BHWdpLFjyvMcXyHvwUemyFZ19cXb7nl5mwRcygTkoCRoAmLQ7jPtmMsOjmjTUyl7McCddJj/dk1yQGPLuVjRBmFCZNHtOJrfktrc5F7rlwbtMmgzspC1uLMslyW4iSLdO+J10fJyM32LBeYjIu07w41U8oonTAMY9WSC2yTze3JGEKmbjCc8rjM7nklWd3a9Ah4zrp8e/8TWrgw6VdR4UtZQJ1K/FBE8ytHC2yk3d4pJMqLcZdHWw37dDd/DWZ4/tLRnYbwdxI9gB8U9PZXVtwN2WRNHmq8V8oMKqBrxKoRmTYciRc95EetpibJvSLy0gPW5PH4ol2MBZDmwzuOdLDlrVC9h7pYavaYPuN9NCbcQkY8ZhPLk4x4SwEjFiAB2PUiyGTmGn0vYKLupcQckZsVj1lmtMJtSWNmOSJJrRsyHmwtu7rrC4wC0y+RU3a9JzXqf+RozXcciDKQAPIpOlzhGM9GoEaBsimzhrRdxkS5jhgoValBleXhgG1ZWyoqqTuNvcwA8r6hJeM8Z/ZWz3eLeUMJh3608BH3oUVrL7t15KQZSdRggRta6oSji9nC+9b2Jyv2PHCbrpf19KxQbINtaS4Kad8dXDbiTMws/e4nuNEKr3lN5nuPKOgSMqL5SK7kWYyB1GNoUIS0rY1m+WdbcsSZmY1GkgIYLHIzK3fDFLRwRZhzIym5ZYVqW+5ARWakBIDLi6IZcW3oISVEociElw+LIUD+Gwu79xt/eup2L9FoCnx9FOnxEwSjtTwuAGxdD3hfCYyYCdNCPn2zd3br99BHbRY+Ole7I9qSIjXEEUAFMBc+ak8DdbY8VOS+cd+2rnpcQcEcVswq5kS5qffPqWP4OrIP/ZTzE2POyCIn4JZzZTAG+j5mXxKiweoq6bv/XRP1kcVHMRnSPRWbu8ZGQuqZ+soyKW93z7to/vs6Xr3pPhUkzuMPekakuUXW3ikbXdJLY+c8TjzHrWw+6xSZRayGqgUXcH3zdJ06OsrUc1IVp9R3VxhSwqSdta2Z/q8HIo+n9cPptS+Yy9iTVCvUwfXCbXHjZyjIx9ahWiK4bp7lFg9NWRbuOOdtiSvkub2rO7olJVENbLQD77EHlpy/+37d//+m3lxY9uY8PQcNYLn4vruaKSzVqD9qOUlNZtYwdLbS0cqdrSyfnhJ7UZasHg5137//iXLyMQWUkTiKzaQBhWQ+MpNrD7F492blyweM1tA8XgBxQbSkOLxAspNrF6tx9j2OI1Xw7sYyBjN2thH1WxiRehiomo30vp3MS9WRia24C7mpUuIs3BtY//i5cNZ+q7Rf6niMbMFdzEvXDzchWsb+5cuHgbpmumsJkWUMqkfSdvmZ9vxBLdkaAn81p2ymjzlXU8qxQO+0C3BnRMkUJ+kS+bT9sEG0VqwpO8PzSfLgxs+KiZUFyU+pdniC9eSusrOm+KsguIz3TKZ0ennvCX8klxaHJo2r9n2eWguUL1iMQrCpMoZg2D2DmEUfQLYQ05gcdHL0TXN2nIDLFDaHTrFt+pdOqNP2N5XYBatNtQU2I65RK0OWT2wI/NejTxU2orEXWNoSTJ6TVOYLF4rgou30V+FeyE37JYmg+pwkzGNYn8Rq0ystBzVRIBcoIOH3/LribAx5gyRZKdIOk10jmXGZ/83xJ/upXrsnV9O6I4Po0mHDRqXsan7iYKNWdL1afaQkEfroU/bMFlx1MDCZb9CoERhI++OFNYnfBEEr6n8RvhNSotKJeLAxNnJ4bKbNMmG9pF0yds355Pb0Svhm7VUxYxNRwSeaG4A7l5K6Z1eKWxeyaAWwnG/0KfV3gjXwVqqxpIwTCEbRICGnfTwrNTBAj0ynqdDVaOCdcwfPCFwDbuaECGzQByuOiNkI4jDr3mXcOtP/OLXdI833z+GYkz6zjxs2WqPdwTwOWXWHiGoQ/ZQjJFtfe6WT30emDF9flQhOrmemoT5WiUCwZsd+fvAhsf7WEWm5MxWYZ6dYY569NAEpiyqaP7olDxhE5Y4AXLUIbsUn8ksqAgZBWFeuNnlRplu1wNU2VUO+xOD6qstw1PSEvZLiEMo+XEyO6ohYBdqBsu1YzMd+Ay/RJ1X42LtgdaHAZzYvdVRT1GwNvpgjdy3oK8MIMCHMzkNljv3CvjFzEDCvstueWEJa7nArwxswHVJ+y436MXEAn6hAIcbSc+20BZrgo2ZhcQdHwzdpNkD8UnBztBGdLME29jA3xQxNHag4CtAE6zm1s8amJ1QdalKKwOL4vHbivSf6hZ0inxSvjM0EHVZaon3sGBP3xrghqZxa1tWBqC2BRKaWNW4qOMO266Obn+07ubs9nAG0td1fzPdNj1dldvGgEvRu6u7E1TC21LT2sOyNyAUHifb+QK0Dsz9Yprq7rNFuzqHDaqn68V7GHe9+6u/+0wbaJ9iXyu8ZuqNkd25gbYnT4fy/l67jQIpMtrv9Uf9ldlB0z8xqI/0G/KBjUS5c4407cclYcsX0kF/mUW9m2DcjzJvVmGs7HuNfk9Xvo5urs8FThiE5NRnfVsYliNUecX1HYv5+doNiH2mIhkkfdo9FKTX7O860q/QYoZgPPVJURgjnxmVizBHWxSw57K0KE4USzMogXHvkcD8RV49FOmzbijnwL9CcudngSLDnbCHAysZx6fhEiQcMPct06wSOfAKDDsn/VA8vyDiYdO22Z9dh+aS9jGGGkIZ3GD5tRu4Xbp2g9C5c952zUuFA/fNs9uWnplvxkld8QpVs7MfubPdeYYtWAE2ZFkEGUiWqDvUnYuXYsWAPXo1LvvIjDcd3IQXeOxG2b/ZkuFexaRkrGvbhBfliByrymNTGidLSUd8BkqjMxZx25ydYF86azmvb95Kydnk8AQLOzIltcIjHL6iNbazrJAOD6DM0gO6FIGs0RcBYNFXd/3CewhFn0qciv8aWDuFU41EGs1baEFaBKqjkLCG3qjG2OabfINQThW+0dcd4ywb2koZ6+DsDaSk7auhzBB9CLOvkAUh+5Aaqg/BnRZLFIf1LpzcWi4FM9wL91QLt2/2j0nZ5/qMGu18J0bQwfGcr2kdGLBoRBNfDOf9VEFzhtmw6zEH6OFfHkdXC/ijAsG4Y3ptTBssRirZ1MpRP5DqAFmy0VJtEGyMFPDp+dCn2isCNsINgI2vo5OwELq1vW2XW+RxScq6fU6GLr360OqBzPwiZKgPo2Rq5BitD9P3B+ObK0ZKA5KPAu/qYsUzqklJdyhLTUxjI69kac7VemgzcmjrofcqSxtzs2+Lwt+Psi2wnoynEc0Pi7g0q8aXRNQaQkgdUgrYgbMkULP5pvcta5jDXDohGBkNZ0eMPJojJNr0pAXP2p7o38gEpmuHBM3DoX9OsufMqyvRwRi5S9J5diGSpZnBfibCzGM+GqFk0x5HATApz6ZsWISaAzu5YHh/w8imxDCXE2Z/yKuLT2ewNjby9O3Q9YeMsJbOg2lrDulrz+Qxp30IB/LvYbcoRuY2/XTwL/0ba2D9btPqXJdJ2lh2kCz1ew1j5OaB+Vqf2iBZmmtcmh0Am5LqGifbGllOdHpZ1LqXsY0ksqm5nzk9kMP4xsKBVNe88ikYahBIHeA3+A5FfWVjw6tXz2pAMufh5Uqz2ycDZ0PrqM+v0EuW5vLBztNWV+952M4eOmY4n1vaDCS+rbIWCDoGKx6TrNY9SwUdhkkg0JHKM/1VnvHd5Lxj94G0T3ZBBy06RKCi8RrsFLyVpSlIjhoOqOW3c52EzJW1QNDcKR6SilzrPvcdnRixoDkihC/Pi1IokoUNrU2ggboS9uRZ8kiyvm7DVuDADA7laVwAG9rwHFWiOSjBLF0aPAc1tueVHIRY3lHa99liZ8N7zVaD4n74dSpw5kVm3UJUVR8eUzr5MW9YrFIwPx4EwfRa78PT4ivh4LFsZPULeP1IB8C9euiGxr4z7qZsBwxaCj6IgcshS7ObJpKRWY8eyXG0Tid+gyboi1mBAcpVwttv7h/eYgpZA7rKufsWWc4a0FXOuUsPj6TNL8+YmhSoPsLYQ6zYslaYAd5Cz0cttnvfc2np/7OlLHPnw3YjiC4ok1L/DHyUbCG98nj3JbulVUVcGu+FUAdkZOdfH8hTT6ozObvm1kKuwXFeQ2CGfPrvI8IGaFmpbGs6mR7Xqfj83UeCEsW9fE5XzGxXN+jks90/6bovxQ4Far7dxrGPqWbrSneuVr/rkhTkmmaa2JNmKXokSNUabfgg5pJmbJrsVMhnFRY4n+tq47jK94LO+lR52tJpQK+NJKo9cHCYLQ+f2pRdlHRwzpQEfvJnBjpCGKyhoqYjG5EEGrAh0pYjEJH02QisIucZ/Wwu3eEJVmhD95GH5j4ztl2a8qhJFKEOTFbZ4vBEjPJohLYK003fIgh1orIXBOmcSAy1dnyrxNUuQAyNAAJvkYjtEYjCoeaP3XzUKm+gsAud98bjuNOO7ycRz40WdKs8sRUep3e0gHuIQ3OcEdoqbHcEJE7xA9MECUbzKZDEoflZzkvEbYNsPFbJ/MRanEpkhHYWhuY8AzB0JCSf+ok4CrLTWAWLIzUx/GiEtgqTTjPFaYIABJ4i0TxohbcKlA++xVBox/eViJjTEAZ7jz2dxIzhRgu4ffwtzpPFqMZmbB9pmLMCC7pDj7ycUI7bI9t4QiVjThIcmOwVaDpYGaUCmcEdfCofeotbEOxM9uHGeBQxyhDDBO0hDLFYWsAVkWOgN2/74aSLAGJfPpzUJp9I+sC3DbzTyo11i4caHue1j4h6jQQuCwsTxIFBHDA0WrH9i0+uCbmg2rSi387t5/hQitthLSlhFOpoRgVOW0bzMRJtIsadaKoUsPAtBGRv2XAdhSF6zAoMLp1oMe42e31zrTmTi09K2b17C6Ql9Nd67wxJjwHRLmfcakRSogazhUOby83U5gaI0ILZRFj6qxBJMGiLwGmXCyOndFgWCbYzmCGSoNi2bJQ3rTB0GQEtYuTPu0OT9tnNV4YGyuYNxYAhxBd6OIuQ/Ro0hh47qkXWtN2AUct1WBYJ44IthgA1koV+vTOJkSlmRJucaUkEwyFaMFgzt1qgRmzijLgWadOyNIZ7dFi2OjMv92H4RI8G7q+l5R3c3toAbPPRvKKD4iMtGthH0k4aro8MwBZx8v4AhpdMeKAiPfUmeMVahwjOttUqG27GGaEtAld7EhjuMgLaMo9fmcbpwtVQ0FHevJCHNNRT4IFLzmYRC6XIqDFtnalY70TpQDVYoAPgkEPP133owo1/84N3RLRrc1TbWy5nchOvoGgLoykmGsQxI6zlQkrTHR7Ic3e4DEXhsNApftiZG92y/hruEiUZIA9Wd30L2lqRNqGf9E5hOqYfbHBmMfKEdBxkD805dQo1Nv1gggrwiHPeW+HcS+x4IRsaJHJ9fRuuf7Q7GoCAN69XdkmaZbRvRtMh4UHlTOvKrrsWeyE7JKAEUp2bmrb04RL2SOabg66xNQUhMKLmGH6TW7pzbIyhQU14x007y7xyWuHfeXIHBEipW+ywVTohocN0RZ6KZPevg5KrR/Rpj1pwyFo+e0jE7MH1ShgjOtqwzNGLxjl56nx7l1PvrYFk4hUsb7rF3iXCjVP5WHnWtRaucsKfdgcDdK9n4OCNk52CB89m3nye0TuURyFcIi85dzrbQwQWVGCRae/uE2qeJSKKRLAsPSBQ0aVNryygy9gkhsrRoHnMT5QvyW2moZ41gJoeVebuKvcvQisrjFu0VNubqgBdbAJAi6ftqq9mEqhcPXdIgGCffrnY+07rAY8TKl65Arxw5fJgpdJ34/POh1Pa5brTNqpXsRI6fb8WRLT5kCcHivy0ZzQ/lSXcr3y2co91VEo7anmVp1JCH5uosoYtboiNjNgOXbP5O3ONo3fkni+KE0V+KZa+kP03EwWXw2tjLX4jS0yHsezRvVOE7zXBFuw6gWP1n8QXrepS3S9ZdyW6sMorAZlr74YxZmlkVLw7faHyOPMFl8gZyVomV5wxndne3U1x217InRJjsEMlLKtLN7zRqvpqpfkF67yKN6zyqxDNrYBOQ8wSLHO+UBFePVsSWoZlMGsh3jJHK8VsFviChVeiCyuzEpC5qG4YY5ZQ1Ywd2YcLU3B5ZGsAtmIoeDCchjfTTZvtuN4h2uAm7NtwzSv7THec+DVtXuk6T/UyHA8NyM1AC0o0YVJou1HcUeLevsOzQLvcUZQsIQsanqLwr0aMa+GwpZqEVLe0ysg5ESsxHv4f+Y4GQNCZy4Q2QsmMmgCjW5qkqADBh2i6564nZeKwMaGUYgCEeYUPeiFvYAIcssFyEcBeFU3Sc9r08G1yuxQFqmcGuddQSwZBjwonFFUqZfwulr8aM6aPoGkPHlmTDAuTtc3rUD0KPIsQ+n12ubKE+JOvMcDRR1cNNHvN1Rob9cKXYeDPwq3VMorjFgPtqBwp7755Y97NEFcAD7QzOBek7Q7XlrBd/frT+IwOadOenMHNCGc8wkGNO1oczGXLeVGwNTXy8AkgP+kP3ktfmPbGloMro2uyuqLDV3gLtHasZG3eEyRtnhbjWUwWa9aRTmUOybH5srwbncIa5Mu5mLGY354e3WG4MTs8JmXgBr4stbObrvOg1VcloKNH+DF/VFUaSDddYk6IKkyH6aZsvlaJpkuN6KZqdewfTZke1U3db8CDxQYpvwEOF+sqSCi3BONXVkIFgN/Z2rttXu8PzoAVknP+4xXKHZj7KY0nOhwwD7iexgED9EwOk8tMjms7o5fYp+BMmcH9jqUox8jbYehvnWrjej1yoN8cJn1g8Xz4zEyPO3vLHIN/T6qh9OWabCE8fLx/YAB5nwNP9yooFTB+Exvty1m74aNjK8MF7x458hea1QPrIVQhkzbtwvgduEpxoZPVUTa3XQWfPnVyyZ4J8+jU5hfbH40V1r6AvD2W9dyTZC6Du3VryVXsS6m0qrKGO0cswa6Bj3vrI5hKlTdwqk3W2Ny981B/y9tz0qTtpoLtFvUJYWsj5qX/B9JWxNrCirf1rIsVfV3m6nOL3D2S8uMk7zgqmJ/vWzBsNWVcWFZPyMB0MoqF8EyalmSs7x5vP+RsuclQGCD0ekxbu8/WApMrVd8EStgiWYj/RGF+/uUvH8JIZRRruINOvYwBJpsQgIFATsPlornSB6bcY9nImyHhzbv+2Us4+Q4LQN49d2xlJKHDjpOu/3FSoAAEyBAxGhH4ZSQLMTv6or1WCyaVUWyEbf0rC+ITSCihWAj/PpAhMHkzhDWSV9ncAqvPggEJbpSUKW3GA525RbIQf2Cfv0fg3QBZ09uStERponZQtoAPaafePAIzTgg2orwMbgAWDL+JwVSX7Ucd3pPyfaq4N7FL1o2kTXKvH6aakjXJOQq24wIGPjSwU/5vP/wAOX3zrz+/T354f3+f/K9f/o/20M36mBS7x8PmZupjZzvP8JOHYX6haTnKQo+LhuMErzrzodSSdmVkOYIBpEjuy5LHuySuOg0b2He8AfWru2DvzRxOORpXk2Bw85PhzAKyt0yHGbg+XZuBcNjvA534ZnX151Qbmlpxo2r/sqjCkX1Ou2y+65uYXjiH+1KSKg4Alkc1SbQTfrpZrlfCZGvzxqo8CfSi2iIY6fiMzItmsjTCj0NVL/zZ1LzvvRo7eRHtIMxhFOjQyTNjZlMzwThg8mOYbT1CIpRdrrqmvW5B+OFu6yItg0rq7s4xFdzuOHIcVyB+Y8efYItlEz8nc+sCRsWC57gFsgyv58/LptZshTgzz1DxruuWJ3LuC8tqpu5g/ja2C53s0caKlVtYWRHkU7jM4w7CXLdutKqfdYdqrWQrcyPR9BK0H49sDaLhS9xhXDOEmbBLQ7gka3M8sSK/VqXu3KaVZ2VuJDpVLIKHH8tia6ZIO/LNuzlQnyfXHsRMSh0wsJOzLXCtaUe4BoCQBaZwDwIhLetzEJ+wB1IlbfoplG7CcKCkXnlMu/wxLC9VYGYRRU0H3Fne3OiIOzB3dVDmQyA3wqza56avE0OkEHsvoQYyk49i2RTck3QNYD3uAp1/7rtA3YxS39kmedl4ZqUax4U6qCTpscwSeuAi7Y6vtweBHG8PhaVrj2GeJmbNEvs1LTw7ShUKgDakMdoimOmqvq2bZzrp15z+s9NtEMyT4bLWhKiz8sym5hBc1LxL/RgWWxuFf5MlGZtJms50zcfOs7K3UpG2rT2r78rcSsSG99DdHBXTYm+l6lvdKX0Q02xuHq6nZ9bx+tFIxmaSh8CmbwNgI/Mv3pKxheRTm2tC+AJIZmPQVCrUeSoYI3FLLWhbn9xIAd/f39IqQKykYQndIpiXBbtC3OkNSqUSxkqcFbn31HVtb6fiY8xuoAWuC/SvEc4qhIUx9OedrK001PDtfeAIRI0DpGZhykNpJwzz0e6v3/w+MEd3ENb2aJohjQXQe41nBwOYaHku/8224LlcAM8MAHRkqAcdqJKUDj2Cc2wCAReUgKxTwkCJzy2ttu2yP17V7P56n2fBWozIUHldUfdij7LEqEkKPLCUvm6pWbiEBQdKTad6wbQCA0p5uZxvwZwTCJT0lnbhpBMIlJSFlw3lFBhQyiZ9CC9HEwiUlA77gjkFBrjKINQWpzTyZtd79L8BcWy7Q2kXGDCx96aEAsSFNGjJQo/l2WcFy1DghXefyKLWyC4dR6gQorrnaOk4QjknEKeOI5R0AoGShk2eNEBgct/11T2GS0cZSqmM5W7pKEM5JxBwRzm+/ei/saPHcumrg6kBa9zrjjaUsXNy83YoHsy+x3Md2gdLWHDcj43pLiSCDg3tUpdCb1xNyZnvGYmfU9A1q7TNHUvqjkcg2Ii66m0gkUAAEHksWqvYtMvXyoMtYXwLho2Mn2EIJJsxbGTSaYVAyg2SjXgYHw2/AA/ua2lXOLbru/T/iiK0QsgoNsIsMCMFgI3mltL/3b0J5JJQQIRNXajDKDhSTjhWUn60xeNwzJ52jWQjRqge4IqROY/idlSaMdz+IE6T9oe710+BdCscKynzeZKefx26PinINc2epyXgQBVGYB9Zl5YODJ0PMYCEydBO0thYhhuPQJjSFNDO0rqBTYVJH0meAt5JYtc5ThjMkgSckwS2U4WpYcKDicAqzeCiK51YD+VdQ9mo+zY5t6fQfkJCsRDyvfMwthnCShU4cziDZg7nW+DYRQBYaEjmuhy15ZkQ7EShpX+GsFL96r4wsif7Vbcwsj+qGEqlXEFUH1EMpFpAbHTuR+F2ZLrjcBuqa+gw/Qoapt8ezpcwngnBRkRHgAjN3wrGQlmUgY2SALDQiK9RZgF7LBu549bVjlC5a7Uj+TqU5WsIDSnr9llcBU3Sgs7eA2nVgBYZFR3MdXX2QFxXy7f0GyAbbU6HTg+OF1x2lAuIha7OA0uOALDQNCSwGRMANhrHU7Y7FkhAluYh694C76jqiSYMAFlgrZshAFT/FE71TxCq6W5lGJuEAiREGO/voKDUjAGJeoKyUdfF89v7N6HlR0KxEbb5Y9qTJM0y0gU2m3ssG/l0sTWMVkKxELY5bZXOb78JXNxcwdgoQ+cJmp297VHbWxq4YzIh2Inuvv4mmEpg2Mnug6nuYURfh/YQC4aNLHTlCLZWxE+mp9ktsPVcwUAopcPwCMwbNIiAun7IMRI94wBIWZAd4ritrSJdcCykS1CFIM4VjI0yL8P5ZgwL2SPNdd3rSmA2CcRCF76UClw85bcLsjawBZBRYISBZVNGARF2gcstMsruZAcsBGKXWiPuBGwWUfgjfE9IHDYd19nTgZ20q1jELs+53EKuw3QSJFbiz6Qh1ZlUmTFGuJsuDbSPvAfyTGnzNnEIMQwWuAf3kdg9V3X17Lt8pRUnw0Y+C8E0uJ2DGAUzmz6v2AHfpu78O3/JB2pINzl0TlLmff6IKGcN6SaHlTLaRLF5knfnppC0h4XJGrfbg2UsMFBa/wXXFS30zMXqkLXPcXYF+w7NUQR/oK7DrC9maD95yAXWDu8nE7Gam6Fh8qhh6zntl5TMKDDSkGMSEiv8OIQ4cB20MigROywOzkeQRW4Fc6+QgOT5bwilbUYBkvbtkIU32AsMjBZnwOU4snpMiwGBdYEBTSO8YjvyF9Av5tCOXZuZwzrmtQipOqLBLtON3x4p+FFh73Uu3U0lKHuESgq+U7nLF43K9Zq1q3+0LlHguqRInQjnF5G6MWxzUmxDTO+/o1/wm3TmwiZ2TkW8Z3OOjg3+oUnZytPB9jKDLPUo6TmuKY86VOMtjfGzg+WxD6iELRqEGnJFxZHfdEsF9Eg1D0zNU2HOSP6ht/MkmuMGyarZ6cW19Q9yAthj5NtaXQ/9Ufz+uLco03z/8jUzmf4gbMapwtDyYeZk/EdySYeip9bUC6RY/eZUp+35Bz6vyU/s4bNn+mf6e1b7t78ml/b+rrzevUvf3L25vH1z9y4v372hH/d1XWQ3qkQBRDNk+1s6Xn895shr+tfX/EEX+gv67+/u3tx9/fqb1/evk/t/+v3vv7mbC8L3ZX0mxXdn0mVt3rDU/fP3x/3vRr+vvEB/9z1/gYdkPf33q9+9+vDT+7/++acffvrlfycffvnbH3/6S/L+L3/8259//PDqu1f/8V/j0gKdbf74xPtY2lB99x//+buPr1pS1o/kTH+8pEVHfjd/OEak5t9Nh0bnd7N+mOduv5v/RrOZPfvUkJY9MydN75ZPTr2I2MRe22YP2Fv+nHR32bv1N+cyPbePSnRxoPqWFso/V4/lPXvljBUR5Qe0N6jZP/k/2MOO01fTH1Yfyzej91hdkXz75u7t1++SNj3ndbKF3H58oqMcWt76W5KeH5kHu3ESY/6W/q6i+U+Lg/bbPutbtT+Wv/IY2uZPuuxGzkNBRdlSkvHLP6IRTeouyws6M6i1qVl/TwcXRPvleANd/bcmM/2JFZmB1v1k6Nh/H2ldNX0+BpbXfjF0PbWnkgdaUHvadlXXpK8fSJXc5lB4KgvjN2PEre6TtjydyWOeseCfeZ+cs7M2vWNP0D13PdEm8nZ5qmefa76RqtOnc33VfcaaanbbnbqVhfrXfrY7Yaf8s0ik7qvxYJlF+OarllwNFWT1sobuozbNizHeXFaTJ7FoBP7Y8lWTAr5ZqeRFwG7T5/aPOkKHCVWmT3pXENLwFxZ0X4yl2uLB8cVYUcj5sNvy5ZU2BJVIt/nLIr/eevrfSlv2xIe0c0rGZ9bM3/Hm0FSWxXfT+78jN4tvZjPgPWrCHkVRF3HaTGg9PXtQW0EmFpZj0gesk6dDioG9Jvbdx1ffi0HDd+/f819+9VQWVfed+O0fPn78+OrW9813x+OnT5+mAQ0t8ceuO/51/Og14VOYj2ygNY4VuFnfDuMv8zP/echej7yvO9IPzeshE8MG8SL6qSCHW5a/vmYZN2vO5Qrnnz/ycQ9fFGD7wB0dvvUsrhv/6vX/YP89so/mgdCUpn/mbhHaaKoZ4n//LnQMxPborqQ6/vzLjwkb/NUVbWg7kQfTH1mdz2nTS+vU2BKzYaz0d1ZW6ACHjnRfF+fVX2g5oUMoOrzn4zu+3LLB5n2g4E3oZ2lRXxWfyP3dqpxsPsr5PRqqc3whvtso1X21wxo7HPHM/B5k/eed9byioFWx+0KPwVvGSbHiw6XhywkhYoTW3J5pXS5Ywd5xKw3GRkSVu12Rb3q6RPxpp2X3Yd+mVcdPG+pN2Khz2Vez4PMhqukj0WCkl9XIZOs28dXU6aVFcWLJP+cdrY7ZbZfl9u+V+FXWwMF1HyuRRZsPxdZ//mU1pr+Qkq25k3/05pSVy2Xe+AW5WFC8J316po3tP6yfx+WX3y3LLb9jS5El62rY6KU7PyTTAsV84vn4w/sPP304/sCWlqbnlsa3qVgPlC8tuT8Q9V8whnRCzBeHTyrL+/sADPZoZdqWj98GYPS/TXuWbiBsNeZu4xXxEJcvCBv95mMIdFcI8YoZRWDzTwYCLG5/5MPa1QOIP/7p5/u79/92924WNq/UJWlWNlB9rtDzuAEb+TS0aRkPuwdXJ0fsrBwiIbNljFjQ9HNxAioGepkm0wJtDW4KXUma8fWOCNAkWpYSvsIWCfzStVmsLL02WRurMF6bPJ5strpcR3P57RLP5WwVMhJ0fhcrL/M0WpuVzxc1IoCz9aksBQ+VHNEL2iJGhH46pbFa2QmebQ3lVbTOvyB8aS8WesRaWsSrpXRCUpzqp1joTXo7xRtylV2sdqDJqljNedPGKuAUOenya0VnopEY6HCLLcQ0Y8TvGAQkboHsoo266Gxr2U2PAB5vchGzVRxiNosxx7mP5zSWv9lWbhzo1fEZXIpSbHuhoood8lk/CrhYAOH74UMjgWOsg0zgW+FA7FNd90XNlviPaZMf5c2mZf0V6oUNGDu6w0MsZfUZnE0KjPn4j2ei1hgIOtiB0Q7eQhmhpNdk0LD8dbWEhU90WSRZgciHvTY/eiRwPIDZF3MoCB/7S5F2t8VP7HlX/itfPVo8oL5xC4yfm2abux0tR+AeY2Pb12UO7hLWtqfck3ReTJZuSXmg0AYhyajbuvwimhtfoBARbpsWW+sWXNHWlqQ652lViXgqPvYDePqysZROgfkhdEXeeZYc9vjJ4JfkXCp25EmcKWNHuGhC/LIvRyiC7ILGUoWBzcnadleb/FDGM5BtT55KP4RVwfBCGAuGnylbgyoKcA+xsjYXDSDieE9sDLA6Fdf56CW0VKxARNIWEDclbAF3EuKyTiybCwncHMhOynP7KFcU4jJyG63Hs9jcevyntznNUbF2MB3wdlxKWCEydwhBTt5g/uM9fTs0Pde1+o2bljUYk7QGc1LGzq6L8//jOfbVuS4XEJYq9o8A08RpmVoFIE7hh0BcSUVa+JBIBXFLwSNNjbnbcFAFMr017mtfn/gBlwCExmEWobKf32T3BWAjfsd6zgFYleIl2b0mTaaiJAcALPdJ+Gm38XRnCODNddKiAuGlKsBelKoAhMZhnquyHwuFE4A4PM0Llvi3W6maAJiICQCsoMhPYzdaOk70VqZOxzg2lg51SLLLbjn4JM3aEL6YvbWTIo64mzvNAjem8GncztC9w5EAHI5brOxcxoMrQ5ft2JWhw6bW1i4kVx22pVZ2bVpehspPcuuZKW57LVtTh+m4wjSoFDo2iZKl017HytLxgObK1mWrYjFk80Sf5om1+nML7NTsC0vG6GNHPO3cZnuSIW8cfAxZ4+Bjx2q3j13r6Rm3xY2VqUevLyzHOuJjycs50LChtZ+FVE0LXtiXHx13aW04jo35Bo7dMKVQDmMSNYBL/6dGCPLKCgPFI05NsAQhFnhmn7iXFglB+CQIw6me8CvwxzLNqCvOeUunFktwCjf7gt0HPdB/HdzGgSqE+Y0lTwB3U677lhfg8ysbU5rktPI0pnPK/rC6eu4IEGJb0ilyfqhI/6luwcsdawgRiSZERXN79jOcI185mvJUe5UUfu2wHJ7mK4j03zgoSUtY/BR3MJfDo4vV0DQ+tYWrZV3kcm32xH/XkoKkHZl/5j5u2rqvs7oYj0Q88WPRWTZ9+zr1YmYT4/Fwy3GCfRr/yv6SdA3J2G6SZ7qU6FM2oRCMK/vs53AEsaQxnvDg22mO1UEJeiFpP7QoUOUFPKsyoHjU8y2OyEIUEHSvT7g4jp8blVDfT0Ah7m+K4Zqvbt9P6NKvDs0n8KzABz8qNppf6PBNtDyya8ZxGZ2qp8VhCvGDlx41J9uAeQEKNM9N/czxVJAVC7sSnNUD29sDz3QD6eBXw8KIXiY5EdIixWsYshXf+NsICbNSvmQqxybkpZiXIDdyAJTsFOblJqXJqMQaYjePlN7tAygN7SPpkrdvziffzsiT8g6dcowHNf04jmlR3agkwE4B887Yo0ckiOUdGRtTtyLuV8RsUJZYvDxZsNlj3Of8cU0ofhmWN0AOpHTw6BkJeyPi9qyq+rSjmgLq3H/7/t2//4aVOHfiz5Di37//PAnmvC+f3ndvPk96R94XSq/UiX+Wgq3l/3zpf8lirqP/bKl/0UKvo3+h1LeXjlQdSer64fMUfr2Az+iBlyz+Wv7Pl/4XrQBa/ijpn1hZuMOaDhLb/Ay/qmWjWuoyJMwiUvoApHKoRiTWfSxeW6xeLCd7MGOluc93wYXRUqXCRtI9hzfWRD32TYO8lDUN4Hw1y1jSeDAUTqocm94WEXnflYeCd7RV+pQWD+Ofpp/QUCfBWMCfytPQjb/n/8TBm1SiQP72KX0UpZT/EwdvkugEOUXMXkUypr+d31yZ7g/Ov4mHnLCgnOyiosPxRA+W7Ea2Acej0PAzOjEJYqfAMfySBwP9oK0b8BkQD4abw20gD/j5FjqL5RWRZ/+sY0QiHtRbPCoeiYbfJWQ73hE5nDavPfBd4iIA4XMZ3/VMgA/HVH5jcjhGcLJSTBeXlx4JOGR0R171SPFYRFcRj2BqZ+Mx3Bzux3nAb9q/uERz+xePZmn/4nHw9gkXXlmvwyiWh4a6oWFRU6dL1fJ7DGmWkYK0GJ0fiK8uq7xh0XjgaxQ+dOw5iKhJY61xSqj/4De7nbCzrIyHXaZZNHCS/dqkDyQa/jWiY+YqWMYonpzhlr6NJ/+W3n39TUz4r9/exYOffx0LfnnGMCbD8ohzBIY8diL6W0vSM3vkL0Y+i650ymfs/k3ASy6Kw5BjUswH+ke8hWL9++C8APKMb3im8N0SZ8KJQG5rX5Ir2JE070VAIrlSjr9yvLPvSYI0gVXS0E5QsKQEHn3YjwFlJc/CgbrAA+CKW9IWLod7Ro4EdZP+fSAJCzbAXBarlAkajMUkHQV/Zq5JWxYFLnZyZK6YaRJHHmmZbkh1JlXmEMgWQiV3ces2LbiRNpK4bB67UvRt8JqDEnvTVkZlmJ5C5OvhUZlQFs0sHKjLTgAuzLGGiYu1ylEJsNa3dDSiVY5frNdEUcvcmipeFgmeFynbcncTP7MUbFFzTMGHsA7uwBavkMhkL1JSlAOGQKp8mmjNYYdRJqka2AT+xqMVeYotPAMHe6Khf0rqbg5+Iv0mXLUBXEQIZi+4I7hnIVoGTioisLta/rhDxsIzbrd6V7+ES4ciOp0GNMHmmEqngrdCDPKmCnEMehOYTUpgt/G5Eyyi6HzvDoxs28JOqp2xm2wuso3D/F1lTdv2rK7OafvsV+DXYJ9I+jAuozlOXrdoeVjKuLljWFEdyvLGRSiSw3OZOginEExaEHjccR3E7VwEpyWvuj51CNSgwylJWbcOh9TUKCJcpOvKqxFsrluheE5R0LQgLnGntSC+9XpqtxuHIbHKmteiMIRzTofOfeY08VADtY/J4BDEUAPDK1MYxFyXwmBEVQoD2RV+XDh2E9sfctUzOKKMT6qN10jmhzDmXzm9za2CnJ/FWEN6jGkExDT64KOOTsIehyHz9apA+PFHGV8KjskGZVhEa59nLi8BgBBdgmeCAB3eVAbhLX6NBOvXvG/A1+U4cwmtD0J0iecJApTc6gjL3uPeOlX+nasnFXg5HuAUjVTGC0mwAs9zEqaAXafb4yT0iDw/H7Nya0q/GNcjKvpV8pi3/YCF3YnH7+Q/hCMLX+/+4Pq0lY0hRxBfd31L0nL2hvgZC8dvEqRF6z7VSd6XybeBiDlWQnNMbVO5maS5FhMNjsgDLLQlnY6IBbmmGTsSPi5tpp2z8zcIy2z/QEjT1sF4Q9+7zyc3IKKO3x/PeXqtqNPgQU51iO5LERsEcinv75Iyz1rnMdMWqbx7ejrwx1UPZ3JxHn7s4Ir85Hz7TgnlsTa3R0BAmZvk7sDdHghXEIcTWUoEnu2OEcWNUF7jThVSIMb0d8ew2Rq0Nq3OwS3IXDECceiv8+CSOIIgYRXJ8hs+7LiO9yySW10/hJaGvn4g1YEOYYZLmvVDm1fXA5NNukNo/VFAByCyvvCUdoS2gPSzzPF4iRLOY4lsgyB1NGFApDzRrpQFkg/D4Y/Gda+7IBBRH8OU8NwXJdcfir9hoqgGLk/46FDF6GqL6qh1XAvcTm3Wv3VVCsHkD9S6dytK6HyP3dPqxdoYOkDo29q5DdvQ0BHihT2TveWbfo8FP03ONvBJ1w8nh3MYSpLpPsU6ZyNgJufnKqW9dMK6tNb1uIoDT1PXzks5YGDng6wO+KLox4Hu0/ZKnLsWJfi2XgUWczWop6NXMZ3mO1XyL13V2hH9liRUuDmmVD4WmJ8MWCvGcK4Jn5TOy/178K6gk/CkqOtmn4kxwf2WN9wo/FZKLRyb4kM7CnYs0HnXlzUfaV7NHTT9t9fxEB2O5569Cu6BtBVx7sYnJD4q7OvuyLF820gZbeUuJBzPfVkVnHBXEFKOlpErPN+cpMV/eceYIi+/CcbKccCm4A8LlrP/9Vji4UCHB+rAqG7v3oFhcVyQb2Bd82ecx2169dUvk7QBx1V0QHWO2wVG9tkRB8AGrXSs8cc56Zom2MsqUM/xExg4SS/iF34rhSCimF5fwUfLA4nC8SFmX5pxjS9xXuNT8oj2a/wbW4J1bLTsoJ6jWRCwVHziws95G0Sj8gsvmPioPmdSVLD5tmkfFzhiQM8HIGJiB9UZNXZQORzOpEjn6j7+5CpSYIhyIDD8dKwwkrQtH78p2cOZrz+Y4ZaAxQPp67q/HU9XMW+expnTL2ArCQZAFnmW3fI9H6kwsXN8KO/vly+kF0Gn39le/DTwTbm+TgDsmSEVLI8/fiwKKRE8BLykusirB5oBtNX0kD3ji0J16pOiAG4Xw/CyvqWAaVGc6F+swzwHzFtm7aTd0MZQevbBiwPqkjcRMBPI8QAH4PGJZBRE5k1RAca7mbX95okRV7Q1QilkNcERLunT7qFgyQ/BZVEMuyNL/ehM+UaQVNDYoWu2zhLkEiXXdAhxJMFPywY/sv7RSTETMf4Wl2Kf34IF1Vt7FpyaZiHi5y9wCdaVcSQIzxC+jrnRjlPlOPJGNE455Us4ipzlv0dQPuJLxX8EBgofH+g8pk3DDql984ZvdtAukz0aSIdV4FKhxRH9b3c45RWLl3fgE6m0J9YQDM7QeFqz04N1QwGOdm0JqQ581yJG6kvSdek1kmvLy5UOR/F8UZH+U90+RFI7XduPiY3ni74duv6QETY1jaF4/OLQ2I8MOmAWRRSp9qertWD8vwfn2YgOB7RprAWpsubAG+gDO7fiDTOePjzwVYsL4E6rAujSpiVhdW3av667JLuwdVBwr2NC6+bHndfXit1TDIZGUC1w6d+S+W/zRDYaAeipMQd0Ut3YTdhz0tZ0DGBfc3KApuVX9oxPCdZBs/FUkp7TBva+jgPy+KDbFh9P+YjvO65aUMVTZHz5iDbL+RiNSJCMi0r8ty9DEuJ/NvQ8ppcDa+74YqgHGsfI6oG1cd38D4+0a4A8FZHfuob/50CqwXqy3Y7CnXZgv8x7QAhKO+D0iS/SEtvIf0TzRDOe/+cAOp5pQnBkVy78MiHX5kBHqm3aPk8LqUlH28aCiCEnW1ZdfwddW7Ux0w9h1NKHWNxdPbQZObCOgMBEqCyw1LDRIUiE9CEGtxjpjm3eKe3yTE+//xZRwbWxEl8bRD7mS7b6ZSMV3yEys7I8rkTYuOcvEdnbu7vDFGvexi99i6hArkZWCfLHiBpoLbJSs5mVG+OYq+KRGLddIxXCMviYxtmwI/1ATP6LofUZ8kEg+es4XQyxbKdnvPGD4lxSnZuaDuswnTsfCoEc5jJBjtfJ2BWpYJCxJfGDacmxpB7PD01a+U30lUgeM30lzpjAoBon4/lDLCWAgyWiVUEHTMI8J60TeBeKZUqTku5AnCe8W5RxWEGeehZC9uxfNBbErm/r6noYL/YdAIeFLHiiX+BrEoeivl5Jy2WyZT0UaDHJzG5pBTjsrIS88oP+bKhO//70fOhTwOPXFiTaQT4EAOVVVgxnwosJbTiCMKatkHA1UyyHIBC223EYA/3SOe+VNvZhcDc6YglCQMh3CQop469NeAMtY0HCARhBpvlTCEaZZgensyxqFL4DFeZer42mDQTv+UI6qzWS73hlQhFKDuycnc+S5xqtTT8dMBztueqzAZm6XhyUJD2fW5q2JK8uYU2rBFnwE589C4kGPtRiwXQ6uWjDKh7oOOha93l42ZBQB2qZPWeBjZ0EKC40s+Fy3rEA+e477TpscRl2CC/TM+Q4TIIc9gcCTtVlOQBN841kWCVKB5+wV5+TR5L1tfNStpZr3MZoSJZfaI72hTVGMhCYIrEgbVh56LOhoMUK7mY3WOCT5EDQ3871ZhEDDzdOE8OQS/DjbQ6gOD2TvNQWBMR38YM7JPmQRxDQvG7NjusHLINs8FbzwGtgvZuWO6djOKJRQxjsapARMMWJRYSWgm1qhHY8DCNEydg2jZECx5nqYfolJMCWHXU1d8XGFrPZuY1NUGD5hBQZcz1FRfbDatKKj83LFzLsjDafwzrwAPSIyOxmBBaomDsjF4p5No3sXDHtw1bLZ9zYoPIcHNsN06wcGXc3T0fGl2buyMjz7AE3E9Xz8mgky5w1GoU804xGssw9o1GMO3LI6PKBEOTyOY+hkYFXR6dxoRXj7DgMu1EyMss4GkVEHcN4tnTa19OfpuHl/JvDpzZtGvtFfxeS9WhzoVpOe78AWYx0TSPd+VdJnCTteSKkZhxgR07KliRCOjaD+qglYD3Gj001DvmjskxD6qg5tIywo6ZlGnBHLtJ7mhhpmUfNUV22H0RHbq1NhBHSJw/iI6dMTRUhTfP0IXI5V/DESI161vJCnNIkJrY3zZxRU7maR70QpzSteiHGcZYVl0yedMWt5MscLHK7pWSKkKLV5C9ymjRcEVKlmne+BOFuGhqXVMxKI2fbngYtLXkjr7ux11qnY+18Ky1w40bNMF6XTsSgAIlCNHbRkiDjoyeAn3K3LvDxx7r9D8QbGTdLcRGoFItnjMXryt3IQqdPYj7geyZqjhvHnyJii0BhMFt/wh4dMWPuM4hdofc/bC5uWU+/HP/PK9nz1cv9kdvD22/uH976Hxg3Qd99Gw363KWHLr8GXIKwoT+SNr88x06DYImCHw4699FiZkM7zexmfQnbjGlbhQ4r4Dr0qj48sltPcbRz6PmyX4wE+OnedB3KM5UBnccW/9KmV3Y2a7xnhofb3t0nVHCWCA8HQIsf0qY7PJDn7nAZCmvcVziQT85PPxT56mheQcf/pE0uOTtOHKLQDByiWJ5KjsvJQ3MGPImhBi3G0bPDXQceVUCEnTg99ySZgx3wH6XYB2b3wXEAejr6LVWfFCkrwjn7P35G9XgaLhfpfZHxxwP4QKMP+N8HMthywwl3HCUdxpNrh/GPQfh83J9wneO/4Zr7W96ekyZtaaN5aQnhkfT4y9PHn8ShtunXScmfrUIGrTtbJHQb5Adeg8Rz2bX1xRo93Pi+xzEbR4y2DtqKM+bKlaI1oLpjwpoOGP6J/v7nX/7ywdtlG7wPrNV4n9Ikg6olBDLt69IaRR+MNmcGEt6ZNC3JWPiz8WZ0zjpZtLSvshwJs8g7UKsGwZq3rMBtDgi1GRLeHUGOvjqhds8dW9xIqoG90okKLVaU0DDZiApwSxGO19a/AqJJg/HCeoQNWEfK5oZWfsabLSVqKyTebcct6CwgNRoWexYoOLm8cQjsW6aSe/y3H344/uvP75Mf3t/fJ//rl/9zrNj8g02h1lUmebxL2EP2L8HLp4IvRfSSiWJcgZkP5uJV62XZQEEf4ZzvSfk+ra7HG0mb5B4tkz6MI+o/swH1GKCnpBWTNkYuLzla6camNxBk3aAFgrGGLHhMKlowRxTakZ/7olv6YvGzfS0aDtXmKRpWV73FxPrU5tapPRiQvcr+zTs0tPxqD5kIR2NPGCVZ3tzc+18t5jBeBbJe6gMjZmlJigKvuGQZmgOzW0r/d/cGF6+pC9sNTQdEwrIYvMgEwkQtMJl9owyOVZdN2h/uXj/hITLPJen516Hrxd5ZMm4+RKW4tHWZNB1eoV+RUOCRQWwGRiPpBjYYJX1Uoq5zXvGCAT99/eb3yMi4WUpnZVXPn0JFA+3b5Nye0NoKSDwPBzC08cf5htYJkOxsuy/pgoVXQEj2a5Nan9lwgLNFEoZDVX1bN2jNAWnbGq0/uuIND24PZ9uFIDgW7SZRa2ZRolUm8f/Iw4zSFuLMAelrNKjxFJTYLUoLOoLGgq5oN9nVkMfk4JA57cUePmHB1TlaljQErZY1zut9eqSse+u81WVCQyt3DOyf0MDEOS5sPNSRyAzKLNBA6dTq7f0bvGxp80cWAE3EMMZCpSNnzFS3Oa1u57ffoM1TW7xBSndL0RZvKNbd198got0jYn2N17IgTngoVDIedcME5AsE3ZD3eAN2jlvXDzmqUraQbH2YEYzY31qSAt7JgwPmJSLaI80Te5AyMBzm7JhhJVmLVqwFHlrOjnhd8CSDtuyIK6QMDWctakGa1j7Sgf6bVGwLJnjQt0cXqyFn0rAo3lUGPHLmRfJAnqlJ3oLij/nTdM9VXT2HT6okAlZS+rxip1ibusNoTRXgzD1nwscxCI2DgoCOkcq8zx9R1Y8rvaiAGHNXCfBMXUqniH6brBBc/npsF6dwbEmiFZItUZTCQpHb4AGrhIezmC0BYk3IJMiOCN9iYua/oeZL17dDhlmJsVv4x7QY/AGnd7rSIr9W0IPPJqBxLxkaH9cOxzeTIXGFoVDIysrae+ixR0ra1HshTI1Gk/uYdrSOBcNK+/B4PqzYUzChKGL/GKOPnCHH7WPPMylrFH7eDRMqNG1Bvf2CIu/shaZOBksYCqo8tPKa9d5d1QQxPouDJYhkzXL5OC2CW+8RD6fFEBtoSVNb72JZsYqy9t9xmEDKc8jWtoSCUQvLpgscd8tIQbuLMhBbHPIfj8lIdDhrfbHcCtSkZ9bvBMM8oNU4CoWR/c1D0Am+GWYalAc2wOuNjFCwLp2OH6EhJSktmNhwoc5f4HDGC3tARIVFTqxvijsBIgzJN3BIDaKEKqbuvpd04MhJxaaKaZ9niC7Wc+Clg52YwVMccP5GgXa5nG+I4jgcnrpb2mGq43B46rBGcTJk+BBMQmNHavG8F3BAV4HGj6ThiQs54aaAE6HwMKZJMiodGuMlOWD3XYHWYeZGh5kXXVH38jtIiDI3yIia+7plb60hahWICBqxBqDsI7RBPy3NbHad3EiBMYxgcFjStmcZcIHHQSMC0rjsgeQ/Bsgi0GDg0J/f3qP1lgsiC0MTirac1QisEPxogG/BaFpqeWFbD8e8FtcHx995IgljxzStjf2YeVDCTRqojP+kUGV9Hgry8dV3H199z+7Mk6z/7v17/suvnsqi6r4Tv/3Dx48fX936vvnuePz06dPrMYDKazp1obl//Ov40WvC5jPsy6/EFjM369th/GV+5j8P2euR93VH+qF5zfdJK1rlPvAfRfQpFsvnluWvr1nGjZtzuUL7548fq6+++p7vDbHDM91XTdqzvOZfvf4f7L9H9tH3x03K/pl7USikaWeI//27/5p/9eMT327q6J/+gzmpJWX9SM70x0tadGSxHWOnzN99Ec78gU8mBcZfaa7/P+xQy//v1CCnnsmFRVej5ZMFQ+z+Mb358RU7OXQl1fF1V2R8Tk2Or7M2m3aP6D+/oFZhyCb7f0hvfzF+/EKagv989btXH356/9c///TDT7/87+TDL3/7409/Sf76x/cfXn336vt/oe74+PErcQ7yDx9fvX395uMr+htSZTUbC9Bf/e2XPx2+/fjqXygnJRWc9JMqLckfVOXnh7FYK9LLkCkAHZX1zx8y+v/UfgJ8xfHpB/R/31/q4kzahWSsKatvNF/SfrZmXyu+nSxyWjZW3/Ogx6IyLvb0G1ppScvCLv1B5A/7ZZFXD/w3vBCOmbERdRxVKdSuuNnAMs1ZtEQ6bEhYeANpQzmAfseSNeym1GMyMJ6hY/99pIU8EtsUcZIPwvm4Jy4RLUHinemoNGPMw4THPIzLdG0JqUQ0j7hJmiJ+Mww+iYjLV+TXWz+SReCZElUQ0sRNB48BGLG+nvqsb4u44F12I6zZbpNtE4jNVwykr+v+lqRn2tH0eRenWE9RBn+I1oTGa5zH4DSRCNo0L8YVqqbPo3NkNXl6KRI25YrBdeoLKYh7domMnnR32Tv0YsWP0IlgUEndZXlRpH0dq0dZ0/W0LsYgqh7L+0TMCmPgr7aI0dHPZcpGYXEyYHx6YMqASJk8dD0dNo5Ut/nwTgQKmo6BVo+eDk+qa1TCpXuiPqvoTCSP06bMy9LdpyiFa+nZ+egk3vhqfC0ofl+VxirE49mPGNB86MkjzEUiEEvtkdGj5vAYbbh77noSawK6ioMYrS5zH7FYzMk5O8caHIroGnHTIiJs3diTQuf6GonldnmqYyaEdhwRa97SMHXk7wOpsmhM3765e/v1O0p4zuvYc7NN8WrJNVLvlzZNIlb+chKl/ZIKcfSuadW+8CYgjFKxYPi9uHz117S/0R/pOIip6AdaKL6bFn6P07Lo0c/wuCx2jgjzkjL/6as4y8O/kJIdACaoC8Rii0W5QrzNSFoWizwbH6ph9+NErs2L+0ue7TPSWlB+/uXH5IdpY7VDheZjF4GcUP1pUV/RCZqMFmh2mYV2bre0OhcEPxEqjgyfY17xXlVONIpxIDPqb+OCIztnPpQQKYN3+LH086Z3KkrYycg3o+1EtDGxafo2rTp+PSIWIV/liJsmRrEEa4hGxdYBczqTYC0JrzLYRW3p9HNCiBiaNbdnOgos2N7wS9CNe1v4yeMjkpb97nVxRsQV6wRV1iyPvJ7zrkn77IbcUlqoML01vfN+Wa1G4TY60w7WuJn5Mr7Tk0Xw3rRk/zJJM7B5ps13oD4PT19snC0+eE/69EyHip9nsM2a+2XW93+7y+3nKb09rjl6CjoQIy5bGg7EbCz+yJe2tN9rrKRXSSymGoAf//Tz/d37f7t7BzLXqeCHNBwQlOVWrE6SS3t/V17v3onmYl3QaEYs7z+PPls9zTKnZ3rrT4W6b8rchLKTQ0ODrlQFC5eqPf8Ezkbx4GJoPs760zd3by5v39y9y8t3b0RX4+uj6TFIPXhgps7ASZqVDbbaGRRP5Tz1QhQ5YqJpPA1tWqKrnFExdfZZDJ0jKprOrBzQVQpMNI1sWwZd5ASKp5Lyi8iXuEIXXDytZUpxu6zNm75u8SXv4PGUN2NYGFy9AhRNJYlQqwhyrSL8/DC+zBkWTemlazP8ejWjoum8NlmL31DNqIg6c3x3TqCoKhP+AGcMqTMymt7bJUYpnVERdT7FkPmEqzK/w69JAhNPYxphXDKB4qmcg+Dj6pxh0ZSyewtZWqFLlXDRtBZ0jIMudAJFVfl0SvFHeDIwulp2MDivIkxGVQR46gk/toQvesHF0xqlryrQ+6oiRl9VYPdVZZoXp/oJXaiEi6e1SW+nGEsoMjCe2g6/gxWYaBqbrMIfok6geCpb/OZUYGJqTLr8WqVFFK0yNprmLmvZTmQzxoVElbyGxlNMYrVXK2Q8vRHWUjrktZSODjDny2WIMmdYTKUxFqYXWDSlcUZT+GOpIc5gasAfTcVZ8MNf73s8p/gldAJFU8luWKCrnEBDVZbiXguWQBkvdKt7u3uOI1EFG2WnG/Sp5SPbn/dhU9gBKNeTHHmVAU9w7E7W93WZA+rgqIsHeVtZQRyvuPaYA1qnNaUw8ePLyi7vkrq7kyJIu5Cr7L2U5BIUeRIRZNgdHlqkAV3gSpUVy9NX9ZkkWZF2XX4Rdy6c3aWG8PVYsCAthp+HSHXO06oSj+W6OGZt6cs+AOb0W94BPF033/90Zt7Y+img+UYgA5pNKzVb+dYEr7YirIXgF4bywrk1WNn5MreAYcSWtQUPFVS3r2lj5Uo5G3ly9mk/ONfcxcrMChsz7A6Ltr79965nsp4mFOlioU419hF6NjdVViyEdszRT1vboHbMkXux8q/X7D89eXJO99bWs86xbbmi6FzZZbuQFsaVdjIKquuuQ/9TXfdFza6ouA7/11e1fVqSNYLdX4vW49r0uEeK0WCmTe6TzFUcJ8dU5sedtUeRXEeSkiLt+yuRUTwUyXerpYyz9o8bSXoYTy/xJ8vYuN1Zys46NJ+8FKysg0tKk7YdZExoLCgLCFrJDRMkoXgqaklH+gR2HFchZW0eo6XikYi9btdc6HT15nSzRp1f7OlHjuXUzDDdR252VCM5LLlZhblknVkYtCQ5rALu1fM3SJw1y5YvOrCgdd7netgqPqBfEYbOa5Se3oUoZLED7GVYpPa4sp2Hs0pA76LMpyo7SBbRxl48TDpNqAFiNahJd4fuVgkXTTCmSORsR89x9MyOkM9uWezU5Hrubzi0I565NS17KQHxSjqiukBhOaYyBRha0fEbnq1isH6eTm4dBpaOTOGVdGU6VVIlXlAJWCPO70QFyTShhtSjNSp/HBrTnRNgDH+Cq5aTP0Or/xr2/Ez/ND5ii6dVAkWUugpIjCt4Bx27AxxDJYaEWXBrpUC1y9enY2KU9QsjwMIEeSYXTIUCDksdSunUeNK9bDorTngIGP+GwKpcJnjJOBZuQ01QPdlGoPJt6IXPxCDPSoGY724jP7BqTJVsnIOoUMDFqTvIWpXgcdqpWKrj+ZoKYuGL7+I5XGaI29ZGS4JE8PlOUk4eQZ7776dDnm5Ut7uutc0mEHwj0kGk1yVI0NQKU+UEiCcRpe1SavVqvCIuY2QN9AAR9gp94zAEpB/PK4lN6HSPB4y+nQtv/tk4VASL2uGrQdiGSpgiKnvrkAFCxYxPFHhLWcxDheyih7qLWUOEraNSOOgBsL2arX2ob8Qtio5kdXVOA7JLBYQtjl32QBM4gQWXLhGs3r9sSQBf/A5K4zD8ZOmctiIa11Gl0tefSPrAjhX1NXv+wWF0tJaiwgmt0z5acgS/rBoEXw2OZ+SNUrxzZmMeLGR+qQp2fF8naAcTLIxWeH85wjhYBB/1eKuYrINlgAKo6VQ4x0nTZQh73i8gSybzYCHz8Mtbi4wQLEcMwbzFLPbhrUoLOoCpbVVahxOYGiFjazAPHxyPD6w7oD0MVnO3DMBCW7wVUrC85Ricv7A1RniZggUc0JYpl8gCESf94kHDz3p4YXp40m2jfa18GhNvsUKqrMDisSpxZE1QCKoa0uYNnVK6nKEwalsDfulziVU+g2vhxgGiTd1iYZUZHFnuoVK1qkBhMkGinINjQsoxjrQ1IKpC1+kJUKfbtCWk1vEiDrvcBal4Y/yMpyvkAQqNT0ZF21q4Bo7tlZEZxS1SprKTreH+EdrU5WZH8WUMJtio9LOOJJbnmV1OK0vGm65xi/cP0jnOsp1bLO6DTYsvg33mcia/Kf15CpqsAF7CZKupiG2RQjqs1Vvbrof1beJwbmPka0z3c6sKmQbML72mrnLfzweimm6R0PIoSNYe6jM3HbxwtEPTh7Ufrvm+vXpueJgNmE1jdIuKOj55zNt+cKlDOyfw3EpZDAMlatSzk9sqsRMXmi4dZuy2IbCPyXE9MTWV3q4A5xc8TIhNrRn7c7ck4jnqzzMAmdgdnCwsZt9KCEH5Pz3LPe5kBOtZcFBUdZ/qJO/L5FsEZSusL31oMecvvNGY0j21mhJC0HAiWEqOpWVbyoJ9g7R/pyhi4b5agyHXpnDPOauL2JiPx5vZFOczNOdOZ/8Wpbx5Cj37d0o7cmgJpclIuTw17y5EBeSt6pyn14qWE5e7QRs9awhvJaQ8kfbQ3BzOtm2ErBC8dVzSoei7152niMXcW0GbVufaYbyxUbCYeysYj0+PuN46tiBfWje+j7uSAxslg+dGFHibLfmMt9rc/LigvORlOjHiV7167uQDqUHw9cMk5bjGeklvQHsogyOc4oxsPMD+3z2sSOCiQNo5jBw3goWtf/84nxo5ENK0tb8SJZK/rqHvXQ4mbsXM5t4KnA7fbStS4Nk7cinv75Iyz1qHXfaNhg1GwAjh7unpwIPAHc7k4rA9vBWkAApQVeSnJKurS+4wy9kpWoN4qwlscoK45zWk7sCz3FuICshbVUEAT0BphAhbb25e5g+uR5s3IrYggWocT1YoxYSf/g5rUcLbkonh4HrJf6NEgRM67veVspj7K5iaRH8RMoL/QgjGKDpIAZ+8HFYXRw/j1fGDf7tmA8VUiykydFFrYeD7DNd2DDx8q+sH/5YIgPvFLHXx96M+z/bFRoTPbJ4bTkv0CrwvbWJvc4FHiRtdsC92Lu+CRSxp4w2Oz3tQZ60BXs7WdlMx26OFNEBrtCmCGY8n3T6O7wuh6tUxBO1cbCigL4gYdRtQEf3dkj5tr8RhyRvkZBkW0bPw9gHk0tDOc5Popq4LnLy3ICNrjiAWvZRe8RuCBfRL7yWRKoHoI6PWAeFUVIkSKGYrTdsoUvFRaVZXfVs7TGqUqmEEscta09Ys5bCRhgYDJcTl7I5JUUJdegI8iaNx8gSzbcv38P9wUQ53afEuibOTNkVSBv58gcn8RtBN/WkMFPVyA2ift2QB+ZyskuI8VFhZjwcfxGtbeuTwOHprZFI6XOOBCxawL1lzu4KQJinqusHO2BAHLap2ToqRnY7HFZ30+pxhhKl2vdXhJtvniodGd76BbtqczjgdojBYlBvw/68LP7muC54eFOPLHVbICFhV6BHlIR2uRHSfAuwzL7KxKUOaw3po7MFB29cut2aVGcTEeyzFiGSPR8uojOMO50UvrXB2t7el5BRsEYJmpQzogbQVcVjdUIlZMMKmnhIWuO6t9exAgv3Db7O6xpjU5RhOtMl8Dxjmrg3SF7/SM1cA52RPSycyAlYVChITqcQGOyhGsfDtvuiYjgdD+jz7Qwu/Szsw2SyPPcsoIXm9II2D8eeu7R0OwZukbQARVZ4GXJEzHqJGxDxe4wU1+WtQl4q9kaeC+tJbfKnW+CRcNGprFKTcCBC0hfnMDexwJkUKe/UJvXEdueGVbvx+qnCLdUgzMKIkaVs+flMm1yx7/SFEzgboS69iwofg0iySLKrWYv1Shdj1WeIf3n/46YPro8Q/eD+n/VOVFdQpAVf9eHyFrC4b2F4HT9+RCT4K7uMewv8IP4d6JG0H2rjUipEQ/A8L/sa3CskTYPyvELI2D/QIq9z+3hDW/hooZJKV9/d+GmRr/4PQzcBbOsA9X4WGlfVn7v9+/uUvH+4+a22vO8DZ3NGLXOymOAlz76ysOzpWhQTJVEmQjGN3dR/qobU+MG9OJ4s9nENiyMpJHXmPa/Mvtb87t/mjdaqsiMt3Gj7TQV9Oza762zNlTNuRWywB+CTzL32wtYi11rVVWudAe5L5Z241WdDZz1NgYNGWhf/Yx1NRcYmt/DlLCSw0sJxAUT5cAgF/jraJlOf20blpKlO7VYyiNhLbSxpP1XH8egwsMRt+aSVt6567pMuvVVoE79GNSZ7Q7IV35TNeemcpxz3Wy23Uiaxz178YfuZ22eE4Fm7DRbL6DDi8MXpOHHXiV4gnuy+gQ5sv8H6G5mbFD211Vka88dnBfGltkCHRwMKzTjQrQzuYz1yWqkdgNBJcbzJa9gwrC+UDdSaz4T7cGntPJxmQF3swK/wJY1Xa/Z4nVqjI0uwGbgnXGmbTMAWgnSIVf2gohQkkuRRpd/PWsJiHKYG9/aESEfzSB0epT7+SzLMqLrZhGpr06lkYJ8swfuDTWioB4c9qcZihz+Fj0rWC2fSLDgUsN93ieHtS5NUDZDtbSjUbPpihwvoEHy3BrKJJ9fLDbIrVHnqpWJkjtIdeIoJfy5LbNC8Fiy1Ce+ilYLLEaI28BMymsVujMaBTYIMEDS0lpXQ0OW7MP/f5iO5znT4TzNDCIj7n5UUy/aIngJNOYCmZksg6aMn0y13wLPKT64IntMjs4rlBT9lxVSLyrNtJuj1lVg6OhMLCj44405EQOthWw4rPaZNhR1icy9SRcDLxIyw71wIjLPzomhbU9Ul0wsKPrnUuLm1IcRlftnVkXIz8SMFdhMTp1jfsKIcubUGjOIlytvGjhMWAWjHCwjz5PhIU1kYDujuWkjHE5mLj2Ubf8saRcTLx7xQc+UYLbzp+2i0FrbSsWSVDD3J2ltc9vWsrvzSnXUda1/QuRn6kpwG0jLIqufDVk32+AuOPrvPUKd6oostIy8tQudZQycqPFnzEckXreKxS5eIWtDa3cnAL365TEros02+IXRfp1SNIN14SUk9hZzlWfE6nONQjSDfCycR/BOnGJyy86fwa+7Wh//DVjVVY+A9fHduhkLJKR6LZBbRgIzEuRkFjZmdSYRRC6tkO7Y1DBu5u3G4rHpqBuxvlbBMwcHdjhAUnRV6qWR7Ndl2v8ZwLdIW4yQhoUhZx82Oui6nXuJUDwDonNXlALyUQxEVTT/7FOlQBuDsxCQnrWqQX2z29okTAUOLrHROQf44B20x1TgEbT89r6n6rtnJtsi5vSMmant9OHY81m2qiJ7/bhXFTvnoKAK5mIXcYHcmo0t52cVYVjofVhLoile8xwyIpT+TcF13SDU1TtzAcDZrzXp8mH/NZVJplpCBjUHvIxdLRj0fZMcd9GqfNQRMTQkyyCbouq7xhYbArULgR/zRsiDDCqnXpC+SBiuVFQxRixGGdEgi5gQ500RT7ZwFGiPBHfZ21z00P6CRcha6xkYpfJLFb8H+4YLZzscCrklPkngU4MA9TQhtWyAFiJ4kSaqC+LCsj6JNQQ/WVaRZDoAQbWkuJCE9Y4vZu4xtGG+xQrbf0bQRvyrDhCu++/iaORgk4XOXXb+/iqJSAA1Veo9TtK1rdJtmvTfpAImjcIAfq7G8tSc95dY2gdIeNOr5B7xjX2LjjG2yxW3Aczz6mxQB7OtHdswt2lLFY0JH6USEoIIIZCOfFByambytQRHFNRizpWQ2IJ1Skwj0ygIPVumndgONKhj8a4CUa8eWAPKEDJbF9n5xJQ6ozqbKchMxEFeINJDhJEJ45DXnR83Cmz/gp0HCgJoCCyuPWSEnYs6AngrZcOfxpON9ErFlQE5HSwUUs6RM2qmA6L4ulV0CjyuVxFfqhBVyC8RO9IkCVnvHF/1i6F3Qc0X2bVl2TtpQ7cgKMTNEScwPdaAtPys356ptjQqK0OAaeaAmJ0RLpafCTEbn/MlPhJKdu0r8PUbsGJQOq+MjZoGWJkQORWlwdSYwkRGme1BT/cPspqumZ/zqH5Cp5PWYHH3H2hyreQII7774QPuBDlq8hwJ9tYDt9gx1jDBxJ8oIec2IaSfyeJeYSQcRE4G6g7WaUkZQLaNQukF2qYZmJ3zCqCFCl989NhPZ8C44/CI/nci0LfiLiOF/J8OXte0w78J9/0yNZtHiPYGeE+ZmdFWb4FtmCxwOsxBA6A6OqDZzbmPQizmhkWMJeem9A7704S5awUTUHLXOZBKOta8mgSHN3k+4IE/ct/C2tzkUesFVq0y8ToKoPX103ScddWpeR074nXR+v0GzwcXr8CbxM8+JUP6EJ14H/wy2PyH2l72Bocc70nNoKE7UUnsklrwIGbgatMjaq5rChpkkx3iB/NxSJIXcCxq3bwUtLW8ladFQv82jUVVqMpxViuHvHgOv3CT6O32V03DHxjWQP4NCDHm7fEuCqj6g7kuKw5UijYry1SNU8IYZkCRt/DhJD8M05zDZALdJqr0l3hKVe7RQhln6ZINIcJIb0FXq0OUgM5Rv8OHOQKN2lBP7lLTdSqeOJ9c+/3DjqSLo7//3yKTHTHHYF+Q83AcyDbyrM/piKJepdisW72AIT50cxX+5WQlv3dVYXX0q1ybeKkjal/k/DDqOvIZfj9AYqhAI1wSEd5tYkQsOCcahizRiyhQXLAKSKrPIIvnYNyxdYydnpFZIldWeNJ/Ui9XvSkowvBrd9HdZHzoDSNRkNxT9gnzmnJaRXWly0nGeSYFEOYKlcHkfyluLzVTnkMD68SXGN4dPS8XhiD+2vsXZ4olGT9wkTYM9pnrbjJHZ6dFEyd8hFpYSkvABCNxplTBDBUsbgxglp25qtdp0hS8ZmZWrEYKHADQOzNp/jJ2o58AV2syK/pfSNqJByHVyoQ0s0SnFGLssxCnJ4KUYqwijl16vwhgwOp8FtyLjwRN0QvlzCk06hnF03JeFIjY8boMCBDY4mP0EIA1BCyLdv7t5+/Q4rexZEf48sGEc1LEaeIQsNUhmekZ/K0xD8KvrkbA7m7xVuftyBYWQaijJfWeG59Nun9BGtIeRg/r7g5scdGEYuoSjzlYUQqTE/k09p8YCVUROev0cmhKMKEiPHECUG6Huh1S72WFDIYIZc2vs7j8Khgnm63j05QxlLG0td0jUkyy+QpwK2g0xqfeTKjrO+oxbatejpC2AE1TiS3ZuTlynE6dDXV+K2KrOBoJ7jPmpJQdIuuF+a4Mqh6PN5RXzKj3fJNcsmqtepYwaL1B43ko+OnF9cU9QUwzUPykSefHaUcYw3lORV0tyefYaCmubJfWagLB3SrEuc7Uruv33/7t9/sy/rb7sc7rOjJuFzA/DuaKREabr2s5OXTpuJGTWJ7aUjFbvQVz+8dBqN1KiJlEvK79+/dNmcGGMXzZdJmYE4esF8mRSamGMVy3dvXrpYzoyRi+ULpcxAHLtYvlAKTczRWsuxPXaePYZ35VizEGuHGj1tJuYX6sqjp9FIHbcrf9GyOTG+SFf+OUpmlARqO9TPUi6jJHHXsb5ksZwZX6Qr/wzFMk4CtR3q5yiW3kl0Xsgy+oQKTupH0rb5GXLs1s0RWpKX3AXIavKUdz2pMp+VsdAjVIYskIT5Ol6CmI4VbFBRKpCEeWg+lXHUTsjYin1rt8W3L1lzN4Xw5nS21wjltwUCLCrnvCU82FJaHJo2r9nhT4yyQ9MvNgkgbH7lyZo4KiJeWgR4ROkIlUIv3b/j9qwhSBXL44SUEc/ntBQwD9kZI4Titzq8pMCPVAIp+iGrB3YZ33vQAU3GiiheejBqlDE3vCsVKDcKlCbBmA/FyzcMmnopTTgG94sbQK+K82OYpXul+6gmQywjdPj+W349ETbvnKmS7BQxTSbKSKXf9+xgSD7Fq8vjSPVlE7Xj/LI7//Ap5TLfxT93u4FNuj7NHhLyCLrYaJueKw7kWvjCAy0oWdiKQEcKOmB/kUSt6V5y9aFJafWoRDT0L/c0B3dYkybZ0D6SLnn75nxyv44icmadZMVqmI4MdbFvQ3L3kim6800RztoeE7LIHU9R+fbZm6TroAObicV12GI3qAg6d8n//9r7Eia5bSXNvzKheLExE2M26z6845lot0pyr/va7pI99mqDwWahquhmkXwkqw9N+L8PAN43gUy21J7ncEiqKvLLD4lEInElcIyqDhpJs+GpJ3TGVdDItoBLFo9nqe33ZBid5GCXpSeT6STnNbvnDBvniSc8ivMEmgFqRFeGhy+2lDHVDjJRTaUsARzOSZTq6xlNYOJaSWAimEVgqlWoqBVPIeE1XUX0q9WlT/5+ZMNZkdsL2hWVoMLrNYFS6yV8HdXp7I4+8xFVcREmXG0RkFqHjtksYlhw02gk/S2nQamxlYPebZ612sgOR5GzVXUpQ47PmkfYl12rh5JW41fVahh4IpNjh9SNzXR6yR2QI2va4eKqQj3NUUh95Tc7MS0cSGI9vtLpBqlUcu4liFBlQ+6PHbKxVohOX5UgwN439qbV4Zq4VHTuJVmhzoFGV+Ji09ckBW8psLIn+qZLYue88MKrkgTkZIPFurrxQGRLXnpZlsS+Q2rqguh954zTFQKFErnEIoVytxSFsrOFom4k95JkSUMMmwRPjtf5ZHZc4tLLEiR8Q++Q2TiVGz8vIerouuK+OvcSyFd3vYq1yll3vWdVNhFc/Q/C+1AqdpocSeA4wV40o9z9TmBLIzBNZEUqwVi8xnvKttnfdHdBVFo1fj9JB1kH2HdyJbEMkK2aqLfgBh3EyRPLUH2XvmtKwjojPNKIBb42tjNkN3NU7PP1AvKsHMZj4PYQSHMTxJY9/l8voJgWIGZff+y/wTrZOJdXtErrSU0VnD6RSQaQlQTZKfFZ1LR7gfgGdzb0ONa/3/E9BHI9ivX10xZr94EReFbLJH2VpfNyq1acnLgIBJ9pygBqge4/WCRo2D8pSDGH+OayJ9OSaJbVepNRo06iqzuKSGj1ZuiWdU9lNQx7uvEro6FxtEz7wdJfmgaiAhxzaPgc2eV6OMosQ6KxDUfoODQzWGj89kbDWo4AtwgHzosCaVEEG958TWMFGMM6REwdhvcqIbWbAt5reuNvLxgHbHerQcQLlctBcuryhKLkxBDSGJlvMcsExTlk0P7hv1gwW1PLbNEMYcslu3sAy5RlAtQGc0sdBiMpGQlyNakMoBAUxpjfxJENiRixu+LkXHZGcXnvHWN+2/vgazTNup4wzPj2jZ74RHaIFlZeWtii7cfQf23j56WEWH9GgYU2EEPjHkjKxEeh2H7Y5/F7KwI0vO1QClC824cxGy7UmJHdS109ZWwAycXQosduJg+OMMVZPYpyjZ64R8g9EoeHNI3sgdFNN90jteoK3UO9EsKMOHYvVafMjDNL6g1RsWWXmZXylx9m1VSmbxEikly9GQw9AGTVxCmCHARHyLasBPJb6Ch7i/rSkkKaUai8cutJkL/t0c83fj1geApedDcHYOGNVqR13IhMidVmC2jZ2ZVcD8KfVkOzisSrFSjSe2x3btsms0Yq2ddBHJwHYitdF6ZqqRRQIIyosOcXJdAb05a0ESqAQPj4pv0ApZPHgOzLjuzvQA6O96IdfX0nS6seTJ5fdImqLKPM69IcQmQlxlKis1iSlBrQsBmC3EErpjRbnfjK4dBw53Yjr8zb8lblHD2DKJ5zDKRtvQAhX3eWBaun7PsIfiA8nWqyFFJ2U+I0kW4tBwfnCCWFpKmOOxdbFCS0abGt7linCa+yGEWaUcs5jkYeQsc5WvShW9zsAtohNe3Q7qiXEhqGDR2DF814MaRDgTooaW4H4gNCgMzb8gy6nR9o5iFzjKCBTeNxkQ5MBM6OVLKISqKw3fw6y/opyaYSR96OGbZi2lvZzjwPIM0j8I5+oBiE9TKSTIoQ0FhsQx5NGh9wIbAIrIgkzczTnxRY6y4gIPg/T7c3zkHT3Q57slr8Xx5Kmhu/ms2Tbe2Zt+U9jm4oHbckVnuc7PvSLO4dJ7AcXbYbz74uH0fcPxDF8F7cwFGIvTNtWcOtBoK2cZ41TrGcHRsX7aQjrwY0eRva7qgpyhpQ8jJoVCPfqDNvy9svO4tt70DzLCUMjJh0s/GoC9UgvWYtGMYYwnrUDMeDx6NZIIxI+YV+ZRp8X6vps/xKtGbgQXMdKgLjMLVkfIkr0weYbjUkAtcvG0eDzrXVgmHUvvWg2WTnBCYk+m3Ew6jxqNBJuiYmhhjwoWcTcI+8tYD4gfZIjMDx4CscnaUg2XO4eHD0cCymEhGJKbZ112AisQ2r79CYoVeAaB4OGJNFOx1Aa3I1SH0fKo6bh/ySZN2Uve0oj/rR6rCvK6ePGKd2KSCLi766gsu1D4qK5CR5q15RZsvrwHmNKf7R7bYPU4x5CRy88KdEIa5i6Ma+4Q6QZr71aIhjU4USargsoJlhAxwmxeFs/DDEJpoHxaQ7WvRANw+KSXfj68oj8cztCzbnCmRs4r65s/ugncPtSdu92Ektft+RwNajf7NpevlQgK2Sk6arSyq1kQhWM+9DI7IwM42x122biHaVKaE6MGl2HEkhzwGxN2QjYzspuRos1PlFBsqnBWVJtoECVoE8x94p4fw7n7eTpViJ1Hdri5NkQRJxHEzDc6BJHXThEUuS34vLV3XhTSDiZ06bdh5oFtnpRsOdh82FqEeDuqAQj4fVW91g02jCjT1h2QLZf+KtcGzw+mljiufmdY8O2gPA3ZwN2zSVBF158nSWLk+wumI18d3uCZjaRQrKtSzxZtoeC9KAj1WEdJNpj+VoE4JSmGTuMRGRySeDUpI2CX0VA7U6mvFxilC5Sbi3AglIQyletD21r/bSCI9SgLqpnZ4KJCQOxwAzO3f7KlW7DJSi5Nan+ypLByG9FgbZT3cSg+zpwmCxdxfXIAanQMluvf6qp11Gf0XBrZYWCSjFiDbj9RfVtAjoqRCoFdEIj1KA0qba/ppHZ1G9Fwy1jjoKQnbL6Y7R/n1zmyyUovGzE/05g0b4XgqAWhkN4JiRc3a/ds9Rc7solIJFm5r7qpdGeJQCZPat9+eaOwjpsTCoNdIqAqUg2SMXfZWkXUafRUG2sC5ScCKy+MxSX9XSIgBnPBmdQOjLbTXj91UE7NFwiwTkiCs9o9h/xNUm6zWKhj04FpCG4wjio0S9OYJmAch1lD0u0b8BtkvDCTvDwzK9hZpN8D0VALnZtAgQzoqOlXMsON7LZ1rusqgS60N7IvoDX6IGaZQD1C2p1MjqZSa153I1CsGefozFKEyMglWWVvyvZfSmdDrU6q0dFC/p9zS+t0l8239GfRRObUZGnCoIRYT3iGrReAuVfQU07jJ0D9pvw+6hAMg10Aree9v7Ju4oKuy1SfzQhmxlNcyyL7bAAq84ye9HQeTcgAqnHG4FQmRbDQi9PiZpF3HPCiRaCwgl2hLhQGl3gwcWIt4pgmUVdXhAmm1noKC0u+JDTSa74QOLeyMokHAWzldcPTD2EKo1cFCtVoSxUJ3WQwLJltcwsTi3IwOpx0vkWB6uDg9IM1zAwyJZjQakmN9dhGUAzahQyvEUMJZiawFxuorcoidyN9GIDaQfL3NiqbkOD+oLkqUZLN3WI6LFaZnpcPworQEcqutk9htN17WIaLrO7GTB13UDOLAA2TVtLG03YaI0w7jnx22KdahoJpJb+cA3kkZ4YCFya+xYam8EhRoKT9aGF7pVw2GNNpKFF8QhRwUmmiUXlgLQTLgaFxogRetcaEFRDV4vB0whhyJ3Ilf3lOraVEB3ROxctRoDkG6Jw0lfE5EyEr8lAlINIQlA0gLXVx7Ii69sj5YluAgWfShBSFdCHkmsAirJAC0il4fMov0J8TT6UCCcJjb+0AYpTzY7bRUOWY/uRhe+aiH+0ATXk0albK8Vsu/2F6anw7jSKJ/oTkwb4btqAxhCHrocpqYbBo0HUXlmMDHoxuuYMuv7ZaIlNASKxN64Du3pcSiW0eQz/8jcJBURQrg/KryIiqPKcSgAYKTo5cEjDcZMW3i1ulRTJTCgpsRvSsjpCXpRQl1zpgVkuenA6qpH7d+7eyjX1fE5AC2aA5BJhcKIqG148pnLw9lCXSoXGadWRkAgw/ZxSHSFOTopBlZ2aWFrztUcpk/KWQGMVgkKofoAlxIWKhHtYsIEEsTnVTLTCm5UFcvhLhVwFLdstiAjGLg3GmsU2tCi7KYotOtBERhvPX3H0iqHXRUG3RrE3ucVLLF0V6VJMUDrp6+rVRB9l/mgi2zAq3Qt4nee0TfU3Lt9l5IN6mlDhSQzE550qrYSjiKoroh9/GWK8fUmSLs9VMrldjStjdw9yjtDzE7LQW1AnpXDeAzPSJes4bNknPe6b8rvNC+aKbGI7tOAida2RaLIBPOycsu8L7M/0TtaI68+ldaEmqpTLeOplcVQa2VL7rR+pQvNa6rKNlw28R1tjnhLBpBnDqv8PFZ9xZdlvslKj+xXaBnoq9d3Qhqlne/c1uYdSnrLFczM1QAcIPp6tRwxR6nqCKu1vjMy32SlM/5UL2/Vl2eow515BqzZmxekvsmKj+yXFYUH2m+p5ovcUVp8gtba5nNy33Lle6NRfI/MG6z+DHsUA8jgtZpAQfabNALmyXLr/m+0D6gqA7wzqEJt7hXqeLxJ44iPdGXK9JbsooI+io/IArY6iaL0N2kIzLLZ3OwbdQ4Z6nCfkAFrdgUFqW+y4iMjFlsX+Op1nrJGae9sZaKtmUeyvu1K/jbmwHW32+wR0m1dpUuIjjvThs+Bh1O4rmfa8mFz3eItv3qLQ3deRqRKzVzvFBZSzXBUa+Gxs7Nl0Lsu8kiSfxsJPsK9KDjLZhqx97ptkI0WrYhJ2kfISW0ARTlBqtFuUEukagK35DXRrQJFO4biv/gBOWiCm5Aq6TaA4miXTz9ovkWIi6LYAh4mSS9wfE3f6G4gttG5nW4Fck/GIOfNWowB67C2RqVmWgXP4gRj3IzbB+l4t3UPvLPQONSLdofBuQITSJbiGdsdUwaMYB6n13sPC90n7ZHExx7FE0ZbvkTDdxZJ6oHRUIs439zxPHIYzQbyu5miFGoKDQc2FvF8ZecRtlPceSIeu7yUeHpANkLOmzNSuwNL78bjgkQ3D6cMi69L8+CTgDyrhdCu6pRJGQBwoCNUu+HYdEgr1h/kKy6DIL9fknimboVnXNlNnhJ0qiCgFpMkqBWnU4EArqukibB7sgE1VsLBYxaeXMfgliLhsYtT+KD6q0pQRI3y1BborGtg8XhH82DoxOtw8ZgnaepQeVej4rHOpbdAZV6PjMf+i8Dx7gaqX4BHvOsaNwa3DBS+rWIQzGIh1myyJwKlgnNoqPaH22hKgH3v4n+mwaF8eP8chpYip1NY4dlrav5d6TphMEImkgh/jUMSgmPN8vDriy++MbYYlVIMJdaEkKr4EJW9rpYwgLMIHI/YxwOET/w+Bhc+LleYADMwBU5mV9CqgHrN6Y3YH0PNRqqP4KqI31QluwaEBZIjizrEL+go+fsQR8i5cRXEb6pZCGgK1RhKuELKbL7lg061P9f/IOR25RZwywevXgKiJa284/pzPnsrRcj4iToj41UYLWHmhaplhE4dWiONOuvqTqPVuGQNoKYmgr3pbTRX91qdXsUGAELYHLnc9oEH4tkE1L+btmEdN+AjkHrgHMz6E6O86jJaUuNiq2EJ1IiGmuJAfVW48Fs/3dSZUhYJSGpDXI8YLLIOc6aYbEmkxeC7UKzHhUYmbG1M21ENuAg0i2hAch+omNv19R2cWBYJnKjZr5+U7kwoRkFKzX5/3G4bUr11plXGgxJ0jxoPGvidIQgES3gIBP0Xn82HazTYv2+KfoRYVoAiUI1u10PimEUDkmMHChqTUXYmlkWCkvKcP9iVEwikMkhAUn8/kiOCmhIY8L07B3eP4DpSHIxrPbSDTrtlhIorogHJ3TG4SyRuBTCw3jyiH9C6ghIcNHW27tdvkunMKkaBkjEPKE40xXnNyYfYQ8I3BF+Sw6UulGGlQal7orvauHmQ2aTUuFhqxEpNAXvfMlujn49nZ1hnCE5vL7Wzy/FYu1r/Djw6UDzowrItsXkw2YNODXXKzwnCa5TqUc0qQE05q7EIuT3dLdx1//AK9CMp6CXIxmja40jrvzQ1EnupG94py/vgzrWTyOnNwvovQySlv3po2S+MXBvyG4lzZZHz8qCXsXqWO9MyDce+0AGXfFdmyzpgnksLTBo88x2PWnQ1IoL/yRQ9Orh2UKsF/WVOplUqN5l3lFZpFkF+S2F20k6aShFFmg6fGZOmEb8tLT4cVkvLT16X33GaG3dJEynByCfupkMugGEkr8sTCAdZ8gyS93tPwn3wTbFUuMVegR+8By8qMxqa448kdMbfVUMeag7oNUe45ziLVnGpeBHEQ5tQFxEXtQgGnIJI4A6u07BpRphdAvfNrr7X1PnhnmwCS3KdVDzJQ/keCT/QaRfGvEX3dhORjq/bVEsw8l5vTx34pum4bCuZHIQ0EdfSA3a3sDyPLAKYBt8UAOeSwMgT8nUolwyC/E1UlrmzD00nJ1t55CCkidzbLDe/PIv0fXkKuk9mk+TiPACXMpA8KarcIzs76wms+pQI5UGgZBA0VAaCkjo4GzCfCAOBiubpTxh0YhwkSlTjj7pvPsJtqQpQnqTl0AG8Ybp7OoJHsK46OPmN9XvCEL0XN3C0llz/7b18NZg8ubCgbOIVQCoPAjqCIDITWA6BxOf2moIxzTy4AFOqxsKiBrb0ejx5ioHA8m+JTwC73jHMdQPXSxlHfoLLcNO7dHULEChVIQFpQZ15EUWejh14jvuiuU7Dibd2OgUU+WnAg9NwHVsrj+R1+QuYKLSvyzNI34dQgHUJGQB5Eq7flkymnUcOA0SFeJ4DcG85CBARNrQW2WdTxSTFAFEJvKbMBJ2YJBDyw2F9w4I2eRoZAHkSDwhdTwEEQgbWfDMAABJPntlwuXIHEgkAeKoEo3KqoKSJeRSN9uPanlhiu2qLtCqAQKTgiiqiyC9I+VaUwRCspUooEDHDMkFTX3kMGBU+/vKPtLH4CPXXCAkiyq4UhPGKEUA0KOhwjBABV2MhUHsgL0Bbz+PIH0CfDpYIFlWCAfnzePYjbDygOfASFHAiBbB8k7yPMpcD5JGAIFQURg0hUdF0GvaiWEwMhGLIQNOphMIgtvGoS/PSXZm2w7KIBqaBwrURHYO+bzlBtKfrgOUpKjBRqAaORyFxKKZYGNSIAfAmZRwMStvtZo/CKQbCILXXfRxSMRAGKXZdLganCAeDkqs/4Nh5DIRBig5ZUDhFOCguAckboOmId3mg0XMBCLHvxKCVQqEQAy26VwBhkQJPqdbj9RBzoNCswOw3POqBdB4dq2PHIEq6Zxtro8T7YwxOMRBax45BKgbCIAWfvKgBQyEHWT8r42AFQhiUIhy0QAiDUwyEEgjp9sY5ADc+1ONhxWoo1IBrpPkgC4ORj1aNxWEqCrsyJubQF4ViitX3gQvx5FagbecNutRFstvEyktysUSfdZSUNrpnSrTNEpcIBUrGt4cIZCIUBDKSy6FVjCQWRitphbuN4ZxSHCghvkMUgVCCAyWU2Q+KQKuABiXHrmGk4dtW4DB7LbUcFjRFHv3LsjCcQRYJSspAMKwIBEplr9P/RwMEPhkkFFKuY9WnxRWkFWOBifFNz5Jbp8vU8mhQckiuAc0pGFJjnRId4ZFONRnn4OqBMjp5RqCUwwITY/Wv6Zs/jn6gWWSnGy/xYiMC00bwPqhvPTrMkto22ol8Fh6VPoveOXgoCJt+BTw6ff/IJuhI0GMRKkSgFsP3JYb7zbQjSFSabB8JNs8YE4coZgtEa26Zc8EY3PJwUHqBp228e4x+PYMEJMV3CsIZJTBgOggj/A3KCH+zR4ihIxAgFWLILBYUucQocDIYLT+BAdP5Q256uUzoD/Hp5RpKEstNZTqCa03VVMKjQgh0UiAoJbnDJSVC4gdMKunsMIbKO5Sh8v5hs4VziVGgZOioCKm7ykEBaVkHhA4iAgFSidDQRutlPChBiU0sJVKC+1dqiEwxmEwxqJCD471EKbs03bIchBmEGlAgVZsOgnzHeCAya8xFigUwKDWTDiceJFI3lGilQEBKjolg7REIkIpLELqUCARKReKsYIkJRjJw98HwhwL5werJxDgIhBC8UgKDQGeOQ2eOQSfOJgVnlEFCIoU0vi/BYdFjDBDpxXBQeo71MhwPMGw+gwQl5ZmPekA03TCIj9DNlfGgBOP0YXBqGSQgKc+kvcNmOENYVMtBQWlhzAsI71WqpOLvdYQdETEKnMxoOkOhE+HACY1R6IxxyEwxIoMUB0oIY4UAZ02An0/WjT1Cb5eDwqCVOTaNxK6AiEHScR5MLOUlWAjEWCp2IrFZsYpYigUklqYyBfPKQUFpmQccTgkOkNAjtVJT5lxJkVEGCEgJZ7kQaYGQn4E3PAQvmkXCIYXQ5rJIKKR8hOnwLJLAXmX4NVm+Ds6kDtyKQimoeDtOooN74Yq5fmSnfmx2owZgdiklWIeLSjpaU98Ql9gbYhutt0GLca+B76MID+SF0jI9TfBi086FKAvooxj+i+3YL5CFi9oCZKG/gR22jCfu7tqw0AwzMG12ANN1fFjImdFlNSwuZdejYUdgPiJTzsPiUmatgjp5NpMCCnMqaJehcaiHGyZRqKZQWNRgy4M5alg7eXMHb2WPSVcwLCEiE7UD8hz42H6gGb6fIvTQyNpF9FMUZBfXDI9TBArsASYrM2wTJBxi0I21GWZ4G2ijw7fgNaEMOcRloeRIaWQ5KPxyaEgEzS9ILSRBQiIWeEcDp/NMoXCo4QX+yBH+o24dkZilUL0M3Hu8TYp6ZjvYyl0m5XuG/EVSphNdvRcy6J4+KHxepcLVCoxXOEmNV+bOpheVmQovlbmjzQmVubi+K1M/glVSKVNUP11V0qKMtp9L7SC8qFWz2i+prXqXvsVzE8k1wmjHWnQbrLxthqGG4upsJUKJ7sNsrIBssdVMOdQ8JbUOWTofQwihhHeIolAsIkKpdU1mIchPPJ8FxNWFV9VyncibFQcBVVWGhlpAQ9OArEOo+KHqq0J2BTfOUWmZ9gPZ0K+2uuWTjHbYC99Td+b8oUZPq/V4B920I8AdsYmnBxyThnGkUkoOKgpmbvRgX1k3cZCvviePppG/lHr14XY8uvw4msS3a8pih3MNKu9bxRA8J3AMx1LvafwVOE6wV+93uGh+QP2WalnoeMzqfZVfUdoP9N4wtdDp9i/AcI3XEcJjTnQhvkWIK1OA2ILvKa7lsFtK4Ai0yZsIKNx5bi3d3wuCcXfsWsedaav3LwHhW97MwCS+LCufeNx5GDyhSNypAdRdDShhGzHg2eXd+Z16xlQG9GUh0u36+m4EhYpLGTgPxMZUWx4QoLZqwDDgQ6lfObcSw4TTP+HJVgw6G94HYtZEhGjappSTjuHIYeM9qpuDzv5CxFH9keabO1u3pNt+CCnfJ6c4lnkvAVAaKxavvTelGmk9bO6+cWyyruMFbMuB+vHsTD29vdTOLsdj7Wr9u2rT2NknxtGTdjdRa9m5pgO3IYbC79Dwji7ItF3i8U2FulQEVmxv++2zg9l+kyL2C4rgoiuZqrp3AANHE1IYJY/yt+xxKjtF0542DrAHoC3LpA2S7yI9uI5NB6LsQ3zi0z+6rG1G2TBeSQyNbYlPgt6lIXjdwuQ5FlyUVhNqKdHpT8Q2XEBEaMAFRDqsYdMAILKhq7YfD2MkFKj1hyV1nafM3BeC8cWLHBgovXgRdrAo6n4B8J5Ov6N/mpbGYqUw5kICy4yipQOMOkiTELIYjIbTCTby0+H+KB251oF+edIfsXRg7E1XJVtvPAr/fN6NnrH5+uaGPOnWAxZuODPAP7M2Em4M09iGtv2LnxQDrS65OFzuhkOeTT8gNhtioraSMj6LZbhO+hPRR9tskJI2V+0oPRn3xdzdE6KG83ByQUFnA8X3L6EEV1dohxedAEFzM1XYPbWqjI5yfS6fj+hNUiA9u1nTf6LOyLDwVzdBUxVFKITgj09Qs0PuwDJWxx9mlO6zn9gmavKxDJA26vi79CfN8XHGjfRhSwfNX4Yh8dGXrrFKN5nAH0zDc1Agt55+IE+OJxwcFNB0102x4jbP510VHjajkN25SL1NeLUrQr2wYpPDaDZAwHm2DWj5GAwftpAvPgZWWqMMFYtc3IpRKjP8gAKFwwtLS4ZzZHYqHFZUFQ3WlR90I+y+D0fg2IQiyQzC67aGoNQ6GpB44apxPIcW2t5hWnbi8fimSRfD66WuQW4AVd2YraKToUr1nPdkywJSGgh/Tja93F1ov59//HG10s4+3a2vL7XL0zPtw/nFenWrrU9/vFhpd+e/r/j+F745l74ynHYFTza2nA5Ggw/DwWhyfjkp+vgmamfX7ymx68ub66vV1Vq7++1uvbrMkfFf6LCqOPfeBHl6c6Pd3F7frG7X56s7eS4//rZeaZ/W5xfnIU6GU+Niv4CIs4vrs59phVydflzd5iTk1uu7CggnFa8+XWp373/W1j/drk7fa1TE6YVGa/6WCtFurs+vaM3ni1MccdcKiCxoff3z6kr7iaIXWP+vvx+d4H+zNA3ZZW5N30Zf7AnbcHGyD58T0FsoMVKU9uPpGf34XqNF0T5cnN79lLdeofq4vLy+KsCvrnizeP/b1enl+Vn4o5gd1YPerU/XkpixzZyuTy+uP1ITX93Rz/LG9371y/kZtYjV7fnNT6vb04ucFqP19nRRESDo8vT97S95dL5wLg/54Xa1YjtHtJ9Xt1erPPN4JVgLV4LlhXy8Ob/OIbOlWnm4n05j08iBskW3yp5BELrElgHDGVOPfLs+KwFTr+wFxe5RAJp7odtPN+tK71dagu3soNieIu2KGrb2y/nt+hMzatk3IwfH+spVhZfjuxc0m7YS7dH0gqNuSfi1glYuVh9Pz35jes8JTJdnO5fm+na9+s/Lsejz2urD5XikUbd3ey3x7m1p8rb2rZufftNuT88718/Nxen6w/XtZX23E4fQinQvk6o/dte/nq7Pfnp//VGug7n8cfV+fXFHK/jqw/nHCkOyeGdZzIX87/IGdHP9K7XYqiaVm7YULcDN3al2dvvbzfq6sSy5K6TFy8LMQbs4/1G7/HSxPqch3Pr67Jp6oE83N9TEAH18TkVcCgvrtPPVahVNzzNrvFtdrM7yYqpmxtnijeYTixjFuRooCRob0Ghw9Qvv1dtY8HGAxrf5i6qYy705jauyqkGFhpmZitYxrPNuVWma6bQ0IJK+vs3bY8VotVUxYzp2OMeys7uL1epmfX5ZLGwyPw2BPo+aYwE6np7uDn1OS/7+/Pp0dafdrv7vp3MaVNI6uvv5/OojjF/SfGuIFia7AS7vbnWmXd8VusxkmrvzSPb3uxvt7OZMfFh9+kG7OrvBMpsfP334UOPCiwfYpGMv6nI06ka04VSbsOmAfOxFfUz6a3muRkBQpCDu13IywrkMrWrKrYPCefegXa3Wv17f/kzR6fjlZvVeHCd1+pHrhfY02fJyNVycn17RIdYtHWndnRfi/lHnUCnGu101jLmTKTq25JPVr3AcxKW1CIpmrVJZclLWv91QfyMqKz7eXikx2uf2ITz4JXYQiq3C8oxO6s4wmDID8qwcxuP0CY/2+7pP2JPxdyc6BoPkmE0qny1iZwWy02mW/kIjW2GJNSvOLDPbjtjh3kD6XUZYNI1tBWbiqJOVdY2yi59t4RLVNn2hy2OdHipOBVY+ZDt0gCpbL9FMa6UlhL8p4YLdve6bRlxFmm/aO4vYJOCTvVRa+Vl5W2niZBuusnOV+OL0Wj755/rhEpV557aqZef2yoAVlh2KaaMRPddfzdAHu1VN5sFeNcPkRAsoLbpJnuyVjzcaKfH+6TZGmWf7qzHfOXoGleUcA9Kt6qre6FVnWYGtSss+3J/WvlhWN2VlHuxVR1ROq2roMyUOtEu2rt0oXGEfzvkh8eTbk6Nxwj4Ze51tt6QPOfz7psdODPdYHJ5GdF9D+rYgfes+TpXSxod+RFuOHmj6vVmYQvY2EtLZVia2lb9ZePzUSXjKSzOcDclJDw/8C0vn6QFaZIfPRH/dGZ7pBjnRf2OpCogRZGIv9iQ7oHBivYJKtkfbYF+yE3BBuBkTrhhBDhs90FHlC1SMrduOZrDo92uU3DmYgcY3BGhueOjvK5CwWR4/g7hfq/qpfC8IzFeu+Djhx6Xu8t7l9cttsPG4veGeL9sTDBevIPv5uUb6v/7rcN6//Cfds2kX7J/obOPKq6s+Ec8TWH5NAi7Z6HZgGvnuuCLdTK+VQDtFfqWs/zVosCcO5heepzU/LWx+eY3ehw3HNYs8krwlbshWP1rFxZRqAgf9gfAuW/cOJzT6PAl0b0eCIoOax0rBoHKg3/wgGBICOQT74+G+wCL6rn/hxXhUOdBvfoiiUmUznL0KicrIlFJh3yv0+x86R6klEanjbWWTPlrXQ9Ax+OaHrt1EA77rCpBhybTqOo2QUOeeA5lSVfygbG1HCb/9KoRqAipOK/vb69lSHO9odYMg6nQOHd09or5eiZaIpuJuUSvGJsqvemmbbe8K6peNlF7KQZPya/TdV9JNb4xE9FMbxyjX4JYuqpk+uYjopH5or2zZb0r62+sq6NWIiWireTJG2ca/fzWtvTpBofbXPJmibNkDCn9ASR545Wb5+hSFWmvNUEgpJibpv3kiM6meGKp5rH62Vn6SFsiIT1OWJikVOjoihv8D+/WE//M1uCQhW/hZO+huntV/Rnif/0m51N0f/vbP15/WN5/W2vvz239R//bPN7fX/2d1tr46vVz9ywl/uQPncNHnxNyQk2jGvEg3OqDguPkOj+9SOOxGE30wGmzZiSTzUDqRBNOT6VdltuegF6YfJMBpbGJ9pyhPHtWNxg4naFxVmS8PNLJzjNLXRvXXHom/zxVKgMVBL+YJaX2ZDWSs4ja9biJ3Rl33oKb1IFA7e8cP/odVj5imqGc9CQ9/8vbjm+NR6HE3wUm4eXDD1035Kt3Jzj6eJG39Xo+ya2cUmoFLnz0JH6DucGvpu6pk/m9a4X22B/omG8go3tMzbRg7lqQe1DAkqpv2uAIVHj0dV/k/KvwrV3htKAV3hayU0fWFSlUuOCEAXxpBXNEtkVF7RVGpR/vok43i6iweL4XinSCoxtlWE2VrEmuj8F2vumV+KWUnEAK793SjdMq49x4hic879Qm51R3qJJjpnTjBnngWLd8/jPAvaYStAJV3GjWp/UB8n1qjYhF7F+x/KMbtr9AvCpl99nkkw/+H1b1tqysPU/B65/9pNQ0Mi3TfJ4d7FM0/0w8JnPJkBnuFz3F9i4M0UTjD9IyjpXvJJfcvchtkvp0S2bTpbUqzZ923t0BGVAjFSEdnAlXzb2o0T8Y//dO//cfzwWKPhnkx6cPDkwF/maI4G9ri6Fef1h+Uxed3/xECxPNsySGao3FycDZH2qJ8EhzdkzN+3ukmfOyG6vhHTjzaSk1bhrI3zBN+1oeCUDiXeMHLnUH//oHdVBhN42X171IUXvy7gLj/TsuQ+/xK5Yp2/tyRIODbo0QLpPZH7WhE6gZpuXhfXTStXeUCi4+e+BbflRLU32xXuGTtxPCM+LC44YUso2A8MdnPVRewVXQdLZfGvYJtgK09LNW7797dnbPzoGfn69+0u/Wn9+fXmSRV775/91+f372Pd6B9/5l+/Pz5na8/EtoSHOPhF90z2W0mPvv6e/YHe4D9Rx2Ma9KnNg8XjhGu/0Y/fB//wzcPrmUaZvCi+ZsHbTQYTU9mJ+P45+/if7Dk7ddu+f2aKfXo1z/DPyjMu7xu3mg5/qR1FXJh+4R9WjX/j9ZNYq4Uj3ck3yV1zFO3sbImV02YDvsn/wdLkxi3hvgHriv6y860dSt5m38bmS79YvgdBwx4fofvJ5PpfLqYLId/flcgw9pOPZcosS5rwV6gBbr/kORxkGChzCbT8XI5mg7EaRiuoW28R+3IiBx99ucj7RtBdIaT2XK2WM4nU3E+0VHicOGRzxGAqCwHw/FyNp0spJnQB6KkHhAeo/F8OR7PhjNpHuFpMY2fFgNRGc+ms8FgOpWvnJ1HiB0l3AbZyXw5nw4Xs6E8lTjlKV8E1R7Iiw9hNBxPx8PZdDwfSROyzN0+CNkAiEwnyxn1LUPRBh1rhSUzgVXNeD5dzseLmYRLiUjwXG9g1zYczMfz+Xg0lHCx94EReBZE/Hw5oW6V6kJauG/sCYtbPK3Y7cipYzEcjwez8UBGHXFeA03fUAGB6cPa73BKex3qX2djQS4fqP9gWQLPQI59MqK6WMr1eJBSL2ifP1nM5xM50WH2Q1hnMhjNxqP5aCThpnLXGIBc1Jx67tl4LFr5OQ7seg5gFzKeTEaziYzHLtFgw2ig11zQfn40nYgq5T6wNL7NbKvTPt7YysmfjcajwXy5BEvX/JExkXOYs/FssljIBKLZzLqa4xumZemBA4wwRjQUHdKuVCLuyhMK2Po4gMpoOV/OlnNhX8luJdOimRCYKqbTxWA6EvaYFckDJcQvZjScGNGGKig9TEgLKvh8OZiNJsKNopQtGeamZuPJkgZUcwk7PPoBHZDlMzXLdFw0ul1QFjOJYCbiQFVxpD4ioCG3vYMzojY5Hg+Xi7lEL54GM/Q7O9zHBurOljTkHdP/xamEY1X/CdRAZpPheEKDXfkwl8fboIYynY+mtEpEx8rJkJ1v/ISEVqPleDqbT0YS9lCZE1NqCDiaT+kwUGZ4zNK8wQK7IXORC/GImgpPE1gCe8zBZDiZSQ38iglzJeSPp4PBaCweQGWkw+1QGbJAbjmnPbY4DZ76VQtvRwANPYcLWhWzkcTMVf4qNEhtzNnoeyDlE5Nr4bWNsQGNuJQZdcsT2oNKqCJ/5yyoPsbz2YzGkxJ+oXCNM2zMPaFx3GQ8lhh9Zq8OB3VV1EfPR8uRaCwT3SYGiqIH89lwuhzImGTaQ/jk70d2IySICquI5WSykOiwo1TRPOsjzrQQjS0nk8FiItFxFlqIR3bASIp2IcPpYERtRFQ1uutq0YKdSUDdyGQ2mU3pSFzUTDItFdRIqQKW08UCZKXlCy1h8S0NrYaj7tM18RmrdKVZLS0hS9jGbLgYjwfTReeeNeZBdUPtwzLDRUiea1bOew3mi8Vs2H1GICZwu15pZ/Gdjb5s0xiNJuPhqPvkYab4yYWRGtWBbjmyQfZ0Ro1z1j3Ay1JwDWqJLPkE7dz3ur2xiJwmhjS6Gi+H80lnH9HGQsYcR6PlcjQYLDpPHhZIJAunoPlk2p3O5sPug+AMiTDYDFUgOQaf0NBqOhkNhR1DSbyUQ2DeYDGfdJ8xzIg3HT/wiH4AWaKyXC7Gg9li2jmcaWIgowNaAePRdNR9FbSKAO8f4kYh653mSzrqmU3mnQPtlIlZGP1p0U9ybYKNQafTqbiTriASeLrtszTbIEp0TDhkYxA6PJXhxGdRERRDKcxng8lEov8ISURbvjDIKBPKZDYdzoXbbuZW9tCHSLUbOkqfzRaj+VLGc7ZcISPnzIaDIfXk44VM7952m4wko8mU9vdz2qpFKRXO1ouPl1m/RuNwYeOIphNtw+UHDe+ZBjam7+qBsZfs5FilMC7CTbeFi2SVTGgIOhiJdzgRm8K1jZIB2GI5HsxH1DwkWUR7opBqSGGTrhPq9WWVUk9HKjAcDIbTJTVhSTbxWjKWdoY0Wp5Nl9Puq1jdCUkZMXW6bIgr7OhYX5MO8WUWEmnDmUyWFTPkdds/dXYaTMYG5vPRjM1Gd5Z04BnFpcZki+loOZtN//z/7/78bybe+oQ==END_SIMPLICITY_STUDIO_METADATA
# END OF METADATA