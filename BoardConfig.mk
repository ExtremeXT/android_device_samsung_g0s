#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from Common Tree
include device/samsung/s5e9925-common/BoardConfigCommon.mk

DEVICE_PATH := device/samsung/r0s

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
#BOARD_HAS_QCA_BT_ROME := true
#QCOM_BT_USE_BTNV := true
#QCOM_BT_USE_SMD_TTY := true

# Camera
SOONG_CONFIG_NAMESPACES += samsungCameraVars
SOONG_CONFIG_samsungCameraVars += extra_ids
# ID=52 is telephoto
SOONG_CONFIG_samsungCameraVars_extra_ids := 52

# Display
TARGET_SCREEN_DENSITY := 480

# Kernel
TARGET_KERNEL_CONFIG += r0s.config

# Kernel Modules
BOARD_VENDOR_KERNEL_MODULES_LOAD += wlan.ko

# OTA
TARGET_OTA_ASSERT_DEVICE := r0s

# Properties
TARGET_VENDOR_PROP += device/samsung/r0s/configs/props/vendor.prop

# Wi-Fi
BOARD_WLAN_DEVICE                             := qcwcn
WIFI_HAL_INTERFACE_COMBINATIONS               := {{{STA}, 1}, {{AP}, 1}}, {{{STA}, 1}, {{P2P, NAN}, 1}}, {{{AP}, 2}}, {{{STA}, 2}}
BOARD_WPA_SUPPLICANT_DRIVER                   := NL80211
BOARD_HOSTAPD_DRIVER                          := NL80211
BOARD_HOSTAPD_CONFIG_80211W_MFP_OPTIONAL      := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WIFI_FEATURE_HOSTAPD_11AX                     := true
WPA_SUPPLICANT_VERSION                        := VER_0_8_X

# inherit from the proprietary version
-include vendor/samsung/r0s/BoardConfigVendor.mk
