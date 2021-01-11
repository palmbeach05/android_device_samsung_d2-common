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
# Inherit from common
include device/samsung/msm8960-common/BoardConfigCommon.mk

DEVICE_PATH := device/samsung/d2-common

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Include
TARGET_SPECIFIC_HEADER_PATH += $(DEVICE_PATH)/include

# Init
TARGET_RECOVERY_DEVICE_MODULES := tzdata

# Wifi
BOARD_HAVE_SAMSUNG_WIFI := true
