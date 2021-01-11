#
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit from common
$(call inherit-product, device/samsung/d2-common/system_prop.mk)
$(call inherit-product, device/samsung/msm8960-common/msm8960.mk)

# Inherit from vendor
$(call inherit-product-if-exists, vendor/samsung/d2-common/d2-common-vendor.mk)

DEVICE_PATH := device/samsung/d2-common

# Screen density
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
TARGET_BOOTANIMATION_HALF_RES := true
TARGET_SCREEN_DENSITY := 320

# Audio configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/mixer_paths.xml:system/etc/mixer_paths.xml
    
# Common overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay \
    $(DEVICE_PATH)/overlay-lineage

# Camera
PRODUCT_PACKAGES += \
    Snap

# Doze
PRODUCT_PACKAGES += \
    SamsungDoze

# GPS
PRODUCT_PACKAGES += \
    gps.msm8960 \
    libgps.utils \
    libloc_core \
    libloc_eng

PRODUCT_COPY_FILES += \
    device/samsung/d2-common/gps/etc/gps.conf:system/etc/gps.conf \
    device/samsung/d2-common/gps/etc/sap.conf:system/etc/sap.conf
    
# Keylayout
PRODUCT_COPY_FILES += \
    device/samsung/d2-common/keylayout/fsa9485.kl:system/usr/keylayout/fsa9485.kl \
    device/samsung/d2-common/keylayout/msm8960-snd-card_Button_Jack.kl:system/usr/keylayout/msm8960-snd-card_Button_Jack.kl \
    device/samsung/d2-common/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
    device/samsung/d2-common/keylayout/sec_keys.kl:system/usr/keylayout/sec_keys.kl \
    device/samsung/d2-common/keylayout/sec_powerkey.kl:system/usr/keylayout/sec_powerkey.kl \
    device/samsung/d2-common/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
    device/samsung/d2-common/keylayout/sii9234_rcp.kl:system/usr/keylayout/sii9234_rcp.kl

# Logo
PRODUCT_COPY_FILES += \
    device/samsung/d2-common/initlogo.rle:root/initlogo.rle
        
# Media configuration
PRODUCT_COPY_FILES += \
    device/samsung/d2-common/media/media_profiles.xml:system/etc/media_profiles.xml
    
# NFC
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    nfc.msm8960 \
    Nfc \
    Tag \
    com.android.nfc_extras

ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := $(LOCAL_PATH)/configs/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := $(LOCAL_PATH)/configs/nfcee_access_debug.xml
endif
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml
        
# Proprieties
-include $(DEVICE_PATH)/system_prop.mk

# Ramdisk
PRODUCT_PACKAGES += \
    init.target.rc

# Sensors
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.ambient_temperature.xml:system/etc/permissions/android.hardware.sensor.ambient_temperature.xml

# SPN override
PRODUCT_COPY_FILES += \
    device/samsung/d2-common/selective-spn-conf.xml:system/etc/selective-spn-conf.xml
        
# Voice processing
PRODUCT_PACKAGES += \
    libqcomvoiceprocessing
    
# Wifi
PRODUCT_COPY_FILES += \
    device/samsung/d2-common/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    device/samsung/d2-common/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

PRODUCT_PACKAGES += \
    libnetcmdiface

# append the updater uri to the product properties if set
ifneq ($(CM_UPDATER_OTA_URI),)
    PRODUCT_PROPERTY_OVERRIDES += $(CM_UPDATER_OTA_URI)
endif

# Inhert dalvik heap values from aosp
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
