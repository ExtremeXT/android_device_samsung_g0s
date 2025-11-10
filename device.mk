#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0.vendor

# Display
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080

# Init
PRODUCT_PACKAGES += \
    init.r0s.rc

# Firmware
PRODUCT_COPY_FILES += \
    vendor/samsung/r0s/proprietary/recovery/root/lib/firmware/sgpu/vangogh_lite_unified.bin:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/lib/firmware/sgpu/vangogh_lite_unified.bin \
    vendor/samsung/r0s/proprietary/recovery/root/vendor/firmware/tsp_stm/fts2ba61y_r0.bin:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/vendor/firmware/tsp_stm/fts2ba61y_r0.bin \

# Overlays 
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# WiFi
PRODUCT_PACKAGES += \
    android.hardware.wifi-service \
    hostapd \
    libcld80211 \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_SOONG_NAMESPACES += \
    hardware/qcom-caf/wlan

# Inherit from Common Tree
$(call inherit-product, device/samsung/s5e9925-common/device-common.mk)

# Inherit from the proprietary version
$(call inherit-product-if-exists, vendor/samsung/r0s/r0s-vendor.mk)
