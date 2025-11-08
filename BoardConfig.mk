#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from Common Tree
include device/samsung/s5e9925-common/BoardConfigCommon.mk

DEVICE_PATH := device/samsung/r0s

# OTA
TARGET_OTA_ASSERT_DEVICE := r0s

# inherit from the proprietary version
-include vendor/samsung/r0s/BoardConfigVendor.mk
