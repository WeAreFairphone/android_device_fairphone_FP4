#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_SHIPPING_API_LEVEL := 30

# Enable virtual A/B OTA
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Include GSI keys
$(call inherit-product, build/make/target/product/gsi_keys.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/fairphone/FP4/FP4-vendor.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

PRODUCT_ENFORCE_RRO_TARGETS := *

# A/B
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti \
    android.hardware.boot@1.1-impl-qti.recovery \
    android.hardware.boot@1.1-service

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_client \
    update_verifier \
    update_engine_sideload

# Atrace
PRODUCT_PACKAGES += \
    android.hardware.atrace@1.0-service

# Audio (HIDL)
PRODUCT_PACKAGES += \
    android.hardware.audio@6.0-impl \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.audio.service \
    android.hardware.soundtrigger@2.3-impl

# Audio (Hardware)
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.lito \
    audio.r_submix.default \
    audio.usb.default

# Audio (Extensions)
PRODUCT_PACKAGES += \
    liba2dpoffload \
    libbatterylistener \
    libcomprcapture \
    libexthwplugin \
    libhdmiedid \
    libhfp \
    libsndmonitor \
    libspkrprot

# Audio (SoundFX)
PRODUCT_PACKAGES += \
    libaudiopreprocessing \
    libbundlewrapper \
    libdownmix \
    libdynproc \
    libeffectproxy \
    libldnhncr \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libreverbwrapper \
    libvisualizer \
    libvolumelistener

# Bluetooth
PRODUCT_PACKAGES += \
    audio.bluetooth.default \
    com.dsi.ant@1.0.vendor \
    vendor.qti.hardware.bluetooth_audio@2.1.vendor \
    vendor.qti.hardware.btconfigstore@1.0.vendor \
    vendor.qti.hardware.btconfigstore@2.0.vendor

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Soong Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.default:$(TARGET_COPY_OUT_RAMDISK)/fstab.default
