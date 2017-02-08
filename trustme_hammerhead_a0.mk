#
# This file is part of trust|me
# Copyright(c) 2013 - 2017 Fraunhofer AISEC
# Fraunhofer-Gesellschaft zur Förderung der angewandten Forschung e.V.
#
# This program is free software; you can redistribute it and/or modify it
# under the terms and conditions of the GNU General Public License,
# version 2 (GPL 2), as published by the Free Software Foundation.
#
# This program is distributed in the hope it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GPL 2 license for more details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, see <http://www.gnu.org/licenses/>
#
# The full GNU General Public License is included in this distribution in
# the file called "COPYING".
#
# Contact Information:
# Fraunhofer AISEC <trustme@aisec.fraunhofer.de>
#

# Get the long list of APNs
PRODUCT_COPY_FILES := device/lge/hammerhead/apns-full-conf.xml:system/etc/apns-conf.xml

# Copy audio config with disabled offload device (due to missing kernel namespace)
PRODUCT_COPY_FILES := \
    device/fraunhofer/trustme_hammerhead_a0/audio_policy.conf:system/etc/audio_policy.conf \
    device/fraunhofer/trustme_hammerhead_a0/mixer_paths.xml:system/etc/mixer_paths.xml

# Inherit from those products. Most specific first.
$(call inherit-product, device/fraunhofer/trustme_generic/trustme_generic_a0.mk)

# overwrite dalvik parameters with values for a 521MB low-ram device
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
PRODUCT_PROPERTY_OVERRIDES += ro.config.low_ram=true

# Inherit from hammerhead device
$(call inherit-product, device/lge/hammerhead/device.mk)

# do not use binarie from any device specicifc hammerhead-kernel.git
TARGET_PREBUILT_KERNEL := device/fraunhofer/trustme_hammerhead_a0/dummy_kernel

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := trustme_hammerhead_a0
PRODUCT_DEVICE := trustme_hammerhead_a0
PRODUCT_BRAND := Android
PRODUCT_MODEL := trust-me Android0 for hammerhead
PRODUCT_MANUFACTURER := fraunhofer

#DEVICE_PACKAGE_OVERLAYS += device/fraunhofer/trustme_hammerhead_a0/overlay

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=adb

# include binary blobs
$(call inherit-product-if-exists, vendor/lge/hammerhead/device-vendor.mk)
$(call inherit-product-if-exists, vendor/lge/hammerhead/hammerhead-vendor.mk)
