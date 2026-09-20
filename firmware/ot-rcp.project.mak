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

# LOCAL: Silicon Labs' radio debug counters (board_config.h defaults them off).
C_DEFS += \
 '-DRADIO_CONFIG_DEBUG_COUNTERS_SUPPORT=1' \
 '-DOPENTHREAD_CONFIG_PLATFORM_ASSERT_MANAGEMENT=1'

C_DEFS += \
 '-DEFR32MG24A020F1024IM40=1' \
 '-DSL_CODE_COMPONENT_SYSTEM=system' \
 '-DSL_APP_PROPERTIES=1' \
 '-DSL_CODE_COMPONENT_CLOCK_MANAGER=clock_manager' \
 '-DSL_COMPONENT_CATALOG_PRESENT=1' \
 '-DSL_CODE_COMPONENT_DEVICE_PERIPHERAL=device_peripheral' \
 '-DSL_CODE_COMPONENT_DMADRV=dmadrv' \
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
 '-DOPENTHREAD_CONFIG_ENABLE_BUILTIN_MBEDTLS=0' \
 '-DOPENTHREAD_PROJECT_LIB_CONFIG_FILE="sl_openthread_features_config.h"' \
 '-DSPINEL_PLATFORM_HEADER="spinel_platform.h"' \
 '-D_GNU_SOURCE=1' \
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
 '-DSL_RAIL_LIB_MULTIPROTOCOL_SUPPORT=0' \
 '-DSL_RAIL_UTIL_PA_CONFIG_HEADER=<sl_rail_util_pa_config.h>' \
 '-DSL_CODE_COMPONENT_SE_MANAGER=se_manager' \
 '-DCIRCULAR_QUEUE_USE_LOCAL_CONFIG_HEADER=1' \
 '-DSL_CODE_COMPONENT_CORE=core' \
 '-DSL_CODE_COMPONENT_SLEEPTIMER=sleeptimer' \
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
 '-DOPENTHREAD_CONFIG_ENABLE_BUILTIN_MBEDTLS=0' \
 '-DOPENTHREAD_PROJECT_LIB_CONFIG_FILE="sl_openthread_features_config.h"' \
 '-DSPINEL_PLATFORM_HEADER="spinel_platform.h"' \
 '-D_GNU_SOURCE=1' \
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
 '-DSL_RAIL_LIB_MULTIPROTOCOL_SUPPORT=0' \
 '-DSL_RAIL_UTIL_PA_CONFIG_HEADER=<sl_rail_util_pa_config.h>' \
 '-DSL_CODE_COMPONENT_SE_MANAGER=se_manager' \
 '-DCIRCULAR_QUEUE_USE_LOCAL_CONFIG_HEADER=1' \
 '-DSL_CODE_COMPONENT_CORE=core' \
 '-DSL_CODE_COMPONENT_SLEEPTIMER=sleeptimer' \
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
 -I$(SDK_PATH)/platform/bootloader \
 -I$(SDK_PATH)/platform/bootloader/api \
 -I$(SDK_PATH)/platform/bootloader/core/flash \
 -I$(SDK_PATH)/platform/service/clock_manager/inc \
 -I$(SDK_PATH)/platform/service/clock_manager/src \
 -I$(SDK_PATH)/platform/CMSIS/Core/Include \
 -I$(SDK_PATH)/platform/service/device_manager/inc \
 -I$(SDK_PATH)/platform/service/device_init/inc \
 -I$(SDK_PATH)/platform/emdrv/dmadrv/inc \
 -I$(SDK_PATH)/platform/emdrv/dmadrv/inc/s2_signals \
 -I$(SDK_PATH)/platform/emdrv/common/inc \
 -I$(SDK_PATH)/platform/emlib/inc \
 -I$(SDK_PATH)/platform/driver/gpio/inc \
 -I$(SDK_PATH)/platform/peripheral/inc \
 -I$(SDK_PATH)/platform/service/interrupt_manager/inc \
 -I$(SDK_PATH)/platform/service/interrupt_manager/src \
 -I$(SDK_PATH)/platform/service/interrupt_manager/inc/arm \
 -I$(SDK_PATH)/platform/service/iostream/inc \
 -I$(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/config \
 -I$(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/config/preset \
 -I$(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/inc \
 -I$(SDK_PATH)/util/third_party/mbedtls/include \
 -I$(SDK_PATH)/util/third_party/mbedtls/library \
 -I$(SDK_PATH)/platform/service/memory_manager/inc \
 -I$(SDK_PATH)/platform/service/memory_manager/src \
 -I$(SDK_PATH)/platform/service/mpu/inc \
 -I$(SDK_PATH)/platform/emdrv/nvm3/inc \
 -I$(SDK_PATH)/platform/emdrv/nvm3/config \
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
 -I$(SDK_PATH)/protocol/openthread/include \
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
 -I$(SDK_PATH)/platform/security/sl_component/sl_protocol_crypto/src \
 -I$(SDK_PATH)/platform/security/sl_component/sli_psec_osal/inc

GROUP_START =-Wl,--start-group
GROUP_END =-Wl,--end-group

PROJECT_LIBS = \
 -lstdc++ \
 -lgcc \
 -lc \
 -lm \
 -lnosys \
 $(SDK_PATH)/protocol/openthread/libs/libsl_openthread_cm33_gcc.a \
 $(SDK_PATH)/platform/radio/rail_lib/autogen/librail_release/librail_efr32xg24_gcc_release.a

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

$(OUTPUT_DIR)/sdk/platform/common/src/sl_assert.o: $(SDK_PATH)/platform/common/src/sl_assert.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/common/src/sl_assert.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/common/src/sl_assert.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_assert.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_assert.o

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

$(OUTPUT_DIR)/sdk/platform/common/src/sl_string.o: $(SDK_PATH)/platform/common/src/sl_string.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/common/src/sl_string.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/common/src/sl_string.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_string.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_string.o

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

$(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream.o: $(SDK_PATH)/platform/service/iostream/src/sl_iostream.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/iostream/src/sl_iostream.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/iostream/src/sl_iostream.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream.o

$(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_uart.o: $(SDK_PATH)/platform/service/iostream/src/sl_iostream_uart.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/iostream/src/sl_iostream_uart.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/iostream/src/sl_iostream_uart.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_uart.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_uart.o

$(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_usart.o: $(SDK_PATH)/platform/service/iostream/src/sl_iostream_usart.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/iostream/src/sl_iostream_usart.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/iostream/src/sl_iostream_usart.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_usart.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/iostream/src/sl_iostream_usart.o

$(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/faults.o: $(SDK_PATH)/platform/service/legacy_hal/src/faults.s
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/legacy_hal/src/faults.s'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(ASMFLAGS) -c -o $@ $(SDK_PATH)/platform/service/legacy_hal/src/faults.s
ASMDEPS_s += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/faults.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/faults.o

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

$(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_process_action.o: $(SDK_PATH)/platform/service/sl_main/src/sl_main_process_action.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/sl_main/src/sl_main_process_action.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/sl_main/src/sl_main_process_action.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_process_action.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sl_main/src/sl_main_process_action.o

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

$(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/iostream_uart.o: override/iostream_uart.c
	@$(POSIX_TOOL_PATH)echo 'Building override/iostream_uart.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ override/iostream_uart.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/iostream_uart.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/iostream_uart.o

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

# LOCAL: emlib watchdog driver (not part of the generated project)
$(OUTPUT_DIR)/sdk/platform/emlib/src/em_wdog.o: $(SDK_PATH)/platform/emlib/src/em_wdog.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_wdog.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_wdog.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_wdog.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_wdog.o

# LOCAL: assert recorder
$(OUTPUT_DIR)/project/local/local_assert.o: local/local_assert.c
	@$(POSIX_TOOL_PATH)echo 'Building local/local_assert.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ local/local_assert.c
CDEPS += $(OUTPUT_DIR)/project/local/local_assert.d
OBJS += $(OUTPUT_DIR)/project/local/local_assert.o

# Local override of the SDK's radio.c (see firmware/override/README.md).
$(OUTPUT_DIR)/sdk/protocol/openthread/platform-abstraction/efr32/radio.o: override/radio.c
	@$(POSIX_TOOL_PATH)echo 'Building override/radio.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ override/radio.c
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

$(OUTPUT_DIR)/sdk/util/third_party/openthread/examples/apps/ncp/ncp.o: $(SDK_PATH)/util/third_party/openthread/examples/apps/ncp/ncp.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/openthread/examples/apps/ncp/ncp.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/openthread/examples/apps/ncp/ncp.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/examples/apps/ncp/ncp.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/openthread/examples/apps/ncp/ncp.o

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

$(OUTPUT_DIR)/project/autogen/sl_iostream_init_usart_instances.o: autogen/sl_iostream_init_usart_instances.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_iostream_init_usart_instances.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_iostream_init_usart_instances.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_iostream_init_usart_instances.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_iostream_init_usart_instances.o

$(OUTPUT_DIR)/project/autogen/sl_ot_init.o: autogen/sl_ot_init.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_ot_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_ot_init.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_ot_init.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_ot_init.o

$(OUTPUT_DIR)/project/main.o: main.c
	@$(POSIX_TOOL_PATH)echo 'Building main.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ main.c
CDEPS += $(OUTPUT_DIR)/project/main.d
OBJS += $(OUTPUT_DIR)/project/main.o

# Automatically-generated Simplicity Studio Metadata
# Please do not edit or delete these lines!
# SIMPLICITY_STUDIO_METADATA=eJzsvWuP5TaWJfpXjPw4cObJjMx0uQx3Nea63D0elFGFsusCg86GwCPxnCOHXtYjHm70f78k9SIlStzk3op0XQxQZTsixLUW35vk5uZ/vfrb3//6v7//7ufo73/968+vvnn1X59e/f37v/zPn3/4f7+P9D99evXNp1efXv33qy+nFD/99R9//+77n0Sib//1Kc++eOB1k5bFv3x69e7N20+vvuBFXCZpcRW/+MfP//b660+v/vVPn4pvq7r8hcftFyJJ0XyTlwnPxBe3tq2+OZ0eHx/fNGnGzs2buMxPTXP6qe2StHzD47LmAlSkrnjdPv8Ui3+LdAPap1cC+osvvr2UWcLrLwqWyz/GZXFJr8PfVn+t6rSUX0x/l1+kGdf/Xqftc9TDvJm//6KrU/GB/PibU9m1p/6L0/jFaTvpadRy6sVM0jTiJotE5or2VnOWRBfO2q7mzYh12+Z3Jjxt0KVl04o0edQ1rG6jB1H2MLr9hFt0NUuzqGvFP6o2hRFtJbFSnFuhrGh5fWExj+LLLrj1Yxhs1NzFH7ywpxRbRRNnZXwf5axgV15HZROnWcbasoaVEiA1jFhUKg+hXKSzkhUP+fso4RfWZS2AY+NzK3TVsCiun6u2BABbP94qHq1f1UwMSN69cZnKShSnddxlrI5+7XgHqYDNBO6uVzeNd99bpNkiuVZ6q4dQbKTYIvj67d27jx+GMl0OtvtMrqSAMYt5D1kM0gHFBAfscuaXW4BNxrkYLHMOHDys32+B52eetBlwUlp/7IJN+EMKbTubabZIhg/TIm2jJE5iGM1Oqs3c8Lysn6fBEZabrTRWkiRnSf0AQF596G7nDReDShFDhe8nBBZRza/ChAwqqVVSKyWrqmiwIVOQTbWZANK6eN75Ny4zUU9jmIsLO5Z1bXnlxZaZ+6bJ4qhpWcu3DN03cT21ZvGfFqEDxWnGOq0SAS1bUZ5ZGrNW1lX7XHFrwYx8G99bi/7vP38ffVfmVVmIObfZhV1/uj0oD19FQgLLSns9anKtCbbQ+YP88MaKJOO1C3n1MQx1rzptHzuXCP23+wW88T0Y2yHa9r0TW/WttBCtVwxNcPnrZDCmfkE0J4RmaStxGKtXLi2JN1jTxZQeDZgOvr1kUKa2ZkVzKes8lNMKsGn2t6poXLWnfeZCctSI9tlmiaiFi1+525PsMpy7NGvTIoRpO6mVMUuLe2H6i9+8yZId+MV3VizJM0/XO2DLD93zbJPmciqSy4UmuY/u3t59fPPVm/eb20ti5S2bmTHrGl/8WU362t9XX/yUCsKy+As7N8Znqw+//7e/v7/78d/vPiw+WyOWXb3gtFgEzXPT8jzil/r9XX69+7Bq/6IATmMGT30+TprY06Tn1BOebIgnh4hWDEddRarCBrmUsTBgNgryhyLOusRZkhMTe3v39vLu7d2HNP/wdtWL4DkZeE/bwI5inRJGLM4rSiUTIFyBZYpCCTBnLSf/uatZTqpgQvTR0MbUGnpEsIY470gVDHhgfrmeJhUwAsIVCPziUtKKmDHhOnIm0jVxnVZtuV4ToOSsoOGqqiyj1TIAghVw4hbKPVsoV8YxrYQJEqzi0tQxbRudEMEarpVY7pNqmBA9NKS0xTACeimIqpK4SRioYC23C3WrmBA9NDxRS3jyU5De0bbKAQ/Oz4jnsBEQriBm8W29oYbSMEGCVdzz5yZm64UiRoaGCdaRifmOVMQI6KXg6cxoZ3Ed1FuJPEdNC2Kj2wYOV8bViROtoBkTroN8DM28x9CMegzNfMfQnKXZuXwiFaFhwnVU7HamXprpoHAlDe2gPuCB+au4oDUxRkC4gpp2uBjwfPijJr0WLCPXoeOC9YgFFGvjW8USUjkmLFwNP6LPGqhwLcRrtMZzjdYII8Hi64WSMEH6qKDe0JkhwSroZ1X/ObWjn1Q7/1mVfuHuv25/SBhtixgBwQoeE8vZNUbBCOhSkA++DRTkOpbr8GB53oCnt0GCzg4sv1z9av2LpStznpfF3llRWsSrMyLzCJK1ZZ462mHPcxJgJyPFaRf5bDnY3IE9p5bus3a9SHgUZ6xp0svgAOLDsZF8lzNFkm6m388pLzqHpWtmbfx+H1Vo4K6Bb1HbUwpXzchUfpUxpnAiV6nNF2Yfe0rjQq8dw9ASubYMNSs3y7ZOC8fYauLOKRzIWdp4VeCUwKWYtZ3DmF4qHlOc9gax9ZF57RyT+ja3e7I7aBFgJyOFu7blP1r+lPvgL9OBat8Df07hQJZbXlm29hzaw9bSQNqWD/SYYLcFuKaxc1m2WcnEb/amMtPncq8FmV/u52fmXjh1ntYofs2cVemeSOMWiIfG9LRKuVOp5l2Tpi1rdkWw6Qg7rLp7plaEu2PLgnYbwpFbXtdlLWdcL7pVSmiZerMYKcE1V7G6cc2AuxU3A3i3lnBSDcHBWvOGSyc312G7hc5M6tdH+/uDez5UF2G23Sz+U7ZSK1gWqe/BHUzyn1SSkx1ltZRwEEMLb594XV/WFcxSi/Tz91Ogp0JNIaJtu9zmjDtp+5W+tlAsloRxxc3qD2pkfVB4MtJN5oUVbLfy1cJilSy6MUcV7OnYQ3SI2UgZNXekxaJhegmiEhFQLaQ1ElQZxPWwVQUbg4RjPwLUswLKb1yuWcH82g4RO4A4pWK2ADkryz1dDheSyMbQ8XKelAprnqaCsX0ucVzVO3yv/HvwtCMMkFWYsml147XoyXhuE+yY/miULqhFLiQPnWGJ41NLeNotZ66tm3ouxyEQ6Ya7kLtl4KlNMG8F6lqdY8nmqWOG9G+nqtEsF/37TbXfk3+6uq4IbOSiZ1y2WxPUPx89FjgjWuHJWReXo4HbXjcreLrpQk66ZHPFfNMaatFoCReD5xILOjSM93GJFMxQh47fU269OrUSvRjUdCDPMiPhtrppB7VQte6tu6qF2TT20jZ3/Yy7XdZSifMmbaJC5Cd6SOu2gw73K7GqbJjclLUigq8wmTW2osGo28Lzb+mAMSKl0z6uvgDiASUIO3FwqdnHpegNw8Vf/GA9IgEzPHw95VNL7SzrKdYUc50YuegmCDhnQ0DaWFmpBv+pLGEdYVQ59l0ttXPpiqJKfbgWVYbK2gQBzl84qQXDs60hs2r3UQoaLMxAK/ghw8SDdSozzdi11kiuQl4EjUmexZ/EXCpPFuqH3l+DTM8WurP5rWIAKe+JcF07iJ7lVfOW1VcOHAlBhaRDepYMrI+AigTSQZeFWFVvxP/JCmLC89RRlWWGbyMO1ABNxGKCWuuVtkPPgMdM4QTNe5gI0K17yCqZBA3Qd/wTIwQv2iG4V1uXwEWUVRUMnGLSrDqCmbKCbz2Ib6dWWx27zSDwgVUgNI2toaJayWf8yuJnuY2FLGAVUrR5s4wSY83JTKoKeU5KVcJLZwW52Hvv2l9IUnYthMnn8uq15EJWy0hzMnFCdhNYA1wMLCQM6XaHBH7J399FwpCqgacDC45F+l0u9dVriIfrBtkSAMDmsf9uJdvYbLdxhbM48ZVzzuuEX4I4jNS7PCPS6xuX3iVBbBYMgoFJjnIsLQiGfYHi4WcypJhGfz21c9YfPx7mRRyjBuKe5JeJQBVpMttRQHmu6jLmTROxGL7os2V7jXPQnDvVqlc5jbOvntq7TaAYkRUTzL3GIeniY4xkfC+fsaCtb/x+9snWEVylq8V3Vn49/aVCNPUCzFNFH6uKRsSE5amBqA5MLOf4ZyaEtvMFvQ3mmPFHa2u+UqfbKTqCR/kEEi4h/Lu/yxX1ux9/+uGnPUfU75xOx1thBC3HiLDLUUrTSRJPFxfXyXcLv/98eM0lkExLvcvV/qaW3fzJMa1ZiMykgBxdY8cqaTM3Q8p9DnVtKH//3p9DT7lvwot1Pavzh6+9OYyU9B2B50n9sNcR+vDzyDmzB9kfqJWSIdq9GiPnRIes1Ju7MYiEc63eR+AHhbIwcqFGs4nmtMYJWa8PxeKnYk5EYEpZbjT7T0zcff2nz4V2n5FvXPwJyYR8nAaZBf19G0hO5PcqH8uEu0OH/NgbHYQaXXnBa9cOlE27ltDNAohtZuPYjF+2ZnBaYTZ8iJf++CHk4s4Gx9ZtHRuT23nXRgJy1VVflmf54po/w5zOzVE5b6PZGMZUbvy2dl7osxFMydwM8q4TaJQ3GaZkB7hNLV7SkgNi1MdUh8ypSqecUfdh3KOQLxcIdejo3vmYkvn0YG+WG/ii39wXvUlAVyL0nujNMKcD9mBvhjEVtH95E0zJAhzTzdckd5qi/cWfLW36O3fr54U29QUY6Vl63jPSHdEaeA7ZrVEsqrz173fuBIvPZLhwOOjw9T4k94LkEEj3HSID035XaAmqgorCQcfP90FlkEE45vD1PqSM2geHHL7eh6y9qqiGVFEfoskDdU6wDwzYIjRwN7YBl7AAr1ID1upBCvF9h3Vsx4glhagFVL71xMCqY99SxwsTBur4uXu08MC03iBYQ6r9MeY0a01kLdEOgdyK9NNtptjXDonzZOgGhXlSdey0X40W4QrZITMEOFc3yxgSOEqODiy/dIVPC9ZS7EODNkIN6M3Nz3VxuAJSLQrDGY9q+Aq6Jl+Ab6/IbdMrHNt+i8c2vcIx7Zc8rdMrHNQe4ts2vcIxrRF/LZD+A5CZyD1/w5GtMXpt87dHf4O0AUgEVwN1Kz7rhmHgBTwkgAAH9Ld1QogFAsffOvayWiBwWOu9Au+lSFKnD/shwGT3xh+xu032XslJfjie6G4Y7kTnqO5hTpc0HJ1uDHYEi8L5XjAutmh//u4YY2ayMWNasl0DSn3oLjo7AWCqGL6ExG62c2yFaN5mAY33e2SwsV+7+B2QO2tqH7aQXO6B+C183PEnp/axO0poAodBQk8HblcBHHbHmoCgWXEnH7rf3f7RXi92DL3zo+tNV8n3itwOzda9M8tCaQRmccwzURoQJ7A+b8bzy6e1xvm57W2W5b7jjsAyL9JKuq26HmjA6FuQAOTJ91ePLTsbA/gI2jmFrzsQl9cyKum8WyePrHbsKoNzNHQyG7qzmEcwWikaqEsBV09dErJPgA7m6THl2Hnj24N+gQrVkDOn62CIiAEWqILHiegQ4p+Oc6EgLSa4u1X8UrF70g6iQQLLo7k5NrSDCmJAdfdM9dJ1/Vy1znhffp3TxAUOxAcIWQKHjby2lcr2KEczhYzO2TOooxTFiBQxl1OMF72G6OAWIxExt4bo4hYDEDW5BukeRfq7kTmdZaOqfonr0nFj74hLQYd0s999/IqeXwN1K/j47o5egQbqUHAl7wNXcB/gsZp3iPkXqF6zCekgaOL6zSaUQpbAsBJ5YFnnvrHoXyIzLmhWAzlF9ciWDUfbx5D1SF9kbe169WGzAGY9xpQ+IgIbQ48AuiXop2MB7CcHFoYiSNB2LAqLJDHZDKdwUcIrXiS8iJ0PRPgI2yGA9aG0lWHcXO5wcEkrUFgpDYV77tKsTQv10C5pIW3ge4kTiXTT4QB5awZvgWIYSWEBhEIFmgxeAhlnyRGyRlwvMeGr9l0tsFW7mUZdomi74D2lXUEGuJesWG0EH6FpRoYJamtWNBWrBfaB4nZZgoXenK66eJm3DZ9esEjynrnDESySusduU/hLPHDs3aeBSS0r9mt32NBnRfcSdmDxbTKElNwBo84WQYg88m5sh6fd7DMdARpm+WiR9+nxoLbumpYnsIejIFlX574NO+0xrCvGUjXHS3SxOGWq18fo9ExwloZrbx+gNRyJvk1oxBqOTNgOgd+q98KVnUcobQPc3+inLKwFbohJe4CcGRmzZjtA2JoBs+o9SKDflvxqwXWAqhz0srk5TUpPblnItIODDdxLFiiwW4ikzYhvbnv5mKLaZPAXSF9oVnS6HeatV7IC3V1mvCCDcvV8lInn3pycv+/fayQWMYF6KUGY/3taPIx+PdngM0QuR8P10hO807EnBry1oSciWE7uaQpYSy6T31iRZM4nuwO16eBeynAbkXuy/HYh9ZSsbbl8+P2Iilxgw2aJMXHO0uxcPpGI2gI+0q1GG5FDprnV82smnlcdJ/ySFoHT7Y4OHddLT/jkv6cGbi6tJipqKbYnkN0tHrXAXMrZRPYqnWkHRB3pURfTCt2vvMbk9OWlI/tZMDce34NCQwQU1xLcT9lBmgLVhG8U7KqB7xLYLDJqORquv6VHLea2EVrKx9Kj1hSwebJpjB2hTQcPtPSoZRnIwZYetaoFdpilRz6Ma8CkrmZ12ZaxfDhHedRR+ZuZqFHNkrQMv/+xgJt9rXZoANU2fk7gqrMhcIMBsldvIobuLsEKDtjMbbmh1bXBQNjg5UEFj6OyWb3FErY00vDCykID0M5SNEjQwc7wfXRmtSi19hAxJnhonXhfBFVtYu8WaC1GxmgZKMxyn9MSvHU9x0iw/bJTek4j6RimVUu6KhkLRZRfHLEddmnG5CCqPnpOpA5dIxlJ1rH42We2o4GEAJbK+9ywZ2PGr2FL0H3GvcWmQRrabkCNBtNiwM2FsK2ENhRcK/FoIuj24WgckLlonANd09A5W8fa32jx4lOvzIwSTiLhaQHimHbwfHtkwL1LzvnXb+/effwALaA5RZjuOf3JDgkpNUIRAAWwonzMz50zHvyYZfVxmHaV9LQCghQbmnWfElZOvz2yB3B3VB+HKVZJTysgSDmhWfcpgXES0oQ/suweWlTj92G6x9QnGxykzIjondzBCxcZZ9I1UfBL/f7O7TapPnu63j25nSfH4pTsUVPxOL24IoYtp0uR8qQYTxPvaRPW6Yd4hBqolK2GH1qlrGvLK7etSMy3Q9OzUljzjLPGOfaMn4/5+yCfghkTv2EehTXoOy0EnJwMZI2+yrrr6nFC+/JPHlL1V7Yi+ZDa7dk+mVk7gs162DawhlOC6P3XP374X7/t7xctBwyVn9OG4KlJfjjt0gF8ipeWyUtq3mMFS68vDS+k81h5/5Lad2nB4vVa++OPL9lGRjZMEzle8Q4pqoEcr3yPNaR5fHj7ks1jYkM0jxdQvEOKaR4voHyPNWj06MceL5sUP8XArq04BvtDNe+xEkwxh2rfpQ2fYl6sjYxs6CnmpVuIt/DNwf7F24e39NWg/1LNY2JDTzEv3Dz8hW8O9i/dPHakQy/T9diCMiofeF2nieuk3i8bmwRhe0sVey2yPtyDO2adpzJRsSju6gfeRO/eJme/w5ehREyplvrcIgI3wwXA3UspvdtWCmt1Emom7HcTQhrdQvgWrGMXcM4YpZAFIkDDSjq+KrdggSXSn6iRqrHBetYPnRC4hlVPOKCyQBy+Og+oRhBH2PCu4bYp9Pxg/B43bQmAkw3Rq8BFEpQJYBVBUJp10/gVp0yAK0+JcLJi+pSoSoMq0g0dBIXa8F87XsSWm5R7OZpS4Yp3gjltox/lprX80SwgqUMrkcVf21taJ2LUqPej+w9hF/fdutRpRP2879e15XkqZZ40NWPs5tOAetrwJTXBm+KdSN3YL8K5KfTkTqLHOm0RRFPyXaIza/hXH8JY5rS7FFvB2J34G/HWTfDtq7du/M37tWYRyadr9+74ugtqgQDIUfRYswqTrQlgn2wr5pObZSOekxlLJg7Mw5DQBT6YdcEcWnogVVTwRyzdiOGgTBp7qHoA05B0lyC3h4Ryouf2WE+m9u1I/wD1mzH9zW6ZXosucGSZ0wIoIvWyIYJnAoCQ5WVgvZjpgVTClAhszmuMXcoyDczWkHAXvNp4VdcJXtle112C2x87d2O7nzuv7iMeB46/c1oHBcJe0RI7SBC2ipbYVVjhc6KWeH/k2omd4R65tgNk2EiiqszsAUygTBPC/hzf1lFSn+0xJdzzvJZ6l+YmH3EI5zGS7/v8q3cKwljmtPtFVhZNy2RAnjQPbNYriF3C9lZzsQLcCPzhJDOS7/eiYcEZ2I201CCa7SA9YK7NkDwmYcMwXFrq/XVZJqa9zctw7nWZnnx/ii6ivLPfMnFPzVNawNJvPxoBcA24G3hg06QKIzQBIGTIHK5BoHYchm9I72PHIelGDA9KUSoPrEk3fNA9uQ0w8IocW7tbUPvzQx/Ror+JvBOhwj1L2IHAGwRhpCaAYybcDLcKmAK34qluT7ZRmleBVWnH8aFGtaRtLJd1FsjXWgOGGOAJP3dXZL7WGM6tkik+ztb7SKDNkiUKgBYzGC0R4CZ8GN0CYZcuy8vWfh/KyTMldWwGyeiUYQxzWhdF+JClJd4nqZq9CNFuHiO9k2o7VjaIaTM29opImvcbcYdATHN6J1VbsziwCxnJ9811lsiJN4xGS+zaMcANfQsA0PZEKBGoeY97JYEkU2LQUgpbeDaY/Zva8unmrI1uPKt4HTjeWUCcpLiMLhH2Ny+aLOpnVFQurTBO4jhLg5euZno3lbIxm040uAZZvrtwTiF52tgvDoJ4x9ROGpHw3XukBWLHAVJvBjr0oN0KZ2hQPn18+0dkja4g3M2JiZVS4Jafntyr3SL4FijQnhlOOKX3G32iKy94zVoeeDrjAAS13Tt07pco7uIuy/sU056m9O7xpwnc09USA4ux4fVDqIuCDcVNm8b3HFNvU3pIDlEZc5LIMSmMYUzpHjVjYYaHHpMtACBkgZvhemoITWAD0FMDaJrAhq2ndtIgjjGN5DAiXNkZEFBCTCkaEM4VxLiniRjarTBAYiyjTx43n1fzyeHmI2pbBYvwR7PCQImHh3DkelVN+EUZqQiqoX4MQGSovCYrW1eQTx9RFjywlOHVNbSEGQdKHex4t8aAUl4uif2ZDx/OEQRKuvm2iA/p1lsiW6TBPpNrDChluDudBQRKWoc6IK4xwF2GoLd45XHzGTrvsRuyrWYOulja7ajxm8TBx+4WEB9S1Kb8NlbgnIWWYcHDT5/Eokxkn4kDK2TA8Jo4sJwjiNfEgSXdeppgixS3PbgBBCYPPUFcY/hMlFjKjQcXdydKLOcIAp4oWZGUOcJ1YRvLZ65GUwNOcc2JFsvYeBXz0hRHs6/xfE17tISth5khMfPSIs66ZB0mEHS3bpU7thEdeTM7A/30MwO908Tq1LOlrngGBBdRU7xDEg0IAKKAY1kb2+YBrdV1E8c3Y7jI+ssyOLIJw0WmX5XDUS6QXMRdmiViYr3Y39+A0xo4DtJY/CvLsB1CR3ERxsiKHABcNDcm/nf3FsmloYAIqzKzP4blSTniOEkdj6Z50Hq9kEbRPcAdI/a24lZUsEez5eMkrH1998b+ohKczsBxkqrASiz5pWvaKONXFj/vvcPjoWIXOETWpRaGobebHkiYDu0lTdoyKnEPRCnNAu0trenkUpi3B8mzwHtJbBrPBcO+pAHOS4I6vSTUMOLBRFC1ZnDT1e5kYXlNKBf1eI0Ox6qhOAiVVwaObYJwUiFXDhvvxSxpbkjbZQBw0PDYdztqyTMiuImwrX+CcFL94r8xsib7ZWtjZO2Mj6Wy7iDanfCRVOC3TgOcvVdkWw7fC6or1ky/gsz0231ywfGMCC6i6XIvjk2HcVBmOXJQGgAcNMPXJKuANZaL3PPoakVoPbVakXzEsnyE0PC8rJ+jc3e5yHdZM7F6R9LaAR0yCmHMNaV0S0M2nwWQizYVptO95xXOFeUM4qCTQTVQVAOAg0aG10DRDAAuGs97JCsWyNtB1X3cvLOHU/QgGjEAZMheN0EAqP6Ap/oDhGqMHoBj01CAhAT2/goKSi0ZiKhHKBd1mT2/e/8W2340FBehegidRyyOeYMcNtdYLvIxdAOOVkNxENapGJWSd18hNzcNGBcldp2wcbK39LO+MeSJyYjgJpJRWLBUA4ab7D2a6j2M6CN2hpgxXGTYnSPYXtF8eQZLNsNAKPX7M3jmBRpEQH/BA0894QBIh+sQaNIZx0E6hw1CcRowLso0x/NNGA6yIYQ1jk0DcdDht1KBm6fTDQ002YgCI0S2TR0FRNggt1t0lJVnB+z9iYa5/CYwh0UC/gQ/ExqcTft9dvlkY8QLds544FpuJt/C9BI07MQnvOJFwos4DR2617o2oEPk3fNnQZvWO0+Phwtcg4dIbJ6LsngO3b7aFKfDHuwLITX4+UH0gtVTMmkhHXyrsgmf/LUysEP6yRFrkjxt0wdCOSaknxzZysQQJddJwZObRdIaFiarP25Hy5hhoLThG64GLdTnwnCyDnFnt7Cv0DxFFC1/ahvK/rIPHSaPuMG64cNkEnbzfWiYPJGwDlz2a0omFBgpxk1CY4W7QwwO16idQY3YY3NwckEeagvNbSABydPfCFrbhAIkbesuxg/YMwyMlsbg8rSsHljWEbDOMKBlBOSNldVSoxTGbb+S3n8FBej1vQln+XbsNe5H81jG6vx1nsY10DScZUzlqv1qev5mgbuu3A0dWWZ/LgirY8B16hArJVL+Ac/NW9ai/qK6FETQ7RSohBW0U43PEhioYm9VvPQLShltCYyAbuYCOLRAiYuNoW3N2wAX/XDmZmPJv+RuShnjr2iqErofBNWwRHZq8XIAAqrY9Qda8F8y8C1CIPuE6OQWK+uaRSnQfwdIr4M6FfQOFqT8M6SbHRzXDcq9EeptzdyJ9XLFgAsZKLsG6lSQldcr9bCvYbpLQAwXg3MLbSGYuE4dZUs8AI+ATmb1XB8p9YTo5IY7MwCpt10aFsxdAvTrBBIPeE7epkpfNxmDXpwGshuobg28lfYQbXvTQQHjbdOwK6/KEnjwAx50DVx3+xMfxjeW0g6ABqpbQ81pC2EEdNs/Ktphx6iNHwPWsrgFPbR9ZvH9uSy4st6hWxr7Ci2QzsupRoro0pLYqhuwzvukPGp43EHjnjg0GGgu6n4hJboW9K66g3yBB6MnbAlLQLgAImMFsjRdXgstCp4Nl/xJSsECCRVRFmkLvUEAFDFDOkXI4zh1X+0hhTtFuGRYQF1CaHZs4q0NmsWFL1YRdv8FHICcihVEl4sljKwFooa+wANd6KMh9jqSI6GE+mAkrGUNzapHg4KRUk2kCzggeVeJ/6JpWRZIlwiiLb7tnb0j9vU2t/OWZF6B+Z2cO2H6bfuIY8BnGnIDj+5C3T4v9FrdjdOMyCOOiy6V4X2e1ZMo9zQlbIF0iEjjvAK6Wu9TT0AuQnUxGvqEjINTw3LREuUSlMdfWB4lvOUx3KFhn3YF6BJQpkTT/IzkulCZFsB7VvuEIw6ALsp5W6cxyWC8xIPQgx9VBFBvPK543M7u7obuajuXgjGHTXg5b24R1YxugLmJG3DQNidtY43btiaVG/sR2X7xAs51rZS10DBh+7QTkIsQevPfQQe6/1/wVpqSJIQzFIw0qrpzljbgMEwgehMUIISoE2lQbtLHsr73uFDpZDbwXJf9xIAm7MsC/BaeY/fVhHPdwpOdToXUJRktF3BOchUWlG7JuwKECSjKglyDgem6J0W2WAEvU5qiJRnURhwXXV0RrgdNNDD1EDaBpKHbUQFSCOvaQHNdUWPNfUazx6NBuUhjqA+9gzEGOdG3NPN0C5qnxVfSD5mIcIQC3W0k4ZyQQJRU23Qmmoua6Dx0+xj0CEeAzfP/5S3OW8kvl0hFyWygoWj3qa2goc69K4fapo5d/rlbbryrD/vLIQDX3Poqg6XXpRheq8qzhITgqZR6wtMSz+0FWiZcBVEgErDEcwoo+CMN8wQEPoeH3SaVr1e4K3xx0O2u+SlBm18CC0AqW56wn9a4br/kcx1lvH9rmlDIAhUmo4zl46LEKmZQkIjplJhWhgELc1iMmYz2mjatfJ+ziVqmXM3pZDlI3J03qery6ZlemAXYy73G7Ju6D4S7Z87+tIj86JQnE9Htp9i7SpC0Q0OHFTi8XOUZt7s4+5Pw8CzI9KcZBDCjsSqatvoIeE0wGP/ob0BBr2NhKgtokVTVsLeC0d4bIwaU+3pQXbNnCtoZx83Z9K9TyRtqFNQrOPeEkxasfhaVzOr4RiDBggfQ0EbKq4GAXUNydxWWZXLkJyA2odzMwjKpsZPWSG1iAQaIQgZ4ELMuBfkCDHDtK6agHVHcrrdqhx5NOMPAnH0pKGccwKUmsfBRB3doWhPKzfxrx9Dm10htYrm5excOPO+M476+VYt/q/gXNJOUBQ+ogahlL8Gc7L0jC5p3hgEx9sF4yZqaHRKohMhQWILB2ImqfYEF427ammaQWaG5ry6KBQRryxq1WaRLsAG6L9GlxT1P1GqVQMIKDXCJL2YtyZhnIEEuD5JwQmt78kOh4LzCWxnJuk3x+i3ailJGm6qeiUa3NRxAQZteUpIpzYRyM3c5WadeYEG4eZ3Gogvm6plSCgErQPeV1MtFujbXrCBpems4t4LHQgxEVUtR/QssCLfcFCIaU1doTv7+DiOaeIZxM9b8wmuufFTxvAswN3s7vfdMQb9EA1yDlg4cBNQ6kJuVt0zG0CNp4kswwEXgOmVZJEaHM0mpW/A8LiMT0OtQYOYp1BWZAAPRrYPKfPWyXCd/DjStgQS88o8nnWBAjH0gaYo6XqGB+KmYwZzZA0WPmmEA19hFmWQ8IsvtGs+t4bni8j4JjdG0QnPydxVR69aBPPfKY+K98thjzwvPreF47nnhuS14oBUonnlCgVopeEodCDpD4Vl1IPAMhac1kIDjNQHrjAMdOfCkOhDmWFTeWwYcixZF2QkbP9SRXVMvCU8WPPfwhwwUstQAihKy1ICJj7ES4AyOYWenyr87NsY2f8iFrx0B4KiNyOAYSwmgyBhbGgJjY2xq2AuMsdKADY2xVgGKi2H1bsFSbwaLWLEhwkWsWV2xIlZHx0F3SFa8HlFCkXEMltSgIAZLDbe4+ir0csdKwAIMyB54qcLOvnenYskecldtxeoRmZWsnB0RFSzMSYNv2hoOhDM8joOF2BHEYXmciAxzsBQAinGwPFIMuP2/5N28+r/gCrx7v6Tbu3hvOaoc766TTddboDA1v3YsS1v/6K9WFRoYjD3kYr6VefNW/tYhJpbUJ8oq8w9wu+QbMNxcISEAVmTQ+NXhEQBWlPvX/228l7J+ZDXFwmsN51YQErV4xQuOVBwQnX5FBoxIHxZqYMm2E2dgddkHew9/xQ27hL/WoW6wy0ZYlE2b4uvXDuk+fJ0QX0u01z3aa3XBDa3JBe4+qmS1QJiciZFyVmhufkTogBW7K27AktvreZs94t3nbVaH4Y/yDSIxtZ5rj5eX9uhtiIAjQ3npAPFowFKGDdCtomiD79WvBJhYbu7wK/0rasd9fgsz0brAdYd+temepGUUFDRqyWxCwY4um+cCPxAbSG7e3P8xhhVjDnt7Iei+94oMGvP6kd3zDr83NcMgNtnVjg9gk52LVXuMc01RVCcDyX0LSHzN4zMR74QEuQkin5pTb4ERkK/h3KeZcdLgvJl7ag3HvfVwn1yi8SV4NPMKzc0v1leE/Es0t4HfP1lGwG0guacVqix75VZuC2E9egdaHQnUp+UIgDloNMcS2PnmOALQ8E5IwM35+S1FPL8VEVzfeH4DKXzykQuyxj33XFisNjDV55jWqgBOFji3m4eRBlGANgnIUhyDuroLUsxAvOjPz8JzMNKdFmjuPeUp+CwBuQkG50ZU3ZobWXFiegLc0Z9OgRvUZVxBdlpjgY75oqrMskikTTKcV53UsAHoIaRBX4I3dTQ+N+HnXW4cvYkD27vGMU4QELJI/NziC3mJBKOWLnAkzDMQiPjGZUicKCUhX4CBBMhGgZrgRnINCEQ8vAKMJ9aA3OZId44I2rUBA1x6R+1T1MQ3nnQEI9omJHwwQcxKxmACswPnvoHkXQB5djIC8gWYR1snINeAwG0dSWvAQEmjMQAHOtcbgHAhTRbVPObqXgqVlhUmwiDjzS0uKw+X0zO/psW0gYzIUc982gH29P/Ea1njeTrB4SWs8aB+aRTsBhTYIY4gNNhCgGd4upUnHZ0QA9K9gylq7fosZkVG2UW2UN1y5Ho1kfdvWZEmJFIsiGB3Jzy9jgSknTyqqdgNQJDDiEhLQW9AQYkJYmku+P3iaI6JsDfjliI8rsiNzhAFdpE1SFjjAVwXRG+Jfu14/Uw4LmyhBpyn48XYMd3HkDFr6SbwJRropLdpWU7SQRdg4VaZaGGQbbIx7HS4ckF0MnFgPuBYTg3E0+WdgNevr5hu6hT0OpaXGzqSfIEE90PH804wIFL03sxI67M3o5zWCUgbqFVkeskT8Po1rOExPhyvBgJwsP9AU7MLIJhnP5YSnsuvIpYkNW8I8rmAApHjt7FHbq9tbJmg35siybcBBSLPK1TcnpF4ggGRErXnr7zac+8kj+OcMWBu2b1dl2HDzUlqO55bRoI3ExV94mUgFgl68JggICsVXKR3RTeD+Lm04mhXUG7yMr7HbVspXg0F5MzKEjFJtmkjPbBVXH+0gm1QL79evAq/4te8cfHUXrZHK81g9QgTjtjEAdFSUALpugRPN2OEryaV8zPgDZiME7wUoMhOSyzAMdVT1N8NQMf07RVYAWEu53hyDQbkhx2lhbC0LgznKdRz2/BgInr3eBL+GQpGXTHsVKCR62BAeo4bBHVyDh8Fx++jJG3iUgyfpCpWqMDWjzil1Fs/NLCSvJhBclyrkXsf1/apKNxVdRUuZ1XoAN5zAM5o+8ViJP5RZsh5ffjZDun2OzYPdfFmxihnGxeuCe9Nt1Tj5U/Hiuf+kSt89O5JhwXRfXItQ8wQsGs4ME60Y6dO7OPZaQmqQyRihQnUgjZ2DBU+lo50IqFyCRtFWCHd+6DDNKXOt5HnxMPPdki3ko5R+DKMIpZoXt4DZEPmFijAgTxJax63dOOlFdFXR+9+Fw3Xy+hV2fCdGu/5M2HLWaHB3CqHSCwEAtZwXgrQh/0WGT4H/mY67BatVYzHdq0Zn4ZGhwHnVlA+VoxistOBQJ4femwTNLsN0K2CZH7NwfNqLmMn0zR/EwrGTNTYF1gAbpKHaid27/dpRQq6vNdeeS94er2dSQx5EwrMTGZG2gDB7lXYp6gmDUs4LwUE/m4WIX4+b2ZK7CPSVjkej0gbCQuCh31sggrPV370tFq0JFpRC2A/VdJWTnEbsjZNBqyfIqJpZQPTUwvRYLsFClejRbiiU7MADVBDXls2ZC+/U7IV5RYocJe14RmPaTa+bIBuFWh/8JHdxw+8/5hspl7DAc57Y2FVtfFNrW3rMqPZ9dmGdR+AKAR1WBSlxQV18Db8bIeEKkH7X5gqfDwxhiREo8YKDeQIrQJVEU58G5huLTlJJeTQshcsAq69UZT8AsvJLUZPop1oA8lvVwJx3mXblUAed0leQIyU1WMB4ZlQjOvXB4Ab+Yv3Ashk6IBOGZeMNTc8uQbjpMQ+/dwz+rz8vAzrjea2AbrvlbE8SniLNmJ6DWs0v/1Nsua/jQrb6utjKGNVLKCc1GWLc4btWWcUgEldNzyK80SUF2qS7JktcG4JevBYtIAlmJt+HcMVLcIO6bZpM8ZiCn/7XoYFzsODMzp3lwvS/33QsYHpFtMyuUKMy65ArnEGIRY8iElzK/nlElHcUOt1bEB6dlaEmWPrrDDXonXTxsuwQ4ZbXKxK3faWitwWiU8xGRDJTwsg97G4fJyQgngBBDh57qOeUXCvsWDTfM0eKejXWIBTQ/XQBAn7EgqwVSTfSYyKshgCPxKo2MZ0r0j7lwwpVKygvLqtbvlMBHo8/fAQy9t4S4Ub+haDihidLIPK4qPRRRISyTFtxUSUhL1HIcRMoe9PBpS7KXIVB0QQ4JlNrPABuxFWG8/chSY7XnDgIam8JzrpONBtXpUST71Gc1tBw8c44hkFSDjYavgsW+CgEhIu2zWdBgMPLKJGhLuyaKj3Il3ZJfCCthwMPKiIG88qQg06HFRCVZeVGupCA7GtZSwh3TtkpUgSixVV2TtWBA+jgw4bHsiaCV4RrUdC4L5Il7VpND5wrXozWsAWpt+wjJaxRvMSMHsX0snQMSH9AxV21ewXXoFXx0IjmZ6AedXmE4r8LuF8pycqDQae5/REpkGD852eqDQYeB4i5DqIVoaO6DlPUqnQ4aASsBcw1yp8r2COsyvmoS/LZO3z3Nd6gqcqjCWke1t/Xoz2EJjlraZnDzd8OXZLMkBce/kVwgqTyU8zhvu0TH4aXoEz3UaNER/n8iJJg53UpeB+b1SHAdw6b0PPTGfGGQRcRrANlCKuKDdQ+thUYe1PSJk3MTQgwBaqsIyi9ELBa2KFbpvJ4/WrDGAqhqQmksFuw6VtYFmkrVYFFSuw942lgg0shwKRMjqzJvRERBKbEEA+eSW9kr5iwatinXqFBlVxaTH9YA0D5c1peHNfXsy9foN592b/ihsx342se9Pdiq8J3pwf6ZqdPfn9MSRsErGPIVtzibUHhxObEAA+hAU28u0aW9b2g8vfrv1iaz84ugkh7MQkzmzHsGbLy1JMPYjkJxMCpNT+S1M8f2J5lfG1pbdhsNhMwkBHQLGuUGcq/rtJo+jJyGhGJzwD0/P+LZWIJSrAnp2eAKLSYECCz4zr1v+d4u1iMEHdy1jetuJ7worQEd3exCzggepN6hENREtb7jqiO3YCP3fXSKn1PXfbFGBi+nVCf0MA1g2Pf28I0BWBR0BDqxVmW05XKUtUeMMkk6AjEnhPNM9Ny/033CzyrKBhtgCrKsAMad8iWNs24WUvdYz2jVd5BxsSmiKXLdHGVQbYIzk3SbtZUKYFZt/GWxoccZSXMsSNd5vRf63En3ptp1jYZjqqtVdtNey1e8iz3Wxa5OPXjneEeRCspwnSOwNG+VIWLGj6koHMowdW0xHriG76ipC4AlJ+Rcn5FYhUfEtHOoBBSOWCp/E3jfaoZ0iQgAtrWolMq0FHhclo/Ce6fQUN7GxJftvwX2nJB0AQubyMSNi9DUiQANLRRQN0k/fX6smoR7jwIyG7a+hC9jltc0YxXMijmhnM7a507i5ErCOUe+lCx5ltcsIMY4VEoGXCCd1hWv1q/YvlzlJ3TQujYS3tIhmSOm2n6GqLRrhYPZnfbpvQPe9pmWD1i7X5vE+4WQdgwkXpe5dok2apmOaijJ2b3XJN5ReRdBtfFanxoTIPLVa93v3SOu4yVke9KblZ6rq2kyagN0FPa5hVO9xh3Sx6P9ZV6w9o5ssfF22+LtsyLnVX8MUXcyfdrcF6ufJZDtn8yuLn6MbWXueLL9MizrpkXcvLEq9ZcxN4RZJttPUxb6uj90nKaeA6rcDAi+5NRbaGB1C0AtltdlqgmUA+E8G/tW3uz78WTVvei5b3y/abBr/U7+/2O3WTRddKc4mCZtYm5qT4ThbI3aJOOedfv7179/GDejodL2AFuEu/lEsgwALpktCHxt85LPGXsITclcDE2GhfgHgST0C7dOeSCatk57zMk3WJt0u+vE+lIPbc2DzFuPCDxb1Wl2yPljiz7Aqd0FVaClFrxF0Bm8c5nrRbBzkbg9Trvl+9HvqV9RQheMCygMMq4SzmNdI6GAF36WuWZoS9eAHnnKApOEec/QG6vLRRU3Z1zIeQWkN8L4KBehvaNWeMLmZE84UOF1QaFLbDNjRg+iIQMAG5Gx8B24izS8Zl8LbqmYJPg9ql7IMNERBOQLt0Oc/LmiSDM9I+YdrA7fo9ugFnfwWr7rRT0M1IQXOV/cSbaK6ynnyvb5lRFMME5KYTswl/IuOc0ADE/KnlhQr7RsZuQAIk9NFI9nbJgmSsYPcni1aYV131+hqT9LgF3D51f9JPwToh7Xc8sdwXUPm2t41vZ1sCOrcRwJs+W30FZUuMuz4mHqibqjhGyKXvkn7G9OqwhBoMUICI/g7xEGiQUsgK2Hv8IBSzAibYHcvS89K1YuGDdhY27qwzivP37yM5jDBgxiTCaRdmd0sf2DOXRn7ZB0SJYmFJNekljVVcqWgMG+SxAB3rAAq6dyKyCdF050jtuhHKMjAdquaKkdaJaF9DsOEAMdtQPkc3xo/mD8YCplq7gpVdexp+f7KnWGZrTHGzpvj79//zzz9+//qvP7/++3d/e5MnlsTrTyw4OUvXVo1MPf5hSNOv5Ls+EtqY+M/8wsRYJFJn7Mwz4zdqF++7Mq9EinMqI9aKP4vfy9PL5a/VBJlf7z6wt3dvL+/e3n1I8w9vxcdtWWZinEsLC5Co9uVv4zJ/0x8XvRF/fSPsi1j8MxX//c3d27uPb7568/5N9P4Pf/zjV/NO+re5aKXZNwlv4jqtZO7+9O1p/bu+xo1SEL/7Vja8X3jciv9+9eWrn3748W9/+eG7H37+P9FPP//jzz/8Nfrxr3/+x1++/+nVN6/+478+vTp3qRi5i++fVMMUQ9w3//GfX8rYR3n5wEX9fHNhWcO/nD78SS2e1Xcyc5JbNgl1i0U+hM0bbYfly+mTc6tdjI7ii+vPUXMXfzC/MY/YrCxJzpL6wfqn4iF/HyV9U7B+UNVpKf9T/Yc6TB2+Gv9gfNywaIglZsMS3btfw0TDhLSAXH4cZ2V8P05YUdnEaZbJBx1h3wsTzl4c8suy3vxbwmVoblHuaRslcRJDvuN5t/WZfiSx9c1scDbSlfdB9I6tT/MzT9rM3pq0Pw/itr5S6/WppGBf1fwqp4WNj7Vx+8JZ29UbLd78dDQZrd+pfUm5zBUzAeCbNnV/VIsJzv1Vw0VfKuLtkmkyzivl7aR9IceH3mFVjAKfXn07jDff/Pij+uUXT3lWNN8Mv/2XT58+vbq1bfXN6fT4+DiOhaLiT01z+lv/0RuuPAg+yTG6H2ZUsrbu+l+mifq5i98MjrINF4u0N138XS+qbF/XcfVGmEnq8yrJjfR/+qSGSjX5SmO5ESN+K1pqz/Lmf8h/nuRH09g55uVPqjwGTSK3EvG/v8QOm6xryysvTn//+ftIzhdlIdpJMxT++EdpLInOJCa/N1li/EXUixhxs9F8GSMhmV/EI24kPmNZeV1/wh/kn7UT670/r1JPXbn/olkDrL7YxlBjyxgp0/lhP3jMn28zWz9foZet+nCNM/5hmSJdjE7R8Cf3h2LFUjRy+bKTRE4uQ7Nx46uZaPXR76iL/sxzuWTj/6ydVJbobNz8jop2oPiRt0w9mfZPVr7rpcCX0zLly2n58eW8HPhSupvlctyTlpQwoKPRgJ4jRXz3408//HT6Tvpl/TB6COXC2lbDYTqPY+FA1/5eAQpjerAjHEeZdfn79wiMvOoiVucPXyMw2t/m93JhIH9W9trpp96d7i/Sm+77f/v7+7sf//3uwwQ7Lb4iFufVUdDTVECNfO7kFbnDsFtwC/TEjvPuIGS5vDgKWnw+7JscgZ6zaFxzl+DRw5ekyrKDoPlhVcqVWXUQ+KWp46Oq9FrF9VGN8Vqlx8lWO9uHFfntclyR3y5PR0Gnd0fVZcoOG7PE0i2+8YPA7/lzEzOwdeGJnokR8UDopzM7apQd4eUuYFocNvlnfLoddgT6gb00O66XChs+O5dPR6FX7HY+zuTKm6PGgSoujhrOq/qoBi6Qoya9Fiw7ikGYW9I3r2LJUQT82AbZHGZ1NWJsnw5PDgA/bnFx5KjYHTksHmnnPiTsqPJ+TMqD2olxIkpLkQ/nOaSovXdVNOknAe/3skZ/MQ0cuFMFAl8KB2Kfy7LNSpbwWj08pB8WzDuZ0FJYgMmTWvWc1viMTiCGcX8LjUGgI1JvvIFHqF0o+bgou5JkbcIK19W/PeSzSWKA6Gf7ix8DMqjuzEpV41tIIemV2/dcTsIUiSZPcFI8oL64zPPeC00dzjWiHYFnjEXatsxT8JRgpj2ngaQWp6hQIPlTcFqvHfpl6hrcRcyUvOjACwczZZOlTWCJy+c1O/AQvExbpwV4ajfSpgRVLa8hz40c2OHMtINTSt3ypzwMoS/6sKR98YWllTsrWQYe9/oXQk5y626sPZ8dQj35oEAlB7LzPKkf9AbAfebsPnXvUaVS9/8ZnLy5G1eNo5uW5yLSQJTFMQjyKg3pBnbSXcIMxxcfEJkn+R+IpJHXNqANYHBow0BcecFr+JRjg7gx8Ey+kdxvurWBSI84TPryrI7iEQiVh5VmSy+d2VEA0018TwAVyFq2ZP+eNCYdWjICYHbNlMNV1Hs/YQBvvkahDUS1KkT6oVUhECqPdYQt/XB7DgogA0mpqSL3NGONpF6H1IuUHi1YSxffUrCfgJkQvlW3TKdMVhZWQn6W8iIp3NRdJfQf7jUAj8NkI52PzWMk9DlsMhJ6bNkv02Fq1WPT3UhXs/zSFWGS68BK8dtJXiYdQhwHJkW1Qq+NZCOl106ukdLTY2tOK9dcIaOMHL+ngdRr9B5SSsaQdDwwnd/CREuo+nhIwrwJKxnZSUPS1YElM1/u9U7aN/WQlH1TB6asRF+sbrzu46ppP3qeCLlwPIfWBZxY/UqbzsNCsAP4zEZ2BFSpGBjhJTLsB0wZ8q9qDWHIEBBD3WXpg+nIFjdfWDir39U846zh08/q+OJJuTDF8fhXeZ01gEuaeWOskQH2aQjrI/4SNRWP5b4WtDwh6OOFGRKCfi9G/oxHGAz0/jRGbeyBO8YO6HiniQAqv4BthB2UKepwOM5QhSQg5KU+4tIU/IiGLvsRCFP8Q7jaisnIb4MJ1Uxd68P66ltXP/Amevc2OYeqD6S8I6fsb/KNP/aDYOAA60FAnQNZOn0TOJDgqNLRsSl1W25sHlgN1hZLVycztrqkE6VFVN2ebV3mnI3XbKP3X//44X/9hqswDPFnyPEff/w8GVa8L5/fD28/T3573hfK7xxr7PM07E3+z5f/l2zmW/SfLfcv2ui36F8o9/Wl4UXDo7K8/zyNf1vAZyyBl2z+m/yfL/8v2gE2+Q/J/8gqfohKYVzVaQL3X3NRVW26itFxKDZREckoIeu4IVTKN9CJtE+xSzZCmoTmYozaJYyS02idhGrWsTRjBws3Tx2nxVRCiLyep7Dgjehyjyy77/80/kSGOgqmAn7Mz13T/179Jw3eqJIE8rdH9jC0UvWfNHijRC/I8QkiI/aM+O30RtHovcj1wIzHIEcysIV0sfQ4sgtgUe8YeDqQhdCoDfsjCY7OgeeFywCGMfD4cQw3D/+0APjJ71ze3j2QR8CL6qjTh6M7hyRScZ88fJUDaJQPqdw3P5DDaws8AN/nJgQQPtXxfU8WQjjG9nskh+edTSfF6NQ9z0hAk9Ef2ZiRjmMZporjCLQHHg5iuHl4bAbAL8a/Y4mm8e84mnn8O45DjU+08NZ+jaOYQ4I2XSXjpIxu/noUPhbHPOM1xeQH4ivzIq3k/Tv4Pf8QOhkE8NCsydGYcVF+8LsGXthxnB+HnbP4MHAe/1Kxe34Y/vXAgpm6YH5E81QMN/buOPk3dvfxqyPhP767Ow5++vVR8HOM6iMZHljWoU3LLYb0yEzImWiKzhqDHTTD8OX7AkcS8DgRJSX+iTWe9mlEpzgEXwxFDL4d7wuthuhjwLPRJBbGXp08MrQhtskzjhYHwWsd7RiGlJJi3LEc8GYK8/foMQPI04d3p2jBW4QjgT5jvyQXuiBF3Q/XmZVreMNOyoPyCOBpL62tu6bliW8IDR8uWV4vxTf2of5XnlfIAkmI9o6sNGJkHlgYh4f6CmMg2UR3cJDurQK4juueJlcOj1HlSVBW7NeOR/Lumyyyo1rZQEOxj7tFoeL6V2L6L9rDs6NzHZmnwQVVtOmKFwkvYo+oURAqzfJI2ybyuYIOh7cNmceSaE9JkFO0NXo30Yq9GIoPZRiftlAnXYcykWyHOzhIN5QBXJT23x4XxYJ1l4Bq53qLZhj0j2/WJtGhbc6kOq6KBp4Xadv6bHZ8ZVnYDq0xCx/BCZcH23GNRCd7kZZitUeQVHJa5XFUNtPtXO03WGNnFzw6i6LLeetDU6uYocbrf1MAPP2X9Ij6O1go2JRS6RhPzkAEtwgoYn9FGnw/zQPYz1T0giUUna6Lg6LalrCjal9s7XnKsekuX7YkhvSIg2NDHOps9fymf205UOVjncGgY2WpSmo06L7WJn9+JHz/o46vhY2QbZiKyKzH2CdeHAjRJ6wECNDjZRMQ3lyuB8H6bkZYwc1mHPsEYAMh+gTLAAFqxeoJq/aN665qjZJl4ov+mbhCfBU9pHXb+VeZHbsZAhzrf8AjD+Wx+kPkGeLVxZASiB8eBp1KY/iZCifqPCJMucF84lVtoKVUeUyJMjm2llGVb+PYwOlFkYH5hE8a0TJ+ZbE8CO6tfdZ4F/kCYeg/709Jyq6F0AYPPLOByC/5+7soT+Pae65aICmM175nUDtQQZOHDQmJMf799Y3LAPFINBV7/3XCLwgc2ThVcNTmTeMHYj5sPvkdGb/1FQbBHJ5QJ4FO19itWF4PL7S3dek9Ny5oRv8Ks1Q8+z4EM4rl67ZVdQBy8lww0fjVUw+17yaMB09Vlt5mDhjY+3jGA39okMdAt6y+cu/pwgq+bO0kbXvVhQILuuqm7l55r4Bl6rEAq5B1qUzI0ukZBPnfQbtSWzhDIVHAVXUp1rTS3dzPE8BEHEtrymhggS1xxowSwC0yikJMCaqC80rFzJxuWU2/QWOlNGDTAxYTlnehbWMNATI9YjmCUf1CRIJhaYogXcC66me871xWwpK4CYs/kZXcPxaWRfNvo4rF92LEBD2e5ABtI8vbKyrOfVSzxzc3l10QBN905959JwA9S8+N+odRIvLReRnI0xXA0wI4Wdbs3MjHDqTCIdwmy1jtXAqGQPrX2Q7kuWR1Arwu7YcMc4v1w5SLxgMQSfMNvE/oBwp69cEPcg6C8VoOCWJJN7yrENCvAmhCui+IBuDa5wntsx3jBw2zWjwxU3cQcT/E+avX8r2F1+q3r/sx47WKGEFb4Ht8tEzTn86scHrrBkKDAlr6YStvdto6VpBiHuDOO6shuPyp5UUDMKdDwKvyUTmFgDY5fAnS7JDJsZEhzuEPhuLAqZXnXdamFXMuAr2B+wkC9uiTJ3h5aaNGPUErWkob36KWyahVtOW+QUKbk/513tfSXqVVD3rTwQ8TcqoCRRxXBtpIdRByJ3sOWQM00eeR8BB41TWj+MaKgocsGQEU5nDrTyGXt9pJQFwLy7YPKxE0ei/gtGMlNNaYb1Pifo7l2HUaAvuNPnTz1uXiFw6JflgAXU3/MneUyae5xQ/iX5F6LPjXjncin2kdd2KJGakfIeL8AAEK21tayy2Kun0eL+hO1TD+zJxnanCoOnU9xgXHaop3lFiPonbJyuzMGv6VK9ohHC29ul8YhqMp5yvQbTY4ZpdmCWSLC4wYs5xnGV1zkdfzqaBuTPzv7i0tXlVmrt1qD0RwWEE4JmmDid3bBnAs9QDS67s3LgvFA1HFEmbJL13TRsMUBboPjqO41GUuPdePIZEu8YqhZzuOpOkqYdDx9lCipnEZXIHATx/f/pEYmbZKxZJEXttMc7LpKm7rKKnPZGNFws8dIRiZ/ZHcyCYBFSeFDouugQzhpOjgXI/iwqFAEVbhcIDgD2CwK515cLtPXK5acCwZeIyyZ2Y5WWeaAhORmhm5a1/YA+kjGVTv+3LuLhd5tzATFjQVdMHlHpbchyOrmCIVs9j9IxVcmZJVSeV88hcO5ToE8UCKm3euEwMvNLJ2J8H+QAY27DVR45FaIhMoIKIxHFQsrd69f0tXLeqWKlfxMhuybistZ8pc16nobsm7r8jWqTWdkSKjOhJi3X38ihDtPSHWR7qRhXDB08j7niy+kXVbBag2CJoubekMdoVblvcpqdI2lfMtFWK/me2OUQ8HTHNCNNi782A4ytWxxIrimqxZD3hkNdvjNehFhozyRrdDKtFo9qJmpHHvQz7EHfFCHqOijb41+rAb4hEMKpxEhpOoWAp7eiGcpnkuyuIZv6jSCMbgRioMREMxmlrAvQLNhRAIGylP2/SBVD3oqXs/QIq1qwboE1gxCLdo+VPbHNM4liSHNZIl0SGNRSDXaINVw6PZzNYAqRZkGuQUG4sSM/2NtF6atu5iyk5MPcKD4pFvAmbpuWb188kdytcNkaXXAhCc0w3UFO/EXxqQk4ELqD8oRwINB+QkKNCXg9xw/Tk7VpRCUX4ZlFAkeSMuqigvXVHWfJDINKnrMGS6+ss1lGiiGh5YkzqfRnTD6r4c2AxrWHTtpJA+clgU99sKbojeJYLC7JsgSYp9KPDHmlWUUNi8uYP+uTFQRvCMoh94oyVpYJFEIZVH1m3iNtiC0yD6k0NkkamzfLKM9UfdSEnjETcaBt3jBEQUd/UD3tabkaKCoycviTa9KeB+fwiIRzNnwS7sQWGiqsxc8ST8sJDZm4/skaKyvAw/Ex5BcrR9licY9yUNhWJayqsGubeiI6E8SHSgGhLnB4QkLwGge5g8sUfWesUSQHhDN4zzhosb4h6PEHHn7R0ICtUkKKAozL0RBq2GZGuguifZGBhhsJka99awcgx/BCwY9PUqDyRIpHNvOGzhz3A0a6Q1IKHCLHW/hOAFSLBbs4AjmvM01GEHXo4flfvyHQI5KuSOL3NfEKPhoMsHwepggUan7XJxPtLoDUenDvA6gTccnTqqZYwOibfTNTSCnZcFGp02imX3Eo5OXc2KpMxJtnV0VPyGxQKNThuB2WaAESrLyjHEMuClIQwyoebh0UVCraBnHEGIVAao/IhsJVPLV+OzNrrxjMKMkHBU0ga3UGSJzZ6SFEC6hyQxHl25qbdAKGxiDYlCU+8GSqCp39EmarIrwOjKC16zlqNXZRJaRZcikJg36P1IzXOWAsn5DjUU5t0dYXvt8WSUSPyqdcR7T2Zzzojq5UMk2uy4jMyo8gkmwBCzJmf4LaTJrZgGB92uJjdiChyqYV6CkWzYTUBURTWA+ZeXFlmGPzGRiDcnVlXNqYgr+X8KvHE/sNGj5g2hnDxrZB9efi5veyccFJ8rCL2ftwBhFoPQVVzanLd1GrujXOIZDiifrLxexfAY1a23BQOBlweFl5pJr4YjSmeGP0B7w9tWFM0hxT5ii/W89/49BB8QJS0YV7WVgzQj2+Ho6ar96szi+3NZ8Kguu9Z/V90LPLq03gcLDoKMRyosF6aF23DLOpHXvK8BKxcQ8iGlPUMHXB7bxx7i2/mEPgsAL4u09T+Od4HLW1cqHs1DGnINzgGfpcSApf95rhvxkF4ij6TSRpYpeYsI8s50YAZdmNvHTFjLGv97pCBQ+tFyBO4q8V/UVQYI6+6LWGBsCztg4G6UE7dJxh0DUuQg96R9yBunHl9uqdzjflaOS/fUJZDGeeV9s98Bqdx1/X2sHKjUMn9heZTwlkNe//GFLlPyIVuuxOgRCdZ2W8gBVzocqP1akRY0Jx8Fc97cIvrRWsA2AedcDlAVXLkPvk8KXLDWPzirA9Lfv8MByFs5Yx8CGlXdOUubAD8qNzx50xKgj2V9HxRlaB+5kns7jQxFQFwO02tT6gGh15AnRbEMGfVKZGJwR9QPRj5wyTqRHGH4T+DaBupBBOTdaYamnlp05IZ48TJjN6U0NYumKg8rdB4WpxKI3j8tdQx2WlxqFqXe4SeB8IfYOBO6NHaGUIhHMUCehAwHVyaQet72IIYAXwAoNOyJmVD4sj1ssDnAPNQei0QfcuzCV+nrJmP+bgFA/AMspglatPL4xtKjGkxbO59TCYXuEmJLvX+mRfqfEzeUwZ31CAtmgC7K4gj0IzbDmqIlrremrg7ZEJxxh4DBxM1C4h9Rwi1r7jPqubeN/eN1uRCJ24EAlLGiiEHVv47ApD8ZoB9sycdY0dhvJb9cIhXGo/F/DMfoP7E8uJP/DwwEsgSTLzCxKlWrtSYS/4Vy6DAg1RkALeS4A06LOu6qEqMOHjikoMvJjxZ9GEbpQBd+FPPPbX5xPusbxnCuo4z3V9oPwy9j6cR4FPzkqnAEgVotxUy+25M2rXT3bsanJ4+gK5KqLp+eSSl0RxRt24Aee9jdo60Q6dQw+EqQwkXTOQYt7Oh/QYMqrwJLx9Zh55oStK7ZMy1i/0ChitFICnxOC1aL9JzV8Y1moLUi02puI+UwQogpRtFMDhi0oGL0r+lGmxFVhsqK5LhJC1vHpHj9sRslYP8aFiEiL+KyjzhPCfprxwinmBFVObFQ9s/BLYYQUXlJq8jVckCl1Goi02smb6u9gxAxYP9i0gGNqwcnn7QU7CFFK4MfU/fbtJXXDcUqUSZqSKHloo4nysqlxZWtgbgTi6UiadeVeMT6rtRVT2yuKkyxLBYmW/VM3lmLsk0vKfEwKIPq0rd7gcrrNBYNP1exPQihy8tFeuHWrCCut/KxEF21amnLV6DK1Rv5CNAfk1IC1vzCa648Oylh2ynMECluvwdFOmANkKQqecvkWx7EjaoRnYtlkehlZ+JinU9sDwCdnlagxO7tAcp2cICJMR4NUcqcjpsoMdWJNzFgH/SAttolLu1Ko0ck1Zg90PYj6cstqjw6QOpzxaVbGPVk3VV90HF6SCKV8vTqxIqi7OSBDtqXdYlMdz90hUxzx3ID9ii5eFfVJTDd1cpNZPS9yjUy3aXKFTbuAuQajuSS4goW6zSzBKS7nLdCvsXVV3g/Fzss2g1lBYvzd17BUdz5s4EmDWnt01whXMLSXc1bIuOuuy3R0BfSloD63bEDRlYF/2vHMoFCDYu7l7aCRDtsLxEDwonuoeEuIazgCC63WTEvZf3IalrbCunNvYJDXdNZomFvyK3wCC+eWbDVBTFZ8UXZBESB3gGf//Ra/vp1/+vXyg2NkEZ8IP42nTnT4ZJccVuhBj5cuQdZPsoHQZkKBIa887zE7h20kVeUl6C9SwfJXaQVdNESeCavUCncnW2g5HaL2nRpngvKfqx85ejQcB6zS7hHds87mmWPWpjIt0cj9WYeyS6DiUmzczFj8vhMrlNiUuocHipWT+HSAi9eAqYsiP6pNUq1t/vkEg1xlUlxZai6A3CH6JKkmAfInMKOH4BJolP5tZ8uLFbLSfUTjVgbMIni0cf9JHotL/o9KlLcKYwMSTmsYUnUim6lbTA2RD6CErU35sssiwR8klFt55vQDaGDq0SeFtgkdWYgkmlU62tCsOiSZi1lIdIELd2AJFV54/IGQ5QSK51hSdXKpkQ0+I2Q8lSMaKA2IclUNt25f+6GGpBaYTS6WROW5wTdZFHNY658C8jQ+zVF1D5FTXzjSUc3RvPmFpfVfOp45te0mJaWlBTmISElsnkuRIk8BYU8AJT2Es0SfDp7ogSXl6OuAiBmxzQRZd8l0vGNFWlCiz2eS9BjTgfUlNDDvw8BJb0OuMSmczQZkcct4YLOqBiQVTOLfu24WK8c0Z7X24qU6PI2/hHDqdyxEwuXnKjxieo7zRe9qRDVkTUxHGkbmFHHLVUyVO0cnBJTHYNTAhLalwNkQzQpTHDklTMEuSWDqz5QF2NKq++riCVJzRtahaQr3RGzX+wRC80rItf3EZC4uvtTeSo0dZTcT2gZ3aUfhZwQNssioZwYFSJvqa7USzjjVJAMdAi3R4ZXV6Jzi+GxTRt59KwCF9DCkxeBdoRJhdmSWhoSrY9QRIXYJVT67P4RFEeZ6tTeeOOFQm+PmrOnqPc4ILyT2kP38QhJtnF0QGqF1BtaOjTtaWaPLE/c+7fvLozqeERD7p1DiEErRje46rCcaqhagEZJ2sSlGAip8IefB2svEv8oM7JxdgQ3tyEpR/IlA+V51IT93McRorwQPfys3PTpEQlPEg1Y4z4BOTrhOD/iyrdYyXfXh5/Hnqg2Tsk2IUfwjtHuJA8/63u9B/TDtEjSmsftEf1wgd0fR0aD2w8p0z1/PqTwzfdSDgIm3Kq1otOtY3X40VWfxByxAZMqLh9VHG5CyKULOyU08aCay+uh1G1MgZI3rTwjjjKo4dKrLXh6vZ2JLYwR9IDZdXLqJ4vCYwEmPdWy4tMFubTBF6QRVWwM2n2NoyikpZBSLelsBOTjiYl+QFdd32c5FJ6+hPRT0gMswSHiPs94TL1oojyYNyAPGCPFz2IGauObMlTrMqNehfT/UpsjUVpciHahTHDCXXITmLxRT9dSDhmyyII5Dz93dSo+am+0ZSB6Mt0CXX7UrCMgHAA9hkCggx5ecaIDpAu8OOAtL3/TQc9vk9KWqf3aNh2+dj2YDrR/2ogOT/y94VGcJ6I0iDyXbcCUivU7poSwqxuhlIWxvm5KB95kjMW0Pg4DsOVlGUL0lkljMC67gswE6pEtr3cgwccnQqa45TLAfFyX+AJZIMdlwokCTC6QC46/NiKa7+mWZLH6B7p/mGgU2uYnFZ/SNpJliTwZNkBF95JuyyIJAWojhjGeicqp6jIW/bash5j1VMgyFgeBg/8akaKiBsT+xeUxaLUcYSjRNV+B/jc03gIaw7AwVD9QlrSBS1giOi7BY+cLdPEvontVJqgqXGI8ykzLwhxaL2EbMIHJS1RY1HJ8PELyiHyA5prk0tImML1i9XLCIZJH5EM0y0vdh2DfeFYdUhwDML1iOiegNTZRYBsLcF1Wyv6hsdI2wSmKpLfZxXouJTiHnAFz1uI3TIq4Urs6V3njS2S7Ue/pYIvUjkqhdXxXmc4nTqKK/0dn1uC3BwwwivyOYNKVrJJb0wRji4ErH78kBcypAWkcQEdIEgt5BCNZJRpgVG2mIXgsUcei0DWtM/tbRBTyJsjpxT0Mqv7rNq6y6nRuklaOZZjIWTuo4n9RXkpvtyPw5T2o6IFhIoltY2Oia+2gYsKgbsI2z83p1453h5Qy7vnkPdhIve92FPiFNa389jD8BmP17UI3/NejoIdQ+seAH9QXB48JQmBpZJ7TNkeFDrfDxmK9Tw6aUYOqf0rE/xSQ/Qj96dU3n159K6zZX3jcfvPjj+qXXzzlWdF8M/z2Xz59+vTq1rbVN6fT4+PjmybN2Ll5E5f5qWlOf+s/esPlRr788gv5jF2bFipZW3f9L9NE/dzFb4aZQZjOXSVBqrIQkn9SP5bt61oMPNc4VomqJDdQ/vTpU/HFF9+qHXJ5vtx8IYxHsczrud78D/nPk/zo29MiR39SpTgoE3mWiP/95X9Nv/r+SW26N+JP/yELp+Z5+cAT8eOFZQ2f0/5UdnU8f/e7KMTv1EnBgPG3smn/H/mQ4P8tzKDCTPiFidXYT+MLQf+3FENK8Z+7MX56xbq2vPLi9KbJ4kieePLTm7iOx3WW+M/f0SDaxWP6ly3l/3z15auffvjxb3/54bsffv4/0U8//+PPP/w1+tuff/zp1Tevvv1Xkf9Pn74YXIH+5dOrd2/efnolfjO+Sit+9Y+f/+31159e/avgFKQDp/hEBmT5F1tGv+vLX8unRJSbMVxMcz/F4t8i3Qj0SuGKD8T/vr2U8nHVGbyvSuObjS+rOi3l15ZvxxSpaATG97WcqofWMqcX31zl9RfRnkRV9vUif9k/oCl+o9pkXwkLUadelUWtwd1k0WwCRBfO2q6WEXmn/QGEhBVTKrq34MmjrhFWRvQgWvNBTDVLM3WEG1VtegTHudW2jKP4cjB61NzFH6gLKc7K+H70iIrKJk4zFUrhoDox6URD4EcQFQ/5+2iYlI/ArxoWDeGVjykmrTsOV6rpaeK0jruM1ZHaDzi8D9ZNc0gnFCTXSu8oh1B8/fbu3ccPQ2Usx+rjxi12VDcUJsNB0E3GuXqH7qghZIi8fTB6wqUb9kEkA3hapG2UxEl8VF6E2VpPV0KPIElyltQPh/eDhosxqoiPa1JmQdX8mqqXqsm5WFVFg+GZHmZh6a2L5x2SxWJEfju4G/6NtTfxY1enkrjtxNj4zbgIOI2m8iks4Wk2gHuEaXmhfvrimKXCzzyX5yicZLEwrAetq4VlnYmGkaWxcheefAPFB9OKbq6rdQU628Tff/4++m7cNGtIodVcMiBHQj9TT9vTEvAHCT4Fgz8SPKYFn9Y6PT550a/wj9KvxpLxAYHjsqFo+nXhTHZonpZktDlLF8ZKNAwJR9OoiHjyMPggwqhsVfFR180IS108ar12bA1IigHtSCo1U9fyd2+yJAw3dEKfprMXm4+HD37kLVN39V90UpY1N5tq/38v6u0zteCS3jh+BG2eDr4sO5unixR/Vjbv5vcbqX5KhcCy+As7N46kGwDf/9vf39/9+O93H0DJt1SoQwQPBPsg9Ny0PI/4pX5/l1/vPgxjs9nAREXMjkJ9mZ20QjhN+Tn1ok421PUg5Se0FVNuV5ErtcHCpW7ulYOr8Ye+Y2PrcdLP3t69vbx7e/chzT+8HSaR0DIatJ22wZGVOgFHLM4rarUTKJ3KydYjFNljkmk8dzXLyVVOqJQ62/gInT0qmc4478hVDphkGuVuILnIEZROpeBXMTuohc64dFpzJnCbuE4rFVOAWvIKnk55lWX0egdQMpX8gF7FiXsVV8t8epkTLJnSS1PH9P1qQiXTea3imn6gmlAJdab0xTmCkqqMxpe+yaVOyGR6b5cjWumESqjz6QiZT7Qq0zv6njRg0mlkB9glIyidypjFN06vc4IlU3rPn2UsY3KpGi6Z1kzYOORCR1BSlU9nRm/h6cDkaqWXUlocsBi1EdCp59PlEFrRMy6d1kPmqox8rsqOmKsy6rkqZ2l2Lp/IhWq4dFordjsfsYWiA9Opbegn2AGTTGMVF/Qm6ghKp7KmH04HTEqNUZNeC5YdolXHJtPcxLW8dl+xhFyyCU2nmB81XhnIdHoP2EtpiPdSGmFgTp7uhDInWEqlR2xMz7BkSo+xpuhtqe4YY6qjt6aO2fCj3+97SBh9Cx1ByVQ+JiV9jx9BsSrzweGVSqCOhz3qXp6e00i0wR5y0g361PGR68/rK3byYrKvJ0daxEAPjpXnbVvmKaAPDqFVBdHJSAUp+DXrOQWMTiblkCSMT8WajTPWNOll8DP25d+ACNKTEgjaxAgrIV50gJWiWSRjmjBGoZtDJqlFy5tShbYEieZf+WOqYNYqzSBGzop3ShfKXAOmhiVrDR7+LTeg2jotAPOlyTmnCmTN0sa7MU2JQnPK2g6wgF3mdEy1zwqbfVZuh3XwTND3LKc32pAbGXjLSBXePuU/Wv6U+3Iv06Laqyf3nCqQVR5UZFnjzaulw/QUX9oxEarN+hpD57Jss1I+JOZrEJk3zUJ6hIngLq9Z68lMelojHdHxWZWGZNO4Zu+Zy/S0Sh3QJM2L/vJpFXZFKtFRAhTpt9G0inOO8wtJ2zCBpcTruqzHUP/epWOkxtZTkAIjNbqlqFdXABbVbkOZQchaLk6QhhKoqH+7AeagaJFiJj9ipFIBe4LuG6inobzuGtjrq2BZ1D8z5TPMqGdXVLKTHcljE8IpzKfq9oVBW5LHvsha/fhUiJ9mPeWLGhbDM3O+VoURviWsCUPtc2tJryLIaLcQd4p9yO3JSDsZ0VbA4KasNiZWkNGNAZrHns49VITYDdSouSMvVg2XTDClSOJqJ69x8so+oJ79qthryA3c8fUYRwJra9w0sgLStXRCdUhhKaUyCxhZ0wkzz4b4KZ91lhvDD8migXdQU/nYQ5dYmCY5YCkPeBpZIxSBKrHATKsbr1lGpM0E/L2PaEY9g/vkogCG4WKJRdVmaGT5X8DYjpIEcb4HifJ2uYe0YxppJiCpwmgKuU6qc4Y9utepJg7bIIV0vP5U/ukKuda+USa9omUvNIGPLpWemaRYtEqV1iG+fAZt9nazovh9GBPSHPyslsQca9DH4tcSL6bGJR7FUDwGrCNUOMP9k8zeU7l6D6mqCBZTkg5GWENk2jwu+h7YR9V+Yd1VLc7m920By/OrnXg3wJqK8yZtokKUb/SQ1m3nY0CsCkHVF5MHoVbUQ0OrrIK2LcVh87WFefQogRzNU9qSGPeZgosCXF9wDweX2n3szz2SDMEFP89UP7J7FPKQYipbDQFV/1OQfwbxqHHJmWBoNDVEohoPVZ/TtJhqFT5UjHkex0oNAbVxiJaSUmlZNC500UwwJOWDE2XBIew5BEXlc4/iwOHajPv9eQZtUwN8WDLTjYPTGg1T8Yu46Mmz+JOwAqWHRP3Q+1uT6t1iQHWpVRR85cmM072DSljeNW9ZfeUecxWokHVYwpKFjwugIsUOWssKqqr+QVzCgpwwCXVWZZnRtFEHMrHmA8SS96Yr/YA1g/7ejUCizjpM5Yf21aFQSSVqoJSziRhLedEOr4W0demx4WJVDSP43GZT1X0mW6ny2xwW30/9tvpn2QgWSj0akcjh2N6r38NeasavLH6WxzCfoYmoB9+aNw209GaxqpnMyX9vbWTtQCw3vGyx1L3KK0nZtRCLMsj9V0uZyYY3SjmZWC+3O8waj82EhfghbfCEwC/5+7tILFhqD8+GhYYFRrAWhfAaertzQ8wSBKnG0zfAKsbLEWBbC04Fil9dKHid8EuwBgMhWMfI8vrGpQd6sBoLzmeedOTsx1JX0ICtxFijRDB7+qEPqSbbREdA2dEj0GBF4hVpQDizeQkIbnymMjsSusyquox500Qs9tvUshXbGuv3Zk1st2DvWhltTx2BtAWjFR3YTFDa1liffRAdH279POPozO/T/8Y08z1tHQVT49pDtupWQx/2i0TaApBQZf9qBp3ICY9QI2Edm3ioGcoE9enbC3k2qN/7DKD1mpCMT9FEdBSi2kAIWsK81ADrexnzux9/+uEn36uY3wVfIvZ/qMrqZgYP6aPyd5KCpxBma4jg5tJDDY/hIcRoCMFa2t/UNi1/AphSFiFmcmSJXGPArs5maQypwzWo0DT5+/dhGvTU4Qv/qotYnT98HaTBSP17HTp4ntQPvkNH/2r7Z7DyemL31K9ydeq/VrPqnPD3NpMui+duDL2M3ptVWYYHiTbKTM1/k5TTGuvl9meHqvPXPyf8zAsjUERKouZkbi/DQt30JafFWONeQW6OK7jiAXhEQVtsklY+eyFPc6ClJ9OoslsmDp58JFAQO5o1Uo8SQ850bHnXEuNUAN/isWkIeG/HpgC0jrPxYyMtjCDQUDYbGvzi12wrgV0ItolAX/9VKOVZvhYdpmBOi9NQgSJT2RSMKXH8bQ0KGmYTMCXFKZBxhsB2hKlgSvq7vh6jD92Do1uUpcU9ZLNJy7W0N/ehcHNCiBY06zCkBpXDlJRqPAxScSMJNDaPakEi0CE09DEtSMGclmA8DFIwpqQYjYIETEkPDw1QFpf0ihyQehCvcbdPclok//1uQWTp2XcLIjBKM8+hJxxKlWozepqAiJIiuXzk249wSBFGx73pOIYOFsvH4POJ2bMmVE8/+hGOScII5TNofnxDijA6+VaYH92QIoyu9m4uNaa59I+PeDLOicJIgUeGBqfXseCaEnhL1KAE3ggNjVKAGzIBM5DMitpA0tIEDpm3tPJkHJOEj9GefB6xJ2x06vSKgZa1JquWMIBcHmv659dMFZZn6HslRn5Rz5WodghasxotNzTEuCwgoP+sWaeYx1HkeMzyS1f49lAtVRgt+MjUoPU8JrUVMeRBlkUBB7/HMqT22RNdEPvuiNoNOj9en7g4doPOj88noN6GQedH6PP8t92g8+PzeAnXShc22JsJw61JP1aPt2rt1qTnOIRpq9DXRA1Gv7dCN01Yb9IhEYY0cBxaJ8bY0X7cfu5TG3a0HyUwPgTxRkZSpw/+D+3IofPzOMzCFu59rk7y49F/0mv5/hm9EmETmZ7BwRHRazr7DFtmc7zKl3vnsvfmBcwls7ixOLWkQQsWBQCrTDs5wjwZEKBvQdv5/Z583lMAtiP2hOBsCi1YamCpWBEolISWzh7QEVsx4W8MTq3ZOW5rWRyGbT0tuicE8kMvLZA/VxMLqe2z9zFD/4JoWfAiNPxuFuVnnrRZEzVdVZU1DGcDzftEaaMm00kUi2OeiVqCXkjqy/GkF8xpncfxCGqPCX7+58xEmRdpJS+5FqAraOF5WBARZKFq2AvUgY3lUBdOlKm6UVgRlwFMKnmRuE4eWQ04fwaX1TBE2RjQlTyS0cvVgLEqecQgj3T6KZxAkepG8DgGxSb1kLhAptKZM9AluhChAzSRUh4nYmgQ/wR41QTpNQnwrfSXit2Td3wNlqhcmxvgiDqoQAdk/Kgk54S4fq5a0Es8fgOTiU00TR4kdgn+kvOi3w7HVk2O0wCd6TBeNJ+BkXUo5oGIQdzpvSRqqEh9Yvw/QJ+GitUnhv0jBGqw+LG5jzmX01rhqikusbFab+zdAaWpw+IV3n386hiNGjBe5cd3d8eo1ICRKq+H9O0rWd/msbI+DtC4QCa1GcgnGxOb1magFrsEpynZB5Z1sHhn/iU7Yx9i36AubfQKQcdn+0AUuwx91bZ1cUVYmnN+DCNzRCVq3D0DOHaYn9YFOK1keIDqINEhUao3ZQvjY/BZihJe8SLhRZyi9kos4ndIaMaWtJVPMEGuD8Flr4BpSnuoxHOXZm1aRPf8mb6wNzhIMyBAdbP1oCysWcgzIQbZFP5cQ2gmTBbSTDDOkqOkj9ikgnH7h7t6afYPTUwVGKLtUDvyu6INAlLpsTqkPEr3jE4juq1Z0VSsFtwHZ2CX6bDM3EDXO/FZuXnfA/XMyCEjzg7PYRk5YiTapqHPxsHz1z4VTXbKiv3aHTo1WBlIxR9cDZssR9TAQSPuFskRWThkeLJT/P6PU5bOlQ3zBrGWvHpotJABRuuuaXkSNW1Zg8KIQApe+a017LTH4tt0NhvQy2TFxUSSHV7XJSgoKFz3BOndVX1b/GYFrTc/yHK4CX/g3gqp+B0S2l2tC1drFGL5GwT0C2TqQl9gH7FsO0jyjH7kXspB4tcsR+5qHZgJ2iPf1SbIQcoHaFKrTd7TlZVJPzDaCEilg5/wCZEd8LbPnmR9MXdckW+y0GfimMK3Mvz+ThVHn5HPf6QYzVqCF10TwvSIgYGJPySa8VSArCOETsCkapHL8T29hItwHXbwMj9EsoZNqhm1M7snmGwrVgcl2m7a033AXtMS/saKJEsRjggu/ToBqXr8gdCedNrTIB2ZtS1v2uMazQKfZsYfwXOWZufyiUz4Fvjvf0dvZ/4NNYbmwhkfqzEwSVthwi9pgTDcdrTq2KSacabmnmI6I39lihwhdwSm7dvoraWl5E100lKednOVg80Rxb1ioC33Ef6YctfRaW3iG4/vwaFjA4p9SUCr/kDdBynGbUfuKqbbi7StE46QrGHTr0GOEHzzfiYBoJZot3dP9wFbvZtLhKP06wQHrUGOkG6gH7YGOUL5Av+YNcgh06UG/vvbbszki7xtGZfZcC/ks287pktFUc1EReDu+S8gZ+/7HSqCJjbCETlUb2Rig4XilNhkxOzJwyqAqGvbSoRe+wbL77CTy+N4Hkdl4wy9tgtEsq2haQmvEw1E8zjQYElcJAa86MxqUbvtYYJNgs/XfojDV6n+4Ru7qhazZeR+WmMjtcejhRv1HkkB7npWeTuNYsdnCLXkHrVolRDlF0Cs1l0ZIwRaSh/NPFIOY5F8ZRGwKbKvzI6IFgrcztvXFnI4bJcD3/7aVxS20bUQhWnX6EaNbdEkzZm4LR/RkPGtmKgJk7TfoMaLsXRGSw1j5Jwznzfid/u/gPIuujELJ5H4tABCGjU0msIEEZypcc6/fnv37uMHquqZEcNLZMY42WEp6oxYKEolviIf83OHfid8LGwFFl4qKvlpBUZRaSTKQmXha+m3R/ZANhAqsPCyUMlPKzCKWiJRFiqLIEJpmvBHlt1TVdSIF14iI8LJBklRY4QSEfpeaOtGvg6GMWb4pX5/h79cpmCerndPNFfMxqYhcxc1FY/TC+RtkKWRKVKflLLTpO+0CU1yC+so1TSS/YeTl2nErGvLK/fblVlAiJJTZVTzjLMGPS+NcGMNfIiucTyCv2GeVTrk77QQeXKy/O6GmyrrrimqolSGpTNRH6QmSououj2HmHsbQ5C/9W9tAdrKavCuiN5//eOH//Wb+3xmOa2oMjttZHzq5B9Ou5REd16XK5CXztseM2kW60vDC3mlprx/6TzuUpNmUm8pf/zxpdvmyHh003yZnO0QH94wXyaHe8xHNcsPb1+6WU6MBzfLF8rZDvHRzfKFcrjHfNho2Y/H3itE/FROF77CMaEenrc95heayg/P4y71sVP5i7bNkfFFpvLP0TIPyeDmhPpZ2uUhWVxNrC/ZLCfGF5nKP0OzPCaDmxPq52iWwVmkCiLUKxOCo/KB13WaQPxE/Qpik+Qld/or9loU+RAR6Pe7n6KKr2JR3NUPvInevU3O/k4fQ32YWba0xy0y0u62ILl7yRzdheaIpndJIbPcfh8ztHMtsr4FjTwhmouOWuwClUDnKvs0jWoLmqhke98icsU2aOK2QCuWTueq7x/UMEA81Hk5qMmAeF5yetbUtCnVafyIhzdoBMjJhkpa3QISbYJahX62uqybhrYyJSC+NiXKyYpLWZ8KE12hG1o/W5U2/NeOF7FXfC13WU2o+MqdoE7bDP98V0S2/7CsKpnbzbpZfd3e0joRM0Dt/0r68OxU2EUTdbZfuzh3ms/efUZZBCctZ+MrqqeB9eR9Q3FJ3hTvBHKzHejILUGHQAl5rNMWKWSCCBZyZg3/6kO4ijl9sIS9Z6Kd/N4vQS/J98PRufkDYs4tqyArZXAOpJAlCrJEoseaVdhimUDCxey9n+BW4f02wjL6eIwogyExhnxYcqE0aBgEUqKCP1LIGXEQkpJm+9FugJIhebCAfPtJBid77vvWwjLv+++qA3If8IL6cthKr0WHGLnn9EgJYkG/E7kQqGMCwYrJS0S7MDEIpAhDGtFd1zjBksoUUSxD4mDyiiPa6ZA4nPwewX2PpI54jJg/5/QICUh7WwNAiEDa2hoApjJwNpUGED5zOGIZu2eOkIDFdhFRVWbbgauhSiaUcBuzraOkPm/H7XXbmRpCsIybMFaROgyI8Fv86s35cBVz+vAqKYumZTJgfZojuu0KJlhQe6s5S/aCOzvFGBDho8iwnYYYRjQEtIz94PNgLQGh5peCGobVoiGE7+tkwmTaDbvk3tfRIcJNwCLKu+24F27Tb0qP3Fpyx2QF7jEFhl/dWTKECzJBsGIISmgNRLGOweoZMKjWMQRyRhwiSaLEH1iT7tyk9tRmAJLsKFK0ri248Pm9j0fcxx50xA92z/J2MJIN0HBRJgjCEtp9HhBgAvm//7dnjEVpXiGakh2LShq6pW/jYVYXCD2tZyjpBXnCz92VoFzWOKit5CkKPMsQhpINCSkLO5gvUWiWyOFyFijBcrK8bLdjujh1TMkRm+3ydbNwBXN6jATclKABhIuoGteLsW4dBgZKyv7rvCAlAa/xWoTIpfVORH+QkhkDJaWtWYwYQgyI8OUwS6TRFi5DA8DseOKnngUIevsVIwTdfcd9ZISICQC9VUJROTao8NiLAk3M49GNZxWvEfONBQglCl9QS5Twzdkmi3prDF1KViiUsDhLUVtfJgZOilp/NZ3oLA1B/e1CooTmabMdTAmka0RAyRCg794TWMB2LAJpu09Secjyf3hqIenp49s/ErSoFQyuubP4hjgoMSDI+h1SzwKJYmTCCZow6Ebv6MoLXrOWI7wjHKDovndHUnpLJFx1luV9im3vEwZu/G4QZ4IaAEE1Nbx+wLiQ2pBwstL4nmPbzYSBLSF0waBEyPE+XMGYGjdrxWKJi3GDWYBgxSAOa3UErAxEA9URkDIaRMfVEVAykG5SBgReCL5uDBgKQdhaMmBQK/jxvAs5NVuhCIRRKKIqI8YZwryyAJFUHPK+hxWKQlhSi0Vbf3KpjMmijNT7gxg/UiA6hfwmK1vIs3M+oi2YJFLbshaQNBJnLAppqIsvaxwKSZdLciPRNAJRiFJP0VKIGoEoRKHuTK1xKCThrqtYgChE1ZgLRGsckiGBaDQgKyM15aHOBxZAhHMnhayQ97p3hKHcCi1AVKLQh8bbeAfYHCQyLZjHmkcHiDbRqSZ2CqEDDtnETqFpBCKb2ClE+T9Wvy0KfzyzAUYiDuMhtMahMoQoJA04ZIYQhaYRiMQQYkVS5kjXzm08KluNRBrSC8w0sigUNWTVuFymkqhbY1IufUkkzlgQaZh3YtIizrrE5xkeVPSdnbJkO6+TbhbeIH/6mfk+lmqXUqcBfXOlZUDBimmKdwRiBhQCMYEOXzZFAa5fVllDzB60phkHK6gPBYEXNOFgBenBdPCyFmhYcV2aJcJ8u5QE0gwspLBY/CvLKAYDHQkrKiZoWAMIVsqNif/dvSXQoyGRiKrK7JlK1oiFFqaudQVeDltLM9Gw4oiGBrJBIQ5a66zkeK907GLKvGLt67s3TwSSDCy0MBW8nyW/dE0bZfzK4ufxsJFA6S74EdIvtVhmBV2MAYnX4UnlS+tdgfdE1PIt8OTym05u0PH2wCxYKEiz0TQBy/192QMkqUzl+0Ssc8SkEUrZA8m6mxb5hEKbCYeVNwbMwSvTkJCilA8tXtEEg5ZDsMJPSFb4yY3Ahh5AkFJ4HHJYsNQyouDFUPT8CQYt55ew7eW1oF/8t5c3JAUcN63leJ412aUMkcvwcmYgrKSw67MrQf5XaK1yrhRL5SvJUvl2n1zwWkYUrJgprBpekQ6FlJXlBBPEAIKUMqCRrdbXeFiBAU4sK1Ge/isbQj5SKPlIIYXnZf0cnbvLhdcRy7KSYAdhAxQptRCLoKaUF0EImvwCDCstFcuJ+4DgVCtZMxBSkgyXi5YzgCClyOC5aCkDCFZKQDSElRLPgAgbQuLm3faDUB5iRhwCQQSj0gRDIOcPNHL+QCFnjJeJV6QhEYkiWt+v4KjkSQWE8kY4rLwye373/i1Fm9eQsKLq9IG1PGJxzBuCaW6NhxU4BkjFS9OQkKLqVMwOybuvCA7VDCisLIp9AW9fJauU5sYIPCJGFLwYGRuaQs6Agxf0nkTOexoxHyksgxkHK4jihIDmTGAOUUEhaIaikKVHqqBRt0CkENmHO6CRN2ERCBsu+JMIm7GQwuZg7WhdBhRWVprTaJpwkIKGh2nxijQgpCSa40KiA8IpTgGJoBGJRhRBn9ORSEQ1BNvhOpKHrzL6rVVh1WK9erGuKELCic7jZLi415+Ys07e+inYOeOI3aVZ4BYuqejhTD3hFS8SXsQpZoJea9+APyIL9/xZyErr/q3vAzKxJjgiG81zURbPmIOLzQzo0L8DD1upk9a7ts+0xGzTQl7ArMoGZ3JqZWmHpZVc1cLsaNMHYskmLK1k2SvEIC93UlBmjkX2GppGeu8wSSJ1hqKShjseNKRRefIaF29Dr0lbFK4QiYUWLX9qG+pxYB/+mCwc0MncFMdkhXiI24enyYIArhGblZraCYlGGNaxVlNG50A7XL5Fnwlp4giPhaYrpUPLIdFnoBEJTH8j6iETEpGwtu5imslzhqKRRmf4E1v4DyzriJTNUIcs3EGfwj5aLv5LsQTsd/pAewBH3Cz+/9o7F+bGbXMN/5XOTudMO40sWZJlO+2243i1iU99qy9pMydnOBAJSax5C0mt7ZzJfz8AeCdBiQRe2elM2snu6vbiIa4fgA8feiJs1cr6pN5K0opCHBK6A9c2wx4TquJx8ppSeisDHNa0+1bprbyOY++NN9WG8C6cHgv7HTlTTQyfH7LaZYQ+g+mzfN0VtSEPoe67GNeRVn19Tkpp2QSfo5kohtDrMTh0BfSUBrA2vqjHkmZ3wkhpQVPOGPn8ViAvCvw+6/ZdWevqEObeDvcdaTX876WcS6dXrKeOlLkqhNH2liEx7B4+8R0xy8IQ0sQBGM5ZyGIoe9260pWx90Us2wg3TmwHpMdySFfKkjCE1PFXq30M6yVdTI6yLjl1/MZnalUbwuvHexg4M1EIYUgYDxwxV4Uw9nOQ7Yio6iYrJdxYPc7IdQRMNSF8UWAPIof0CTvYkbKijGGlMZ8D4NtNWRg0TkYRWdHA93s4h3QeLCvamHbExMw1sfEDUkUZwxpSfKZmohh7XtzXtCH7MOYr0r2X+Pq6wUgfb0HMp4XvUTEn77MMvf0ZJbLaodAqisYyhs0EW6S1I5NRI6Lmpk+c6R2cFUVdvGQphnU+feJP7gCsaWIQwTWzLoqDBJrW+gtlzeBhnkedNEAoLDclsihQ37PjPmfuO4IWstqg3GVIRP75Yvdzrd2FKhHWhcWtj5tqy+GNsDckAHePNUkAIJIMguS6dsRrBLAB1zQhYZZwcFDXIRgWym/XIjGJcGscJTkMGNLIqkmCADcB+xeuNUhkdUGBmz6qez372+VR3NxpAvW+kHwnl9L15G14kZVdtIoDrGi+bXii7WyoIEVrihtBMy1dJJuHoH/lW2jmE640JbKaoLbpBj0O327Hy8V0oURoQRNmsJX1dNGAuQXJq38T17BoTM1+jrLb0RqiupC+DTQlCzXdcFm21yMCzHaoTAuAZLg0Dm0TNnjWNRGIIekR36gDXqqni4bdd9TYbpRsNKKoXIwx5NJobSCtxoqgPlzU6zKYnWhRj/tgtoHxrXIDustZk9QNPkbiPhd5bEfLxXSh+sT83IEEifzp0ZhPwWBQhRwGzAg2C8eOel0o0AmxKgyABXYgJTl9sGc/fOoZCmsnXUVTN3QSG1jYvMyzcEVck9SNV8Q7JHHVJGzkqklqA4or5bBLbg1RDKTne3vhrOjqRl6BLjzAlhwiL4YNHpmWLlIYgNeRqoowvDToKqwBy5UBuOC6V1HUDbBDoicHt3ZektMFM/uc6d5BZUIOdcc4Oy+G2HlMhZ9BBUJlcpBoUjCuXA2ChdyOqSrq4gG9uFSdt/bnqqnoodmMv7X26XJpiPvNoj6XKG7Hkwq/36HM7OFrxxSj0NQ5Mdn/0GWLUBLkAXRYMlzxC6dDnw23QaBQmixT8hJNwIZ1Tcz5ON+iIowrELSuCQH16DOOMBfbu2elfkQy0w8BlbvmyIip5blo7C41Coc/Yd3TctjUxpxiXYSGwxLmhiYYuKaMw/VN4uyFthCGwebefnjcijTueJZJ+F2JdhRTj82OjJiIQ9NY/B0JYTpIKwj9l9f9PIBE/M2c0us9WdlLF9OPFecnNXOtjDasqmLOaiVOv7BWVuGVir9XKXO/SEzhJh6WehnFNYaFEMjyIoGRb3OB+KqCOM7MdxaFWdZ7vyoGtPeDIF3F182hxNSvyGHCoYQheUXhFVoYNh6iLqQiphEKsSGJMXFsj4SvrPqS0FyDUCWaINbYED6/IMqSGqZjIY7D7QwQYFUOQ8js+RBhTmWIVT1Q9+zx8LnMtkRB1gRBYXhMFF6mhDnCKXwAIGCFFO5wKQqt0AIFhTH95DIECF5VDkP404ZAJkIZYlUPw5g4U2P4Ci1MOJ2Q/S2iHOOMGokmkBXYkuuCEMrETR3CV0jByJJLPqFNRi4LJAYatHVBHCWwWtb0cIxRHOI684YiJnRWTEMS+6H2VkUZVSaKCaZke0/UEmt9INSGIijok0li2BhUUUMFpYKxIWtj7mWOYlthWwtsVUnw4ZeUPJ/fURG8AkebpiSINLaXNswEqsphCDcutFOs6aEYaWibrPty7RgI2hDFhGxbLvlB35B4sCbUlMSQPntsUAhiVPWs6aEY+aYCcCxsKEI4kzhbEMBCCkMW0iUNqTgNieGrCWIo49B4DvnCNao2NhRB4Q65GzYIsSyGoaMx4bchwZp0XRAUoC+0iWOwHngBK22JJjiYIAizLAclzC/ogIJWVDG8yOkifKaYe2tD8CpqwFCmGLhcCkaWXL6LqoMNRRgnkhDK5nxB9TSFFCicJisHhxrQ3GtqYlhfA8ojZuAmCw1FCOcmALbmstge9qrNPexVm+C9EAxjSWsPeyEYRokmbMUMQ5grIa1uDFpZDGnRYOjKYlCLBoNXUQOOxyC6QgvZQ2PgymLv57TG4x6CnNY8z994JtU51F7KIw42lGhiBjNAMOo6KyAStZxVN35yA1QzePI2SmR+6sZP3sWpGihoCyj0rjFAIOU6KiCK8nZWjVjKrazqgZRbWBHhlJu0gFjKcl7V+MANRMXgwC1UmiGCm3R68YHllOoxNxp84Dv6AHFl64iAoLJy1rUZzHQCXjRAa4JASo1AEnJK9TgSckrVeEkNOvB9jNDy1YqK20poRZimXNJCsenF7ZUAagXtlVIiQtLWQQHxaKWsqlFW63yKIValTBoxTOtY6gFMpWTl+J5Qc7FNGEf904Y4dqx2N6SUtiSIo1QNdiolVIx0KqfTiHfagEPfrUjUrtOsc6U6GCbVMKwNKORtw3qRWBtoOmFY2/mWfvhMQtTCTlMSQ6p6h2uDD3pvq+Jd7A0o4P3r6mFi61TKMWLlXJD4pw1GRPDTNl4RFZQ3OM+PYhtT/+SyGBe6PNUBT3GQpDgQQZ0g7LsSwDiIkZClkh9zBWA3FDGcmmFeG5R6MV7ljOk9kRjAkhjIlfKZhobJzLpFSJQvOWhgylRBDlg8GAGfEnlR4Cve5lnHlYliaL1YK5ZpA7Sqh2HUC7faQNSKtdpKCJz/68UvlRImoZeVL7yoE1blcA5j0auHGUArahg+HjkMQZbogNywFONhNqCQNxk/kye6wexZFFLvtkUu1v1BW+Q0MkxT311cIA0rapjIKUyRmgsgX66Gik4R0xdmo9k/6/vJJZBNSYwHmmlF+id1E8SSFmYh+MlaGtGajI9mIMKGIobTJSaYs66Imd4vqBUDTswljBU1jHGCzEJ47vENBMTp0hSvrAbrE3kvq+v0Ve2zcT5pWS+L48vVgFvwRj4txHBKVaH1EcNZUXsvE4YvIkUYC2ZJTLHhJyR126wQGUokMY7WFV3N4pShvmuZZldaYoqVWUDUS7yW9PIpwxrWFDG7wvk1niDIqiCWUbPCNRnftboxwwkUPzX3QIy0Q/UxqGFTD+aeZQS+4xhM33L0zzhx1hZRMHAECR1a5Y3Q8UOLnXB9zKoWbu9anyyXQUEZ7J0YU7h1NRwiP4wEIyzEYIBrysPqGzYMsiYIA+UVW9vIyiBLYjBAfg4SBlgSwxjym4UBascVKeASqRG/GJG5ptYGNMK0ymI7bU3bptJp42ZuRX8B4KuJ7aHzAUHWBMFtGwRZEoO2bQBeRQoJZ2QhpCG52CKKBY4cI6QmFRE+kMwN3XebxtBobfoB+MDjgq5sL99S1sy3hHC4RXwPpwoxzE3NPRw1wqA2NZGnelCUFTnosSPQlS810D1cqtQ404QFrshidv5YjVq9MvuLoLuENmUMNl+vs3i8PuLZFgxZogo9jIHBLKsB8fKzy0jKiijMvZvpozArckhA0E17NU78LXuZMCJ6Ux0WHMYpczP2EEs2KWpTE+Twy3oQ46cNDV/B/Wqb8p68QTHQcl2MU5lJYqxhWFeE+QtGMXFhHVdN8L3mKKz9oLZasmua9fKHAQ2rWrjz2gi2ktAejruD+PA9S/V4OgqzrAc/Wg6ArKlhz5Zj+HIpGBxknT3DQ6+zi8PqILgIOUeonqIH8eEbiG26mH6wJAQ6hD/F1byaGC5KAAINm2szg1hWSCNQvtXkYJCYreSMEb6VzEWTvQ1YPlbkYJBuoB3pPwPMpWBwwPY7g7ff5BC9PluhgzsancysHMSFRhxRronBtTCTNYFpwadpngXppHMZ1LqH/v3sAqsQwh/H1MdryGEgffNJf5ND8JWUYAcxicUMtNiO+EnpIPRftK/1E6TtwvAzrhhafLGXTqViEOG2dMynsPQFkodVLRgeCg2ItbEwWIXOe62diWPJmNWzhcOjDvNFVt2sEVDDuh7IUefFSCIZQO5aTUilorhD6BjIkhTsJLVhe2wOsyT6JwwSRpkmDjY5fA/jLORwiAFBGAolyLIgEJPqD2llSIod0zJNw7Ij02cDJpy2oQxs7Zp+ZOXWjrxAgunhHPRKkHtx0EuUUUcoy7R6ByhRw3ZCCPLKSxbLDPaH7wBs1fS1XBZzgrfq6ocxsTPsdm0sO+bUUZ0afu6IeK8miWIDdFd1zitRxfg+8rDyIMqSFo4NcpCvDIg+yScJzA+EbegCmSEmfYUWbc9zx27kEZYMViqL2RNMDR3hRQnwIExfy2UxxBuC8tbNYOuKcL9X6BDWJgw6rm3ZITVj7PglVd0Hb3JEyUiDGO2HXpYG5Fme6Cu4ZjcUccfe0ijoINCmJJwU4n4qwUW7oFa1EduVUmjw1mU11jyOtyKJIfWfA4IyespiMF/pchxwCKVMFEMLs8dcqB3m8ltzcc29KocjBDbumh6IMQSPRw1FGCc2L0N4XnrUXq0XsAl2VQ5KCJ1myUShBzX4uTUYa10STgo6sSMBxp/aqar7JtH26pJiF8J4as+P7aW9n/yuauPZSzcz4OFr4nh6Pi+19bcNZewVaTw50Gxo0d0DM3DwaxPGUpdu8cBS14T3RL2XWiJTh58UhK5EtQkD9/gi6lATtzEhE8XQQk42Z5ToE82JINSya0qCfOpMNkOIzbVYXwt9B7eK3i6NcUsQqQi3EcP2ltpuPelruSySGOL7W6VFewGnssBet6EIO4IrLtkAG0AtuhhmF1b4LrLMGQtLMl6jSrymB2FkIx5wB7Wihl+V1fSSka3KvquTDKcGRfEuguZCVrsE2VAqCtoOT5V9zwbYRjXcsigEd+mQaI2BLElB0NaUaIdLSMgKJQxY/SJpCKNMFBPfh7iGRWOIqZ6wNhXxu2vQ5t6ujNsYSm6xRdDW5CCIfqx/fDGhK5RAE+AwoobpWqyMtE2yhFAiiUEtX2cJAa0LYjCbt0VCYOWymJmlQ4iJOome4EokwWffjMVmuQSc+E55W3Qx0DHha1emv/EAKyEpsEQTZbivfbpcGqiYQAlvi+weOjFNY17WieHc85vNGIMrl32v+QcJbMzsQ9yeYzA53WxiEsOaGMaVMQz9EAVYEwN5ASZ3wqAYm3o44zMkzyjMph7IQ2q14lYDirIuB9oe8CzfNTzfS68+A9G262JW20j05NAYRduQe7POsGr553jlG+71Lrxt1+z+jL2frtHJs7GmdyffEMkOlaHuJrNjZhJZVDl/2UPl19IPK3KYpklFJGkGgSGs6r3XcB+xmRR1MEXIu0StKwV4/iRAw7IWcuNVqGMQm4qYGUcqqA9YKAHB0jkWJgslkkhUi/IeAMta0YTChpoXckhYQ/W7OLahUg+frxVNJOyaOgGYtSyJRA1CPxCDls6VN03cuixmt8ZnsiaNIj9xK9YaFFNemSbM9tdavWmOTMA18I0T2+nxq7QnhIC26eKHUwhuUxEOWpzFwuKWdVH9gfYFi9V+AH7FYlZQMDMFmHclmwKVf3XJfZgpSNaK5h7MFChrSXIfZgqStaIJhuUrM3jcsuoe7CokbVkSiYoI+NWk3UfIr8xiy+L1wLrXiuSebFZk5tZlMVv5xeJbkozukl6Je5v2ey3urC0HdJ87V9Kck3CJYaGD8SficnrVrsBSqme/Qrc/6lm21lFwni3J3mRZChTJMtbxmSvICqG9l5j+crtnBr+25fbkFg71Fs0eqVjKLomBNj7ZbMWwlyi+qt77bCZxR9QVvyKRDWyRwa/71Hu4Fr3eDydZiwiIh4hCyClb9DQpmbKxIJGOvwiHq8qAmHiQzYCfx9FacyzjNRRRpMtYtwdoSqHYXBybi2bTjXhaodOIeSrh07TTMjJ1M03CFGk5BWRIkbIvwK5+WN0ckffDalZJSw+nB1eVATBpzpcyJo2pUUud188njTmAvM7rI+Uqb+kbYjr9HQDrbcyxdWsKkxhWZfaSB32+Ws8o+kLcwKF9Zm2tRn3/qd9eD475FhWeKWo7JVnG5AZ4lB3GqujuIWofErauDJr/mtlODJK1Igv1lgzjGJytVWHMUiSNY6YJrgBlVczZXxKCMzNThOHhy7usiomUSxeblSGeXMVHqhW0qovvnNRM4G7dE27ppehJwLw1YWi7Z5MoF1sZ6srYBgZFLau+u5909BrFVG3bSvKAUuG3tIVJEAAsM5XlX2lGMyG9usOfJ5tdvEl9eSNTvPTcOtZ4bAYOYKV+EVmxRpHX52OqW3jSKmSahuvzcPtKbbT8tsisYfKsQ5PN2MrKiv2lWnfUknGsy0Dm3E8bugHnGiMc5rLvkmW1uoGuFDCjj196bnwhIRawrIrBDMCAARBthmabweCYHhYuFUTB8WWoSG1itA2xkIWBLkkU89TxrGVlHG6kZixuJ41wXk5cL6I/4SFTURgkD6YG7h4rsjBQeC9eEsVAJuFhoYiZ5Hu5F6kc+JRmzsKOXYLqrLk7TyGIOZay2CyBdJkcZjkIy+YosmEm/YID9DS51vvt8ez40q6Pm/s6m5Xt7WhyzRkLvzjajvPbjTo12caaWFVj+4JBwjms/6jxRtfFgl0wW+tLZ5idNQVcmpHt2MxUMxyy2DWllP2W/crgh/07FmdNQEwQe61qVDtEOzQ3DgmNZKK5tTaUn3NYAk8mqcOmVI/2upVqa7XoR9WxF9lrp9D+QaOfCP3YN/32A/iNXxQdae+aGHZbSWoaD3RFzFdjTfrECWio2J7pbKw+NVlec0ISrRmLZzlb+pMsXxsOxPmjDFOeYUNwrwvMW56lrWl2eJaGkHLDLF01oMFTVXmr9tjWxtL9hAHrOHiMUB5jS60h0GU4Gat3xZFjrILSsaE+GSx7iKHgGUpklYvfppSejMaHR1OXtK8G9gRsiCrj1R8VBCiR1UEMeBzaeIcDTX/EuqwyImGjZfuyS0+wXEwZZ+ETNh/Y4S/Wk6quqQxXj9ck5HcdG+sJuyuNvcAPRDDHt3iEIiXlB8lTFroo6KaqMuBW156eWP2delo78UHSZwzSPqPVo0O5Q5ckoF/IC2bHwMs4E1XGC4ntgHupmqSW0YZiyrTUB0B/GRuRvwlNml5Mk96mAxoI2+V1xuzsoBJwvC5LwnMTZTu2y2uaFyDAXEyvcYBoMi1lGMqvaApeUTwlOWWk5PIJEFAupozjUtcPYRlUqKkD2VG/ufA2nFRLfd1MRG9F4RRqcFuj3XsUZGv09CKVRYVCZWMupofDLAH6AmXKFTXB6EtMPXGJE5SuIquJmERR37XnoYTZkFYfzGNm2m+CwcqE9Sg1SXW0xL8WRZWrqXcsPhOlxN3u6d+3M6mLwpYms2fQXvRu7xm0LdNsxbuqqd1piVssAAtddbxCF9Z9gRkrwpqQSbTG9LoyNGhDHNrbgmEb4u+8f+DYO3d9pVnFf+cYxbMbpjuZGLyjJj0yjKsMt0ppbYUD+q3mZNpPQq8bJpsNRPbSNsW9JkZ2sUPPhaisdnQVVvFTaJWONgtD7FqAkSu6isRFdeCWMWst6VW6iqDtcvtxtpB8IHurtrgQZEdgeKFTi09giRPRPnuV4jDMQJyF8eMBPw6Tqg63p7veS7rrrenezc8+Xc0HNw+Du/PbA9eCIzQT2ELjEjubA6yoR0MSC4w43FApWEUqrWu3JF43gBnsv6kZD3v8RDxjFuHpE+X3Bw/vE1eRS+4pMv98NxlffTueDi+yzkxN2/RdNxmkVBUWvh87PuE9rLbCUFzQpK0iHGjEao2qWHpn89B0fPMp99XSyCW5oPBaURM8v7q/uB+e8yfVrAIZmiWqGfJhU0Xbs2MdOepa4Zeh5RL+F1BnGI2NyF55hIeW0JHUb0TU5U6vGgJJmOHhKrB9HZmAhnawZn2fgyh/4XQQboIYWamaohqtaCvpkPCAhJrC6aRc78kTF1FuyLCqFvgeG/PEJsyCWrETMXsrCPwwHia7bW+UDBvW+CU/e0+tf8Y1/LNTycwgRMmJSw3DV90qkizjI5tITRHQPtxgo9/zel/cCUhFraZ39pvUza6qIgCzfdlPtzI350t4xdJbQHFedHjk7DI7sKQ4owRTbIaTAIo3jrBgswJdVk7fGUOHAHX4wh9md9HBhZM46HDZNOLafnouxW62fY1nDxlQhKQGGzhBRNJbQXQGQ7GcnDhZibN8YgoCEsszeuEoD4VtksWWN1r52V1slCdybaI/P5MvqDww13aQ+bbwP19W4xc0b2Rb9Jk4Tyjd5NSaeM0bjbHY2E7MZvRGsH6N8seAlWWSXEC4dy1rIHz7CVakMu19PUGRYUGsvKK1SzqMImXtlt5JZ/ln2zFHFantR+N0TXQ+0yS21qJNXQowz4ocSgMRlmAvCwZZN2EkzlF6xPI0bDa+UdPwI+ncxyVm6H+iS74kyE8q5Yvv+YL22Wg8+nw4Gk8vrqajrr++vzTObz7N2R9XtzfX8+sH4/6H+4f5lVi3/0KcTeEF0kPy7PbWuL27uZ3fPVzM79VZzi9vzv9uXJ1dn307v6sgVVaDeyWQa589nF3efMs45/fstTrkp/n3F+dzgz3sxe1387uzywpoupJbLA9qJHR19unu+6q6WJJVl/z29uKmIsiXQdXlvjsTOXx1c10RZbN5Q2pm9ZRu0HJhfWJW4+8ezhvCrNaHcedm2JS+uH6Y39093j5IK3Bj3bRrQmL7wrhmdc74/uLu4ZHXN9VfGt/Nzz7N74zPF5fzCt1//bTx4z+bbmRHhscqsPHFDuMNcQ7WySddk7z6Zv7p4fKe5cr154tvJek48Z9LK5fZoYe/dn6km7uH+b+uJn2/b8w/X03GxtXF+d2Nwm/vGqtHrb9ineD1w3d8OzXLhNvLs4fPN3dXBu99zu/O7r8zPj1e3Rrz67Nvatlz2DWV2+9+MO7OLjpXhZwhqQCSss9nn2tKxM2G/Qq++djJ4xnfPF5cPlxcG2nNqKTcedQqqbNh5r/n5w/G5cU37bVMoFedGZaUxJuQFnWu3/Pd315czy+N3fnYuGevXzrGt9ePxv3N4935XCnr7+aNanf+3ZwNqi2Z1OXEnnJNyMqqjKXA0busGl3zzUORHWff3D/cnZ0/XNQGLT/OC82oHBFXTjTPiGo6bSu8PdpWpxpfdd/Rbc55/v19zrqe+ef53fz6fH4v68VUmvXd2afaWN+5LyyppK00RS59cDW/v2dDshYtK+FyUg9nvFXNzx4emUH5ll1RNsbe3p+x4eSH24ebrcMtX0RLJjH9h1v2yHyUEZ3t1SPrx1mLfrg5v2E21OPtLRsflXNSyD4+sD9uzzJ8WZ+a2AulRQKi9BT1Oc9caqMVk/rONsLF3fnj5dmd8Y/H+ePceGTCbApzdrnlkTrXa8n0iPWj1VlRc/ulTy5czue3DxdX9VzIZ9bdpS+SBnzGWsLd/B+PF7xJXJ3d//3i+lsdvgsjr3BJTa+B2vV5unpit/fzc+Pmvjaby2foNeF0Q/tz7VyHZf7pT1u/uQ9n391JtCyTkU3sr6iX7M7zVTLqUBLR/HW+4sdTzT7dkXqaFSuzPpGSfq3Tl+oLEdIveb6I81z5Yuz7zk2QFjx/cSG8FPN3DzbmAX9lrgkP0sa+5Iv3t33twAw29SYY05cBK5u3SH1ZS30ZfDkaRPVduP0k7fgkZpaRXZs4h3U7pkvqfB2MlV+4PfHsWwdiCY0KD+pK6onHae/UhX/qjrST76R/3ZuhHcSVpH+f+aoWrYh/kzvKHjhvkCXLjWcmLuRU/B0hMqYng0ViAk2/R8F4xGMGjZGcynjzJ/ddO07uMTECXyztvAOEx48emTR4r+Jn6YdxbL9xwWce51ckEEPA2z+3aUQx8SzR85VHgsOTN0j75aUl9T/96fB4/+k/k9ATt2ERx3mHrM+Tpy9sgv6eAAG1iBfbZnU4lpx32GshsEGRhqEfRu+Bwb/h2j+TZJmkbJjbP7/F6CNu6nLoF1qtiRZdko1Td7eVA7jkiYohm4cX4bZ1TMIVjesELV9rGIMDl73zsadJqMkQrzfuokaRvrf/xOv26MBl73xMrdKBdTh7EwipZcpQ+PsD9v7HzlZqI4mi491JU3y1bYQYsBnix67DxBb99BBiNxh+pq1t0EiAOo8cYCSZ/TBYev4gefddgFoMKoFV/uzt6lJm7xhtkyDW6bgdu3tgfr0RVp+cyoZFo26bDP4p3nnbDNovjVK+NI2mwT/T994pb/ZG1Cd/Wu2YwY12S++bM/tk6ZMn7VP7wZJ/Nig+e9sMejOwPrm1fTFmsMw+f7dce3PAXu1v+2LKYMm/MBBfGORfeONm+faIvVpry1RoUD/4tf/mCSaRLwy1fK19tVZ9kVaTSCxTNhYpB2x2RM3oI//0QPzzLVhyky15bbgkqFL9K9X78XeDKxJ8/P0fbh4fbh8fjE8Xd38c/v4PqTvH9dnV/I8H4scdmJONqAPbogfpinkdN/WY9IPqgCd2n9zVeEpG49GS+7nabsPPVS+f7Eh2FYYQvbSjOBcubBPnq8HgOWR5wzoDSg2RVaU3XWbZ+WbjbVP+dkiz9ysPtZNi6dQ3OruBr8y27n1Y5GOP3F37Ufyfl739HpZ1bgeJR72owpE9GSednhUfJL4CFj/oYYmNsoOVtznIm9uCpEFZSnlSkiu+e5B8gfVIS4esZEGm3jvP9lYl2ayazwUG4fMLq5srl3qxVt1UKC42aPUosPTbWZH9VmCaBdZqTej3JnzJJopD24wHxLFJxCacfZ9YrK1/3HibiFqDzEbWEmE1qX62tafCFxLapHHcsFOBf+RmEK9Ay+e17zBLNfRXzGTtqbTLdtEcTH6rAPupANBiUxkW83lCp4GxssvEeloRM9uP1zR02OP9VhH+A3qCnb+XRt7dRu7SKGJ1a+BQbxWvP9ZnA29gKvSqxOXv/1aNf6vG+6jGDQOKRBF1F5AB9IW9yOUGz3a8HjTi7f9aplN95bL7Qi0aUM+invmq5k3y63kiftOi1Vhq6u4LojN3AjxGMQ/rUTR/yUKGile/+8vfXlyHfzUJWsC+fHgwEj9mKr7FOkz21uPD58HJjx/+lghki1LFHV7mgetbG9aiIhpvgoNzcZD1NvnaLcvjbwS4Hw9CMzgQjs7sx0wmoGH8em+yvz+KG12Tta5yvgfs1+Kx72Ma/JWxV16/0fOk7jH3NI6FD1HXBxnuD0k5c/fItDFTKqWSrgfSTtefZd1v/asHkSPcR+L2sNu1cLwHZmhmp2LMMKEU0UdsL28uP8pC9UpGrR3BmKv188NXH+4vrm4vL84vHn4w7h8eP13clOIAfPj6w//xc3U8+3788PWP7NWPP36IyBfKKrxvPn2fDvwRf/tr/gf/Av8f6z8Cm33Lerr0k0jZ2QdfZ/+IbDdwbJNHzoisJ2M8Gh8dzA4m2cdfZf/gUYtugubvW5aX009/Sf5gMh8+Ze5k/5EP8Asro4SFO8tGrEj+h5VJXhWYnhggvsrrsYhnwZ81j11p+/yf4h8iUEla07IPRCaxT1a2R5z81+LdtD2yNw6/EoIx9XhGTqdHx0cn09PDX76qwfB62c6y4xidAsmA5xvLv8lpf5TiFpGIFZHxhY15OiiH0+PRZHw6ns36o1SC6OhAHB0fnsxmk8mkJ8MidoqLcw1zqZb6bDwZj45PT7VTN6KxOVVCOJ5NZtOTk1H/MqhEKDH8yLQdh8R+qFc9x9PZ6eFsOlWoFFWgmK81a6CMT49PZ6cse3qC8CCkRmpzaGXF0dHk5HQyPjnqCSA5/6pSL1jyrGoenWh1WdmdNuq5cDI6Gp2Oj0+mPTkym9oQIaG0+qnTw8nhyfGpQk5UA3LpNYzj4/HJ7PDkcNwfo3zJtx7ElDVP1l8e9S0NBpFE9ktrRH1sVaKZnp5OpyM2rGqNH0SrbkzGx0cT9v++jVSExgr1SmN8OB6zvnvSu4tiiRdnnjW769H0kFcJhfGjHhNHIf3J0Wg0nhxNFTIgSz11xtDKhMPJyeT0mA0X/TFK9yAYlmmZWiCzyfFkykYshZ6qGhdca+CYHM9mbBjv2yKSSF9az398OpqNp72tqUp/EFE2YHimXh4cTY+OWN90omDv1woipCuWgJYdMzo6HjNj5rhv7SRBYKRzf1tv0jGdTWdHx6djhYIptw/qbvTmGycn4xH7r3PNzJzoihWKYWPpQaXbZhOwyfFx95E842D5wQrFye7Sil8DqmpMnJwcTkazo851IkO4e5gb51lMx0ixmR5NDsfcilB4/jyepMEygTi+YlWYHZ3MTtjg2XnYKiHQLzz5NfEsJ7mnr3/ybN7LasHhYe/sbySvUgMnU9YfMLNJJf/zNYAEQLEGMIvhiPWOY5XsbxAoNcIJm9oxy+Gks+0oIxC9ku3xk2amalYcHp8y22E2Pe48aLeSJMsyBY9SxhzPjkeT0+mhfsbUcZRaCp/1nI6OR50nHAWOXbMwjfQjxUng8ej0iBn7nYf0LSBxSLwoibumgzSbTmaH7D+VXsSPRSGp1RHWdU0OT5mRo1Aqecoqj3zC+szpyehYoeeyRXB9QE0YzGYnkyOGoTB8JxDpVgUE5nAyGTOTnxVIX5rayYD+o8hodDSeKZQFf9bCrlSpBaPx0XR6Kpn2ti3tp/dcKmTvyRGby4yOD5s1fVtaakbBeMRa9Ilk5bMtqeYdlgod7Onh6PRUNhS3pZpdhtk/rcnxdHw85YsF//vhl/8HIYmLUQ===END_SIMPLICITY_STUDIO_METADATA
# END OF METADATA