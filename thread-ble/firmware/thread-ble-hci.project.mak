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
 '-DEFR32MG24A020F1024IM40=1' \
 '-DSL_CODE_COMPONENT_SYSTEM=system' \
 '-DSL_APP_PROPERTIES=1' \
 '-DSL_CODE_COMPONENT_CLOCK_MANAGER=clock_manager' \
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
 '-DMBEDTLS_CONFIG_FILE=<sl_mbedtls_config.h>' \
 '-DCORTEXM3=1' \
 '-DCORTEXM3_EFM32_MICRO=1' \
 '-DCORTEXM3_EFR32=1' \
 '-DOPENTHREAD_CONFIG_PLATFORM_LOG_CRASH_DUMP_ENABLE=1' \
 '-DPHY_RAIL=1' \
 '-DPLATFORM_HEADER="platform-header.h"' \
 '-DOPENTHREAD_CONFIG_DIAG_ENABLE=1' \
 '-DOPENTHREAD_CONFIG_ENABLE_BUILTIN_MBEDTLS=0' \
 '-DOPENTHREAD_CONFIG_NCP_CPC_ENABLE=1' \
 '-DOPENTHREAD_CONFIG_NCP_CPC_TX_CHUNK_SIZE=2048' \
 '-DOPENTHREAD_CONFIG_NCP_HDLC_ENABLE=0' \
 '-DOPENTHREAD_PROJECT_LIB_CONFIG_FILE="sl_openthread_features_config.h"' \
 '-DSPINEL_PLATFORM_HEADER="spinel_platform.h"' \
 '-D_GNU_SOURCE=1' \
 '-DOPENTHREAD_ENABLE_NCP_VENDOR_HOOK=1' \
 '-DOPENTHREAD_CONFIG_PLATFORM_RADIO_COEX_ENABLE=1' \
 '-DRADIO_CONFIG_DMP_SUPPORT=1' \
 '-DSL_OPENTHREAD_PHY_SELECT_STACK_SUPPORT=1' \
 '-DOPENTHREAD_CORE_CONFIG_PLATFORM_CHECK_FILE="openthread-core-efr32-config-check.h"' \
 '-DOPENTHREAD_PROJECT_CORE_CONFIG_FILE="openthread-core-efr32-config.h"' \
 '-DSL_CODE_COMPONENT_OT_PLATFORM_ABSTRACTION=ot_platform_abstraction' \
 '-DSL_CODE_COMPONENT_OPENTHREAD=openthread' \
 '-DOPENTHREAD_CONFIG_FILE="sl_openthread_package_info.h"' \
 '-DOPENTHREAD_CONFIG_PLATFORM_KEY_REFERENCES_ENABLE=0' \
 '-DOPENTHREAD_RADIO=1' \
 '-DOPENTHREAD_SPINEL_CONFIG_OPENTHREAD_MESSAGE_ENABLE=0' \
 '-DSL_OPENTHREAD_STACK_FEATURES_CONFIG_FILE="sl_openthread_features_config.h"' \
 '-DMBEDTLS_PSA_CRYPTO_CONFIG_FILE=<psa_crypto_config.h>' \
 '-DSL_RAIL_LIB_MULTIPROTOCOL_SUPPORT=1' \
 '-DSL_CODE_COMPONENT_RAIL_UTIL_IEEE802154_PHY_SELECT=rail_util_ieee802154_phy_select' \
 '-DSL_CODE_COMPONENT_RAIL_UTIL_IEEE802154_STACK_EVENT=rail_util_ieee802154_stack_event' \
 '-DSL_RAIL_UTIL_PA_CONFIG_HEADER=<sl_rail_util_pa_config.h>' \
 '-DSL_CODE_COMPONENT_SE_MANAGER=se_manager' \
 '-DCIRCULAR_QUEUE_USE_LOCAL_CONFIG_HEADER=1' \
 '-DSL_CODE_COMPONENT_CORE=core' \
 '-DSL_RAIL_3_API=1' \
 '-DSL_CODE_COMPONENT_SLEEPTIMER=sleeptimer' \
 '-DSL_CODE_COMPONENT_SLI_CRYPTO=sli_crypto' \
 '-DSLI_RADIOAES_REQUIRES_MASKING=1' \
 '-DSL_CODE_COMPONENT_SLI_PROTOCOL_CRYPTO=sli_protocol_crypto' \
 '-DSL_CODE_COMPONENT_PSEC_OSAL=psec_osal'

ASM_DEFS += \
 '-DEFR32MG24A020F1024IM40=1' \
 '-DSL_CODE_COMPONENT_SYSTEM=system' \
 '-DSL_APP_PROPERTIES=1' \
 '-DSL_CODE_COMPONENT_CLOCK_MANAGER=clock_manager' \
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
 '-DMBEDTLS_CONFIG_FILE=<sl_mbedtls_config.h>' \
 '-DCORTEXM3=1' \
 '-DCORTEXM3_EFM32_MICRO=1' \
 '-DCORTEXM3_EFR32=1' \
 '-DOPENTHREAD_CONFIG_PLATFORM_LOG_CRASH_DUMP_ENABLE=1' \
 '-DPHY_RAIL=1' \
 '-DPLATFORM_HEADER="platform-header.h"' \
 '-DOPENTHREAD_CONFIG_DIAG_ENABLE=1' \
 '-DOPENTHREAD_CONFIG_ENABLE_BUILTIN_MBEDTLS=0' \
 '-DOPENTHREAD_CONFIG_NCP_CPC_ENABLE=1' \
 '-DOPENTHREAD_CONFIG_NCP_CPC_TX_CHUNK_SIZE=2048' \
 '-DOPENTHREAD_CONFIG_NCP_HDLC_ENABLE=0' \
 '-DOPENTHREAD_PROJECT_LIB_CONFIG_FILE="sl_openthread_features_config.h"' \
 '-DSPINEL_PLATFORM_HEADER="spinel_platform.h"' \
 '-D_GNU_SOURCE=1' \
 '-DOPENTHREAD_ENABLE_NCP_VENDOR_HOOK=1' \
 '-DOPENTHREAD_CONFIG_PLATFORM_RADIO_COEX_ENABLE=1' \
 '-DRADIO_CONFIG_DMP_SUPPORT=1' \
 '-DSL_OPENTHREAD_PHY_SELECT_STACK_SUPPORT=1' \
 '-DOPENTHREAD_CORE_CONFIG_PLATFORM_CHECK_FILE="openthread-core-efr32-config-check.h"' \
 '-DOPENTHREAD_PROJECT_CORE_CONFIG_FILE="openthread-core-efr32-config.h"' \
 '-DSL_CODE_COMPONENT_OT_PLATFORM_ABSTRACTION=ot_platform_abstraction' \
 '-DSL_CODE_COMPONENT_OPENTHREAD=openthread' \
 '-DOPENTHREAD_CONFIG_FILE="sl_openthread_package_info.h"' \
 '-DOPENTHREAD_CONFIG_PLATFORM_KEY_REFERENCES_ENABLE=0' \
 '-DOPENTHREAD_RADIO=1' \
 '-DOPENTHREAD_SPINEL_CONFIG_OPENTHREAD_MESSAGE_ENABLE=0' \
 '-DSL_OPENTHREAD_STACK_FEATURES_CONFIG_FILE="sl_openthread_features_config.h"' \
 '-DMBEDTLS_PSA_CRYPTO_CONFIG_FILE=<psa_crypto_config.h>' \
 '-DSL_RAIL_LIB_MULTIPROTOCOL_SUPPORT=1' \
 '-DSL_CODE_COMPONENT_RAIL_UTIL_IEEE802154_PHY_SELECT=rail_util_ieee802154_phy_select' \
 '-DSL_CODE_COMPONENT_RAIL_UTIL_IEEE802154_STACK_EVENT=rail_util_ieee802154_stack_event' \
 '-DSL_RAIL_UTIL_PA_CONFIG_HEADER=<sl_rail_util_pa_config.h>' \
 '-DSL_CODE_COMPONENT_SE_MANAGER=se_manager' \
 '-DCIRCULAR_QUEUE_USE_LOCAL_CONFIG_HEADER=1' \
 '-DSL_CODE_COMPONENT_CORE=core' \
 '-DSL_RAIL_3_API=1' \
 '-DSL_CODE_COMPONENT_SLEEPTIMER=sleeptimer' \
 '-DSL_CODE_COMPONENT_SLI_CRYPTO=sli_crypto' \
 '-DSLI_RADIOAES_REQUIRES_MASKING=1' \
 '-DSL_CODE_COMPONENT_SLI_PROTOCOL_CRYPTO=sli_protocol_crypto' \
 '-DSL_CODE_COMPONENT_PSEC_OSAL=psec_osal'

INCLUDES += \
 -Iconfig \
 -Iconfig/prioconf \
 -Iautogen \
 -I/out \
 -I$(SDK_PATH)/platform/Device/SiliconLabs/EFR32MG24/Include \
 -I$(SDK_PATH)/platform/common/inc \
 -I$(SDK_PATH)/protocol/bluetooth/bgcommon/inc \
 -I$(SDK_PATH)/protocol/bluetooth/bgstack/ll/inc \
 -I$(SDK_PATH)/protocol/bluetooth/bgstack/ll/utils/rtos/inc \
 -I$(SDK_PATH)/protocol/bluetooth/bgstack/ll/utils/hci_packet/inc \
 -I$(SDK_PATH)/protocol/bluetooth/bgstack/ll/utils/hci_packet/cpc/inc \
 -I$(SDK_PATH)/protocol/bluetooth/bgstack/ll/utils/hci_packet/cpc/src \
 -I$(SDK_PATH)/platform/bootloader \
 -I$(SDK_PATH)/platform/bootloader/api \
 -I$(SDK_PATH)/platform/bootloader/core/flash \
 -I$(SDK_PATH)/platform/service/clock_manager/inc \
 -I$(SDK_PATH)/platform/service/clock_manager/src \
 -I$(SDK_PATH)/platform/CMSIS/Core/Include \
 -I$(SDK_PATH)/platform/CMSIS/RTOS2/Include \
 -I$(SDK_PATH)/platform/service/cpc/inc \
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
 -I$(SDK_PATH)/platform/service/interrupt_manager/inc \
 -I$(SDK_PATH)/platform/service/interrupt_manager/src \
 -I$(SDK_PATH)/platform/service/interrupt_manager/inc/arm \
 -I$(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/config \
 -I$(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/config/preset \
 -I$(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/inc \
 -I$(SDK_PATH)/util/third_party/mbedtls/include \
 -I$(SDK_PATH)/util/third_party/mbedtls/library \
 -I$(SDK_PATH)/platform/service/memory_manager/inc \
 -I$(SDK_PATH)/platform/service/memory_manager/src \
 -I$(SDK_PATH)/platform/service/memory_manager/profiler/inc \
 -I$(SDK_PATH)/platform/service/mpu/inc \
 -I$(SDK_PATH)/platform/emdrv/nvm3/inc \
 -I$(SDK_PATH)/platform/emdrv/nvm3/config \
 -I$(SDK_PATH)/protocol/openthread/include \
 -I$(SDK_PATH)/protocol/openthread/platform-abstraction/ncp \
 -I$(SDK_PATH)/protocol/openthread/src/legacy_hal/include \
 -I$(SDK_PATH)/platform/service/legacy_hal/inc \
 -I$(SDK_PATH)/protocol/openthread/platform-abstraction/efr32 \
 -I$(SDK_PATH)/util/third_party/openthread/include \
 -I$(SDK_PATH)/util/third_party/openthread/include/openthread \
 -I$(SDK_PATH)/util/third_party/openthread/src/include \
 -I$(SDK_PATH)/util/third_party/openthread/src/core \
 -I$(SDK_PATH)/util/third_party/openthread/src/lib \
 -I$(SDK_PATH)/util/third_party/openthread/examples/platforms \
 -I$(SDK_PATH)/util/third_party/openthread/third_party/tcplp \
 -I$(SDK_PATH)/util/third_party/openthread/src \
 -I$(SDK_PATH)/util/third_party/openthread/src/cli \
 -I$(SDK_PATH)/util/third_party/openthread/src/ncp \
 -I$(SDK_PATH)/util/third_party/openthread/src/lib/spinel \
 -I$(SDK_PATH)/util/third_party/openthread/src/lib/hdlc \
 -I$(SDK_PATH)/util/third_party/openthread/src/lib/utils \
 -I$(SDK_PATH)/protocol/openthread/platform-abstraction/include \
 -I$(SDK_PATH)/protocol/openthread/platform-abstraction/rtos \
 -I$(SDK_PATH)/util/third_party/openthread/src/lib/platform \
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
 -I$(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_dma \
 -I$(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_ieee802154 \
 -I$(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions \
 -I$(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/efr32xg24 \
 -I$(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_pti \
 -I$(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_rssi \
 -I$(SDK_PATH)/platform/security/sl_component/se_manager/inc \
 -I$(SDK_PATH)/util/plugin/security_manager \
 -I$(SDK_PATH)/util/silicon_labs/silabs_core/queue \
 -I$(SDK_PATH)/platform/service/sl_main/inc \
 -I$(SDK_PATH)/platform/service/sl_main/src \
 -I$(SDK_PATH)/platform/service/sleeptimer/inc \
 -I$(SDK_PATH)/platform/security/sl_component/sli_crypto/inc \
 -I$(SDK_PATH)/platform/security/sl_component/sl_protocol_crypto/src \
 -I$(SDK_PATH)/platform/security/sl_component/sli_psec_osal/inc \
 -I$(SDK_PATH)/platform/emdrv/ustimer/inc

GROUP_START =-Wl,--start-group
GROUP_END =-Wl,--end-group

PROJECT_LIBS = \
 -lstdc++ \
 -lgcc \
 -lc \
 -lm \
 -lnosys \
 $(SDK_PATH)/protocol/bluetooth/bgcommon/lib/build/gcc/cortex-m33/bgcommon/release/libbgcommon.a \
 $(SDK_PATH)/protocol/bluetooth/bgstack/ll/build/gcc/xg24/release/liblinklayer.a \
 $(SDK_PATH)/protocol/openthread/libs/libsl_openthread_cm33_gcc.a \
 $(SDK_PATH)/protocol/openthread/libs/libsl_openthread_wrapper_gcc.a \
 $(SDK_PATH)/platform/radio/rail_lib/autogen/librail_release/librail_multiprotocol_efr32xg24_gcc_release.a

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
 -imacros sl_openthread_coex_config.h \
 -fno-strict-aliasing \
 -Werror=unused-function \
 -Werror=unused-label \
 -Werror=unused-variable \
 -flto=auto -fwhole-program \
 --specs=nano.specs

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
 -imacros sl_openthread_coex_config.h \
 -fno-strict-aliasing \
 -Werror=unused-function \
 -Werror=unused-label \
 -Werror=unused-variable \
 -flto=auto -fwhole-program \
 --specs=nano.specs

ASM_FLAGS += \
 -mcpu=cortex-m33 \
 -mthumb \
 -mfpu=fpv5-sp-d16 \
 -mfloat-abi=hard \
 -imacros sl_openthread_coex_config.h \
 -x assembler-with-cpp

LD_FLAGS += \
 -mcpu=cortex-m33 \
 -mthumb \
 -mfpu=fpv5-sp-d16 \
 -mfloat-abi=hard \
 -T"autogen/linkerfile.ld" \
 --specs=nano.specs \
 -Xlinker -Map=$(OUTPUT_DIR)/$(PROJECTNAME).map \
 @linker_options/ot-rtos-wrapper-options \
 -Wl,--wrap=_free_r -Wl,--wrap=_malloc_r -Wl,--wrap=_calloc_r -Wl,--wrap=_realloc_r \
 -Wl,--wrap=main \
 -flto \
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

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/coexistence/protocol/ieee802154_uc/coexistence-ot.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/protocol/ieee802154_uc/coexistence-ot.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/protocol/ieee802154_uc/coexistence-ot.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/protocol/ieee802154_uc/coexistence-ot.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/coexistence/protocol/ieee802154_uc/coexistence-ot.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/coexistence/protocol/ieee802154_uc/coexistence-ot.o

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

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_dma/sl_rail_util_dma.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_dma/sl_rail_util_dma.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_dma/sl_rail_util_dma.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_dma/sl_rail_util_dma.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_dma/sl_rail_util_dma.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_dma/sl_rail_util_dma.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_rssi/sl_rail_util_rssi.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_rssi/sl_rail_util_rssi.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_rssi/sl_rail_util_rssi.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_rssi/sl_rail_util_rssi.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_rssi/sl_rail_util_rssi.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_rssi/sl_rail_util_rssi.o

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

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ccm.o: $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ccm.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ccm.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ccm.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ccm.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ccm.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_cmac.o: $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_cmac.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_cmac.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_cmac.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_cmac.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_cmac.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ecdsa_ecdh.o: $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ecdsa_ecdh.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ecdsa_ecdh.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ecdsa_ecdh.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ecdsa_ecdh.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ecdsa_ecdh.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_sha.o: $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_sha.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_sha.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_sha.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_sha.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_sha.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/se_aes.o: $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/se_aes.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/se_aes.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/se_aes.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/se_aes.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/se_aes.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/se_jpake.o: $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/se_jpake.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/se_jpake.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/se_jpake.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/se_jpake.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/se_jpake.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_entropy_hardware.o: $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sl_entropy_hardware.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sl_entropy_hardware.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sl_entropy_hardware.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_entropy_hardware.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_entropy_hardware.o

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

$(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_emu_s2.o: $(SDK_PATH)/platform/service/device_init/src/sl_device_init_emu_s2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/device_init/src/sl_device_init_emu_s2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/device_init/src/sl_device_init_emu_s2.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_emu_s2.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_emu_s2.o

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

$(OUTPUT_DIR)/sdk/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.o: $(SDK_PATH)/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.o

$(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/faults.o: $(SDK_PATH)/platform/service/legacy_hal/src/faults.s
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/legacy_hal/src/faults.s'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(ASMFLAGS) -c -o $@ $(SDK_PATH)/platform/service/legacy_hal/src/faults.s
ASMDEPS_s += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/faults.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/faults.o

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

$(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_cpp.o: $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_cpp.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_cpp.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_cpp.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_cpp.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_cpp.o

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

$(OUTPUT_DIR)/sdk/platform/service/mpu/src/sl_mpu_s2.o: $(SDK_PATH)/platform/service/mpu/src/sl_mpu_s2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/mpu/src/sl_mpu_s2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/mpu/src/sl_mpu_s2.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/mpu/src/sl_mpu_s2.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/mpu/src/sl_mpu_s2.o

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

$(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/alarm.o: $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/alarm.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/alarm.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/alarm.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/alarm.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/alarm.o

$(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/crypto.o: $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/crypto.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/crypto.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/crypto.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/crypto.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/crypto.o

$(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/diag.o: $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/diag.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/diag.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/diag.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/diag.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/diag.o

$(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/entropy.o: $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/entropy.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/entropy.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/entropy.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/entropy.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/entropy.o

$(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/flash.o: $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/flash.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/flash.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/flash.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/flash.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/flash.o

$(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/ieee802154-packet-utils.o: $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/ieee802154-packet-utils.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/ieee802154-packet-utils.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/ieee802154-packet-utils.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/ieee802154-packet-utils.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/ieee802154-packet-utils.o

$(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/memory.o: $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/memory.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/memory.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/memory.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/memory.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/memory.o

$(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/misc.o: $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/misc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/misc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/misc.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/misc.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/misc.o

$(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/radio.o: $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/radio.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/radio.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/radio.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/radio.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/radio.o

$(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/radio_coex.o: $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/radio_coex.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/radio_coex.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/radio_coex.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/radio_coex.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/radio_coex.o

$(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/radio_extension.o: $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/radio_extension.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/radio_extension.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/radio_extension.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/radio_extension.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/radio_extension.o

$(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/radio_power_manager.o: $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/radio_power_manager.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/radio_power_manager.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/radio_power_manager.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/radio_power_manager.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/radio_power_manager.o

$(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/sl_gp_interface.o: $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/sl_gp_interface.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/sl_gp_interface.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/sl_gp_interface.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/sl_gp_interface.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/sl_gp_interface.o

$(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/soft_source_match_table.o: $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/soft_source_match_table.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/soft_source_match_table.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/soft_source_match_table.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/soft_source_match_table.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/soft_source_match_table.o

$(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/startup-gcc.o: $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/startup-gcc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/startup-gcc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/startup-gcc.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/startup-gcc.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/startup-gcc.o

$(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/system.o: $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/system.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/system.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/openthread/platform-abstraction/efr32/system.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/system.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/system.o

$(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/ncp/ncp_coex.o: $(SDK_PATH)/protocol/openthread/platform-abstraction/ncp/ncp_coex.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/openthread/platform-abstraction/ncp/ncp_coex.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/protocol/openthread/platform-abstraction/ncp/ncp_coex.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/ncp/ncp_coex.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/ncp/ncp_coex.o

$(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/ncp/ncp_cpc.o: $(SDK_PATH)/protocol/openthread/platform-abstraction/ncp/ncp_cpc.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/openthread/platform-abstraction/ncp/ncp_cpc.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/protocol/openthread/platform-abstraction/ncp/ncp_cpc.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/ncp/ncp_cpc.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/ncp/ncp_cpc.o

$(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/ncp/ncp_dispatcher.o: $(SDK_PATH)/protocol/openthread/platform-abstraction/ncp/ncp_dispatcher.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/openthread/platform-abstraction/ncp/ncp_dispatcher.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/protocol/openthread/platform-abstraction/ncp/ncp_dispatcher.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/ncp/ncp_dispatcher.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/ncp/ncp_dispatcher.o

$(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/ncp/ncp_init.o: $(SDK_PATH)/protocol/openthread/platform-abstraction/ncp/ncp_init.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/openthread/platform-abstraction/ncp/ncp_init.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/protocol/openthread/platform-abstraction/ncp/ncp_init.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/ncp/ncp_init.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/ncp/ncp_init.o

$(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/rtos/sl_ot_rtos_adaptation.o: $(SDK_PATH)/protocol/openthread/platform-abstraction/rtos/sl_ot_rtos_adaptation.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/openthread/platform-abstraction/rtos/sl_ot_rtos_adaptation.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/openthread/platform-abstraction/rtos/sl_ot_rtos_adaptation.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/rtos/sl_ot_rtos_adaptation.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/rtos/sl_ot_rtos_adaptation.o

$(OUTPUT_DIR)/sdk/protocol/openthread/src/legacy_hal/crash_handler.o: $(SDK_PATH)/protocol/openthread/src/legacy_hal/crash_handler.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/openthread/src/legacy_hal/crash_handler.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/openthread/src/legacy_hal/crash_handler.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/openthread/src/legacy_hal/crash_handler.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/openthread/src/legacy_hal/crash_handler.o

$(OUTPUT_DIR)/sdk/protocol/openthread/src/legacy_hal/diagnostic.o: $(SDK_PATH)/protocol/openthread/src/legacy_hal/diagnostic.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/openthread/src/legacy_hal/diagnostic.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/openthread/src/legacy_hal/diagnostic.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/openthread/src/legacy_hal/diagnostic.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/openthread/src/legacy_hal/diagnostic.o

$(OUTPUT_DIR)/sdk/util/plugin/security_manager/security_manager.o: $(SDK_PATH)/util/plugin/security_manager/security_manager.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/plugin/security_manager/security_manager.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/plugin/security_manager/security_manager.c
CDEPS += $(OUTPUT_DIR)/sdk/util/plugin/security_manager/security_manager.d
OBJS += $(OUTPUT_DIR)/sdk/util/plugin/security_manager/security_manager.o

$(OUTPUT_DIR)/sdk/util/silicon_labs/silabs_core/queue/circular_queue.o: $(SDK_PATH)/util/silicon_labs/silabs_core/queue/circular_queue.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/silicon_labs/silabs_core/queue/circular_queue.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/silicon_labs/silabs_core/queue/circular_queue.c
CDEPS += $(OUTPUT_DIR)/sdk/util/silicon_labs/silabs_core/queue/circular_queue.d
OBJS += $(OUTPUT_DIR)/sdk/util/silicon_labs/silabs_core/queue/circular_queue.o

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

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/aes.o: $(SDK_PATH)/util/third_party/mbedtls/library/aes.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/aes.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/aes.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/aes.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/aes.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/asn1parse.o: $(SDK_PATH)/util/third_party/mbedtls/library/asn1parse.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/asn1parse.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/asn1parse.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/asn1parse.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/asn1parse.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/asn1write.o: $(SDK_PATH)/util/third_party/mbedtls/library/asn1write.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/asn1write.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/asn1write.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/asn1write.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/asn1write.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/base64.o: $(SDK_PATH)/util/third_party/mbedtls/library/base64.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/base64.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/base64.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/base64.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/base64.o

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

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/block_cipher.o: $(SDK_PATH)/util/third_party/mbedtls/library/block_cipher.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/block_cipher.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/block_cipher.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/block_cipher.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/block_cipher.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ccm.o: $(SDK_PATH)/util/third_party/mbedtls/library/ccm.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/ccm.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/ccm.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ccm.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ccm.o

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

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/cmac.o: $(SDK_PATH)/util/third_party/mbedtls/library/cmac.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/cmac.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/cmac.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/cmac.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/cmac.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/constant_time.o: $(SDK_PATH)/util/third_party/mbedtls/library/constant_time.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/constant_time.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/constant_time.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/constant_time.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/constant_time.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ctr_drbg.o: $(SDK_PATH)/util/third_party/mbedtls/library/ctr_drbg.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/ctr_drbg.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/ctr_drbg.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ctr_drbg.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ctr_drbg.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ecdsa.o: $(SDK_PATH)/util/third_party/mbedtls/library/ecdsa.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/ecdsa.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/ecdsa.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ecdsa.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ecdsa.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ecjpake.o: $(SDK_PATH)/util/third_party/mbedtls/library/ecjpake.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/ecjpake.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/ecjpake.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ecjpake.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ecjpake.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ecp.o: $(SDK_PATH)/util/third_party/mbedtls/library/ecp.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/ecp.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/ecp.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ecp.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ecp.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ecp_curves.o: $(SDK_PATH)/util/third_party/mbedtls/library/ecp_curves.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/ecp_curves.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/ecp_curves.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ecp_curves.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ecp_curves.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ecp_curves_new.o: $(SDK_PATH)/util/third_party/mbedtls/library/ecp_curves_new.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/ecp_curves_new.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/ecp_curves_new.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ecp_curves_new.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ecp_curves_new.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/entropy.o: $(SDK_PATH)/util/third_party/mbedtls/library/entropy.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/entropy.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/entropy.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/entropy.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/entropy.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/entropy_poll.o: $(SDK_PATH)/util/third_party/mbedtls/library/entropy_poll.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/entropy_poll.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/entropy_poll.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/entropy_poll.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/entropy_poll.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/hmac_drbg.o: $(SDK_PATH)/util/third_party/mbedtls/library/hmac_drbg.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/hmac_drbg.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/hmac_drbg.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/hmac_drbg.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/hmac_drbg.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/md.o: $(SDK_PATH)/util/third_party/mbedtls/library/md.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/md.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/md.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/md.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/md.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/oid.o: $(SDK_PATH)/util/third_party/mbedtls/library/oid.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/oid.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/oid.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/oid.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/oid.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/pem.o: $(SDK_PATH)/util/third_party/mbedtls/library/pem.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/pem.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/pem.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/pem.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/pem.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/pk.o: $(SDK_PATH)/util/third_party/mbedtls/library/pk.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/pk.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/pk.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/pk.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/pk.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/pk_ecc.o: $(SDK_PATH)/util/third_party/mbedtls/library/pk_ecc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/pk_ecc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/pk_ecc.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/pk_ecc.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/pk_ecc.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/pk_wrap.o: $(SDK_PATH)/util/third_party/mbedtls/library/pk_wrap.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/pk_wrap.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/pk_wrap.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/pk_wrap.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/pk_wrap.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/pkparse.o: $(SDK_PATH)/util/third_party/mbedtls/library/pkparse.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/pkparse.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/pkparse.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/pkparse.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/pkparse.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/pkwrite.o: $(SDK_PATH)/util/third_party/mbedtls/library/pkwrite.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/pkwrite.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/pkwrite.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/pkwrite.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/pkwrite.o

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

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/sha256.o: $(SDK_PATH)/util/third_party/mbedtls/library/sha256.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/sha256.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/sha256.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/sha256.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/sha256.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ssl_cache.o: $(SDK_PATH)/util/third_party/mbedtls/library/ssl_cache.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/ssl_cache.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/ssl_cache.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ssl_cache.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ssl_cache.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ssl_ciphersuites.o: $(SDK_PATH)/util/third_party/mbedtls/library/ssl_ciphersuites.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/ssl_ciphersuites.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/ssl_ciphersuites.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ssl_ciphersuites.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ssl_ciphersuites.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ssl_client.o: $(SDK_PATH)/util/third_party/mbedtls/library/ssl_client.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/ssl_client.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/ssl_client.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ssl_client.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ssl_client.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ssl_cookie.o: $(SDK_PATH)/util/third_party/mbedtls/library/ssl_cookie.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/ssl_cookie.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/ssl_cookie.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ssl_cookie.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ssl_cookie.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ssl_debug_helpers_generated.o: $(SDK_PATH)/util/third_party/mbedtls/library/ssl_debug_helpers_generated.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/ssl_debug_helpers_generated.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/ssl_debug_helpers_generated.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ssl_debug_helpers_generated.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ssl_debug_helpers_generated.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ssl_msg.o: $(SDK_PATH)/util/third_party/mbedtls/library/ssl_msg.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/ssl_msg.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/ssl_msg.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ssl_msg.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ssl_msg.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ssl_ticket.o: $(SDK_PATH)/util/third_party/mbedtls/library/ssl_ticket.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/ssl_ticket.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/ssl_ticket.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ssl_ticket.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ssl_ticket.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ssl_tls.o: $(SDK_PATH)/util/third_party/mbedtls/library/ssl_tls.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/ssl_tls.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/ssl_tls.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ssl_tls.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ssl_tls.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ssl_tls12_client.o: $(SDK_PATH)/util/third_party/mbedtls/library/ssl_tls12_client.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/ssl_tls12_client.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/ssl_tls12_client.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ssl_tls12_client.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ssl_tls12_client.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ssl_tls12_server.o: $(SDK_PATH)/util/third_party/mbedtls/library/ssl_tls12_server.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/ssl_tls12_server.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/ssl_tls12_server.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ssl_tls12_server.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ssl_tls12_server.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/threading.o: $(SDK_PATH)/util/third_party/mbedtls/library/threading.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/threading.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/threading.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/threading.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/threading.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/x509.o: $(SDK_PATH)/util/third_party/mbedtls/library/x509.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/x509.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/x509.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/x509.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/x509.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/x509_create.o: $(SDK_PATH)/util/third_party/mbedtls/library/x509_create.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/x509_create.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/x509_create.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/x509_create.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/x509_create.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/x509_crl.o: $(SDK_PATH)/util/third_party/mbedtls/library/x509_crl.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/x509_crl.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/x509_crl.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/x509_crl.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/x509_crl.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/x509_crt.o: $(SDK_PATH)/util/third_party/mbedtls/library/x509_crt.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/x509_crt.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/x509_crt.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/x509_crt.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/x509_crt.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/x509_csr.o: $(SDK_PATH)/util/third_party/mbedtls/library/x509_csr.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/x509_csr.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/x509_csr.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/x509_csr.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/x509_csr.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/x509write.o: $(SDK_PATH)/util/third_party/mbedtls/library/x509write.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/x509write.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/x509write.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/x509write.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/x509write.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/x509write_crt.o: $(SDK_PATH)/util/third_party/mbedtls/library/x509write_crt.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/x509write_crt.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/x509write_crt.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/x509write_crt.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/x509write_crt.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/x509write_csr.o: $(SDK_PATH)/util/third_party/mbedtls/library/x509write_csr.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/x509write_csr.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/x509write_csr.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/x509write_csr.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/x509write_csr.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/examples/platforms/utils/debug_uart.o: $(SDK_PATH)/util/third_party/openthread/examples/platforms/utils/debug_uart.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/examples/platforms/utils/debug_uart.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/examples/platforms/utils/debug_uart.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/examples/platforms/utils/debug_uart.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/examples/platforms/utils/debug_uart.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/examples/platforms/utils/link_metrics.o: $(SDK_PATH)/util/third_party/openthread/examples/platforms/utils/link_metrics.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/examples/platforms/utils/link_metrics.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/examples/platforms/utils/link_metrics.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/examples/platforms/utils/link_metrics.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/examples/platforms/utils/link_metrics.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/examples/platforms/utils/mac_frame.o: $(SDK_PATH)/util/third_party/openthread/examples/platforms/utils/mac_frame.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/examples/platforms/utils/mac_frame.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/examples/platforms/utils/mac_frame.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/examples/platforms/utils/mac_frame.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/examples/platforms/utils/mac_frame.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/examples/platforms/utils/settings_ram.o: $(SDK_PATH)/util/third_party/openthread/examples/platforms/utils/settings_ram.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/examples/platforms/utils/settings_ram.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/examples/platforms/utils/settings_ram.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/examples/platforms/utils/settings_ram.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/examples/platforms/utils/settings_ram.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/examples/platforms/utils/uart_rtt.o: $(SDK_PATH)/util/third_party/openthread/examples/platforms/utils/uart_rtt.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/examples/platforms/utils/uart_rtt.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/examples/platforms/utils/uart_rtt.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/examples/platforms/utils/uart_rtt.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/examples/platforms/utils/uart_rtt.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/api/diags_api.o: $(SDK_PATH)/util/third_party/openthread/src/core/api/diags_api.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/api/diags_api.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/api/diags_api.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/api/diags_api.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/api/diags_api.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/api/error_api.o: $(SDK_PATH)/util/third_party/openthread/src/core/api/error_api.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/api/error_api.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/api/error_api.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/api/error_api.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/api/error_api.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/api/instance_api.o: $(SDK_PATH)/util/third_party/openthread/src/core/api/instance_api.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/api/instance_api.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/api/instance_api.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/api/instance_api.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/api/instance_api.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/api/link_raw_api.o: $(SDK_PATH)/util/third_party/openthread/src/core/api/link_raw_api.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/api/link_raw_api.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/api/link_raw_api.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/api/link_raw_api.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/api/link_raw_api.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/api/logging_api.o: $(SDK_PATH)/util/third_party/openthread/src/core/api/logging_api.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/api/logging_api.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/api/logging_api.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/api/logging_api.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/api/logging_api.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/api/random_noncrypto_api.o: $(SDK_PATH)/util/third_party/openthread/src/core/api/random_noncrypto_api.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/api/random_noncrypto_api.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/api/random_noncrypto_api.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/api/random_noncrypto_api.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/api/random_noncrypto_api.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/api/tasklet_api.o: $(SDK_PATH)/util/third_party/openthread/src/core/api/tasklet_api.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/api/tasklet_api.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/api/tasklet_api.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/api/tasklet_api.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/api/tasklet_api.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/common/binary_search.o: $(SDK_PATH)/util/third_party/openthread/src/core/common/binary_search.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/common/binary_search.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/common/binary_search.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/common/binary_search.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/common/binary_search.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/common/error.o: $(SDK_PATH)/util/third_party/openthread/src/core/common/error.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/common/error.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/common/error.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/common/error.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/common/error.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/common/frame_builder.o: $(SDK_PATH)/util/third_party/openthread/src/core/common/frame_builder.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/common/frame_builder.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/common/frame_builder.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/common/frame_builder.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/common/frame_builder.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/common/log.o: $(SDK_PATH)/util/third_party/openthread/src/core/common/log.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/common/log.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/common/log.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/common/log.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/common/log.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/common/random.o: $(SDK_PATH)/util/third_party/openthread/src/core/common/random.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/common/random.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/common/random.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/common/random.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/common/random.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/common/string.o: $(SDK_PATH)/util/third_party/openthread/src/core/common/string.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/common/string.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/common/string.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/common/string.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/common/string.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/common/tasklet.o: $(SDK_PATH)/util/third_party/openthread/src/core/common/tasklet.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/common/tasklet.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/common/tasklet.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/common/tasklet.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/common/tasklet.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/common/timer.o: $(SDK_PATH)/util/third_party/openthread/src/core/common/timer.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/common/timer.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/common/timer.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/common/timer.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/common/timer.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/common/uptime.o: $(SDK_PATH)/util/third_party/openthread/src/core/common/uptime.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/common/uptime.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/common/uptime.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/common/uptime.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/common/uptime.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/crypto/aes_ccm.o: $(SDK_PATH)/util/third_party/openthread/src/core/crypto/aes_ccm.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/crypto/aes_ccm.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/crypto/aes_ccm.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/crypto/aes_ccm.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/crypto/aes_ccm.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/crypto/aes_ecb.o: $(SDK_PATH)/util/third_party/openthread/src/core/crypto/aes_ecb.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/crypto/aes_ecb.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/crypto/aes_ecb.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/crypto/aes_ecb.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/crypto/aes_ecb.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/crypto/crypto_platform.o: $(SDK_PATH)/util/third_party/openthread/src/core/crypto/crypto_platform.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/crypto/crypto_platform.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/crypto/crypto_platform.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/crypto/crypto_platform.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/crypto/crypto_platform.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/crypto/storage.o: $(SDK_PATH)/util/third_party/openthread/src/core/crypto/storage.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/crypto/storage.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/crypto/storage.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/crypto/storage.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/crypto/storage.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/diags/factory_diags.o: $(SDK_PATH)/util/third_party/openthread/src/core/diags/factory_diags.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/diags/factory_diags.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/diags/factory_diags.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/diags/factory_diags.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/diags/factory_diags.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/instance/instance.o: $(SDK_PATH)/util/third_party/openthread/src/core/instance/instance.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/instance/instance.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/instance/instance.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/instance/instance.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/instance/instance.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/mac/link_raw.o: $(SDK_PATH)/util/third_party/openthread/src/core/mac/link_raw.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/mac/link_raw.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/mac/link_raw.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/mac/link_raw.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/mac/link_raw.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/mac/mac_frame.o: $(SDK_PATH)/util/third_party/openthread/src/core/mac/mac_frame.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/mac/mac_frame.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/mac/mac_frame.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/mac/mac_frame.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/mac/mac_frame.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/mac/mac_header_ie.o: $(SDK_PATH)/util/third_party/openthread/src/core/mac/mac_header_ie.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/mac/mac_header_ie.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/mac/mac_header_ie.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/mac/mac_header_ie.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/mac/mac_header_ie.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/mac/mac_types.o: $(SDK_PATH)/util/third_party/openthread/src/core/mac/mac_types.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/mac/mac_types.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/mac/mac_types.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/mac/mac_types.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/mac/mac_types.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/mac/sub_mac.o: $(SDK_PATH)/util/third_party/openthread/src/core/mac/sub_mac.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/mac/sub_mac.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/mac/sub_mac.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/mac/sub_mac.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/mac/sub_mac.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/mac/sub_mac_callbacks.o: $(SDK_PATH)/util/third_party/openthread/src/core/mac/sub_mac_callbacks.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/mac/sub_mac_callbacks.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/mac/sub_mac_callbacks.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/mac/sub_mac_callbacks.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/mac/sub_mac_callbacks.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/mac/sub_mac_csl_receiver.o: $(SDK_PATH)/util/third_party/openthread/src/core/mac/sub_mac_csl_receiver.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/mac/sub_mac_csl_receiver.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/mac/sub_mac_csl_receiver.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/mac/sub_mac_csl_receiver.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/mac/sub_mac_csl_receiver.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/radio/radio.o: $(SDK_PATH)/util/third_party/openthread/src/core/radio/radio.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/radio/radio.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/radio/radio.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/radio/radio.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/radio/radio.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/radio/radio_callbacks.o: $(SDK_PATH)/util/third_party/openthread/src/core/radio/radio_callbacks.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/radio/radio_callbacks.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/radio/radio_callbacks.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/radio/radio_callbacks.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/radio/radio_callbacks.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/radio/radio_platform.o: $(SDK_PATH)/util/third_party/openthread/src/core/radio/radio_platform.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/radio/radio_platform.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/radio/radio_platform.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/radio/radio_platform.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/radio/radio_platform.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/thread/link_quality.o: $(SDK_PATH)/util/third_party/openthread/src/core/thread/link_quality.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/thread/link_quality.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/thread/link_quality.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/thread/link_quality.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/thread/link_quality.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/utils/parse_cmdline.o: $(SDK_PATH)/util/third_party/openthread/src/core/utils/parse_cmdline.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/utils/parse_cmdline.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/utils/parse_cmdline.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/utils/parse_cmdline.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/utils/parse_cmdline.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/utils/power_calibration.o: $(SDK_PATH)/util/third_party/openthread/src/core/utils/power_calibration.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/core/utils/power_calibration.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/core/utils/power_calibration.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/utils/power_calibration.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/core/utils/power_calibration.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/lib/hdlc/hdlc.o: $(SDK_PATH)/util/third_party/openthread/src/lib/hdlc/hdlc.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/lib/hdlc/hdlc.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/lib/hdlc/hdlc.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/lib/hdlc/hdlc.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/lib/hdlc/hdlc.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/lib/spinel/logger.o: $(SDK_PATH)/util/third_party/openthread/src/lib/spinel/logger.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/lib/spinel/logger.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/lib/spinel/logger.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/lib/spinel/logger.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/lib/spinel/logger.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/lib/spinel/radio_spinel.o: $(SDK_PATH)/util/third_party/openthread/src/lib/spinel/radio_spinel.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/lib/spinel/radio_spinel.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/lib/spinel/radio_spinel.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/lib/spinel/radio_spinel.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/lib/spinel/radio_spinel.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/lib/spinel/spinel.o: $(SDK_PATH)/util/third_party/openthread/src/lib/spinel/spinel.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/lib/spinel/spinel.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/lib/spinel/spinel.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/lib/spinel/spinel.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/lib/spinel/spinel.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/lib/spinel/spinel_buffer.o: $(SDK_PATH)/util/third_party/openthread/src/lib/spinel/spinel_buffer.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/lib/spinel/spinel_buffer.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/lib/spinel/spinel_buffer.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/lib/spinel/spinel_buffer.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/lib/spinel/spinel_buffer.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/lib/spinel/spinel_decoder.o: $(SDK_PATH)/util/third_party/openthread/src/lib/spinel/spinel_decoder.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/lib/spinel/spinel_decoder.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/lib/spinel/spinel_decoder.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/lib/spinel/spinel_decoder.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/lib/spinel/spinel_decoder.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/lib/spinel/spinel_driver.o: $(SDK_PATH)/util/third_party/openthread/src/lib/spinel/spinel_driver.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/lib/spinel/spinel_driver.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/lib/spinel/spinel_driver.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/lib/spinel/spinel_driver.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/lib/spinel/spinel_driver.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/lib/spinel/spinel_encoder.o: $(SDK_PATH)/util/third_party/openthread/src/lib/spinel/spinel_encoder.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/lib/spinel/spinel_encoder.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/lib/spinel/spinel_encoder.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/lib/spinel/spinel_encoder.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/lib/spinel/spinel_encoder.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/lib/spinel/spinel_helper.o: $(SDK_PATH)/util/third_party/openthread/src/lib/spinel/spinel_helper.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/lib/spinel/spinel_helper.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/lib/spinel/spinel_helper.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/lib/spinel/spinel_helper.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/lib/spinel/spinel_helper.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/lib/spinel/spinel_prop_codec.o: $(SDK_PATH)/util/third_party/openthread/src/lib/spinel/spinel_prop_codec.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/lib/spinel/spinel_prop_codec.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/lib/spinel/spinel_prop_codec.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/lib/spinel/spinel_prop_codec.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/lib/spinel/spinel_prop_codec.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/ncp/changed_props_set.o: $(SDK_PATH)/util/third_party/openthread/src/ncp/changed_props_set.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/ncp/changed_props_set.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/ncp/changed_props_set.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/ncp/changed_props_set.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/ncp/changed_props_set.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/ncp/multipan_platform.o: $(SDK_PATH)/util/third_party/openthread/src/ncp/multipan_platform.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/ncp/multipan_platform.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/ncp/multipan_platform.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/ncp/multipan_platform.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/ncp/multipan_platform.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/ncp/ncp_base.o: $(SDK_PATH)/util/third_party/openthread/src/ncp/ncp_base.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/ncp/ncp_base.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/ncp/ncp_base.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/ncp/ncp_base.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/ncp/ncp_base.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/ncp/ncp_base_dispatcher.o: $(SDK_PATH)/util/third_party/openthread/src/ncp/ncp_base_dispatcher.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/ncp/ncp_base_dispatcher.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/ncp/ncp_base_dispatcher.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/ncp/ncp_base_dispatcher.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/ncp/ncp_base_dispatcher.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/ncp/ncp_base_ftd.o: $(SDK_PATH)/util/third_party/openthread/src/ncp/ncp_base_ftd.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/ncp/ncp_base_ftd.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/ncp/ncp_base_ftd.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/ncp/ncp_base_ftd.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/ncp/ncp_base_ftd.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/ncp/ncp_base_mtd.o: $(SDK_PATH)/util/third_party/openthread/src/ncp/ncp_base_mtd.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/ncp/ncp_base_mtd.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/ncp/ncp_base_mtd.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/ncp/ncp_base_mtd.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/ncp/ncp_base_mtd.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/ncp/ncp_base_radio.o: $(SDK_PATH)/util/third_party/openthread/src/ncp/ncp_base_radio.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/ncp/ncp_base_radio.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/ncp/ncp_base_radio.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/ncp/ncp_base_radio.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/ncp/ncp_base_radio.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/ncp/ncp_hdlc.o: $(SDK_PATH)/util/third_party/openthread/src/ncp/ncp_hdlc.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/ncp/ncp_hdlc.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/ncp/ncp_hdlc.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/ncp/ncp_hdlc.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/ncp/ncp_hdlc.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/ncp/ncp_spi.o: $(SDK_PATH)/util/third_party/openthread/src/ncp/ncp_spi.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/ncp/ncp_spi.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/ncp/ncp_spi.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/ncp/ncp_spi.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/ncp/ncp_spi.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/ncp/platform/dnssd.o: $(SDK_PATH)/util/third_party/openthread/src/ncp/platform/dnssd.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/ncp/platform/dnssd.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/ncp/platform/dnssd.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/ncp/platform/dnssd.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/ncp/platform/dnssd.o

$(OUTPUT_DIR)/sdk/util/third_party/openthread/src/ncp/platform/infra_if.o: $(SDK_PATH)/util/third_party/openthread/src/ncp/platform/infra_if.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/src/ncp/platform/infra_if.cpp'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CXX) $(CXXFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/src/ncp/platform/infra_if.cpp
CXXDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/ncp/platform/infra_if.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/src/ncp/platform/infra_if.o

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

$(OUTPUT_DIR)/project/autogen/sl_ot_init.o: autogen/sl_ot_init.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_ot_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_ot_init.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_ot_init.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_ot_init.o

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

$(OUTPUT_DIR)/project/main.o: main.c
	@$(POSIX_TOOL_PATH)echo 'Building main.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ main.c
CDEPS += $(OUTPUT_DIR)/project/main.d
OBJS += $(OUTPUT_DIR)/project/main.o

# Automatically-generated Simplicity Studio Metadata
# Please do not edit or delete these lines!
# SIMPLICITY_STUDIO_METADATA=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=END_SIMPLICITY_STUDIO_METADATA
# END OF METADATA