#
# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
# The proprietary variant sets USE_CAMERA_STUB := false, this way
# we use the camera stub when the vendor tree isn't present, and
# the true camera library when the vendor tree is available.
USE_CAMERA_STUB := false

# Inherit from the proprietary version
-include vendor/armani/BoardConfigVendor.mk

BOARD_VENDOR := lenovo

# Assert
#TARGET_OTA_ASSERT_DEVICE := msm8625

# Compile
KERNEL_TOOLCHAIN_PREFIX := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-linux-gnueabi-linaro_4.7.4-2014.06/bin/arm-eabi-
TARGET_SPECIFIC_HEADER_PATH := device/lenovo/armani/include

# Compiler flags
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a5 -mfpu=neon-vfpv4 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a5 -mfpu=neon-vfpv4 -mfloat-abi=softfp

# Qualcomm hardware
BOARD_USES_QCOM_HARDWARE := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
TARGET_USES_ION := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := 7x27
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Architecture and CPU
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a5
TARGET_BOARD_PLATFORM := msm7x27a
TARGET_CPU_SMP := true

# Optimisations
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
TARGET_CORTEX_CACHE_LINE_32 := true
TARGET_AVOID_DRAW_TEXTURE_EXTENSION := true
TARGET_USES_16BPPSURFACE_FOR_OPAQUE := true
ARCH_ARM_HIGH_OPTIMIZATION := true
ARCH_ARM_HAVE_32_BYTE_CACHE_LINES := true

# Kernel
TARGET_KERNEL_SOURCE := kernel/audi_armani
TARGET_KERNEL_CONFIG := cyanogenmod_audi_defconfig
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom androidboot.selinux=permissive chg_hack_lcd=0
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_BASE := 0x10000000
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x11000000

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_BOOTIMAGE_PARTITION_SIZE := 13901824
BOARD_CACHEIMAGE_PARTITION_SIZE := 125829120
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 13901824
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 996147200
BOARD_USERDATAIMAGE_PARTITION_SIZE := 982515712

BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_CACHE_DEVICE := /dev/block/mmcblk0p18
BOARD_CACHE_FILESYSTEM := ext4
BOARD_CACHE_FILESYSTEM_OPTIONS := rw

BOARD_SYSTEM_DEVICE := /dev/block/mmcblk0p17
BOARD_SYSTEM_FILESYSTEM := ext4
BOARD_SYSTEM_FILESYSTEM_OPTIONS := rw

BOARD_DATA_DEVICE := /dev/block/mmcblk0p21
BOARD_DATA_FILESYSTEM := ext4
BOARD_DATA_FILESYSTEM_OPTIONS := rw

# Charger
BOARD_CHARGER_SHOW_PERCENTAGE := true

# Low RAM settings
TARGET_BOOTANIMATION_TEXTURE_CACHE := false
AUDIO_FEATURE_ENABLED_INCALL_MUSIC := false
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := false
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := false

# Audio
TARGET_PROVIDES_LIBAUDIO := true
BOARD_USES_LEGACY_ALSA_AUDIO := true
TARGET_HAS_QACT := true
AUDIO_FEATURE_ENABLED_INCALL_MUSIC := false
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := false
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := false

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lenovo/armani/bluetooth

# GPS
QCOM_GPS_PATH := hardware/qcom/gps
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)

# GPU
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

# Graphics
COMMON_GLOBAL_CFLAGS += -DUSE_MDP3
TARGET_USES_QCOM_BSP := true
TARGET_GRALLOC_USES_ASHMEM := true
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
BOARD_EGL_CFG := device/lenovo/armani/configs/egl.cfg
TARGET_NO_COMPAT_GRALLOC_PERFORM := true
USE_OPENGL_RENDERER := true
TARGET_DISPLAY_USE_RETIRE_FENCE := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true

# Other
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
BOARD_CHARGER_ENABLE_SUSPEND := true
ARCH_ARM_HAVE_TLS_REGISTER := true
BOARD_WANTS_EMMC_BOOT := true

# RIL
TARGET_RIL_VARIANT := legacy
COMMON_GLOBAL_CFLAGS += -DRIL_SUPPORTS_SEEK
COMMON_GLOBAL_CFLAGS += -DRIL_VARIANT_LEGACY
BOARD_RIL_CLASS := ../../../device/lenovo/armani/ril/

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Media
COMMON_GLOBAL_CFLAGS += -DBOARD_CANT_REALLOCATE_OMX_BUFFERS
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK
COMMON_GLOBAL_CFLAGS += -DLPA_DEFAULT_BUFFER_SIZE=480

# SELinux
BOARD_SEPOLICY_DIRS += device/lenovo/armani/sepolicy

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 22
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun%d/file
TARGET_USE_CUSTOM_SECOND_LUN_NUM := 1

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
BOARD_SUPPRESS_EMMC_WIPE := true
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
DEVICE_RESOLUTION := 480x854
BOARD_CUSTOM_GRAPHICS := ../../../device/lenovo/armani/recovery/graphics.c
TARGET_RECOVERY_FSTAB := device/lenovo/armani/recovery/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888

# Wi-Fi CAF
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
WPA_SUPPLICANT_VERSION := VER_0_8_X
TARGET_CUSTOM_WIFI := ../../device/lenovo/armani/libhardware_legacy/wifi/wifi.c
BOARD_HAS_ATH_WLAN := true
BOARD_WLAN_DEVICE := ath6kl
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_IFACE_NAME := "eth"
WIFI_PARAMS += WIFI_MAC_FROM_NV="true"

WIFI_PARAMS += WIFI_DRIVER_IFACE_NAME="$(WIFI_DRIVER_IFACE_NAME)"
WIFI_PARAMS += WIFI_DRIVER_MODULE_PATH="$(WIFI_DRIVER_MODULE_PATH)"
WIFI_PARAMS += WIFI_DRIVER_MODULE_NAME="$(WIFI_DRIVER_MODULE_NAME)"

WIFI_PARAMS += AR6003_MAC_FILE="softmac"
WIFI_PARAMS += AR6003_REV2_BOARD_POWER_PA_FILE="../../data/misc/wifi/Cal_powerTuned_pa.bin"
WIFI_PARAMS += AR6003_HW_FW_DIR="ath6k/AR6003/hw2.1.1"
WIFI_PARAMS += AR6003_HW_BOARD_DATA_FILE="ath6k/AR6003/hw2.1.1/caldata.bin"
WIFI_PARAMS += AR6003_HW_DEFAULT_BOARD_DATA_FILE="ath6k/AR6003/hw2.1.1/bdata.SD31.bin"
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_P2P := "p2p"
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/ath6kl_sdio.ko"
WIFI_DRIVER_MODULE_NAME := "ath6kl_sdio"
WIFI_EXT_MODULE_PATH := "/system/lib/modules/cfg80211.ko"
WIFI_EXT_MODULE_NAME := "cfg80211"
WIFI_DRIVER_FW_PATH_PARAM := "/data/misc/wifi/fwpath"

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
#      WITH_DEXPREOPT := true
    endif
  endif
endif
WITH_DEXPREOPT_PIC := true
DONT_DEXPREOPT_PREBUILTS := true

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# Final ZIP type
BLOCK_BASED_OTA := false

STRICT_ALIASING := false
SUPPRESS_UNUSED_WARNING := true
