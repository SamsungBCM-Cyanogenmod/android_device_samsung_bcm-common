DEVICE_PACKAGE_OVERLAYS += device/samsung/bcm-common/overlay

LOCAL_PATH := device/samsung/bcm-common

# Use high-density artwork where available
PRODUCT_AAPT_CONFIG := normal mdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Init files
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/init.bcm281x5.usb.rc:root/init.bcm281x5.usb.rc \
	$(LOCAL_PATH)/rootdir/init.log.rc:root/init.log.rc \
	$(LOCAL_PATH)/rootdir/vold.fstab:system/etc/vold.fstab \
	$(LOCAL_PATH)/rootdir/lpm.rc:root/lpm.rc

# Prebuilt kl keylayout
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/keylayout/bcm_headset.kl:system/usr/keylayout/bcm_headset.kl \
	$(LOCAL_PATH)/keylayout/bcm_keypad_v2.kl:system/usr/keylayout/bcm_keypad_v2.kl \
	$(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
	$(LOCAL_PATH)/keylayout/samsung-keypad.kl:system/usr/keylayout/samsung-keypad.kl \
	$(LOCAL_PATH)/keylayout/sii9234_rcp.kl:system/usr/keylayout/sii9234_rcp.kl \
	$(LOCAL_PATH)/keylayout/Vendor_04e8_Product_7021.kl:system/usr/keylayout/Vendor_04e8_Product_7021.kl \
	$(LOCAL_PATH)/keylayout/Vendor_05ac_Product_0255.kl:system/usr/keylayout/Vendor_05ac_Product_0255.kl
	
# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml
	
# Dalvik heap config
include frameworks/native/build/phone-hdpi-512-dalvik-heap.mk

# Charger
PRODUCT_PACKAGES += \
	charger \
	charger_res_images

# Audio
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio.r_submix.default \
	libtinyalsa \
	libaudiopreprocessing \
	libbundlewrapper \
	libdownmix \
	libreverbwrapper \
	libvisualizer

# Device-specific packages
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory \
	SamsungServiceMode \
	BCMSettings \
	Torch
	
# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs \
	setup_fs	

# Wifi
PRODUCT_PACKAGES += \
	libnetcmdiface

# Goo IM Updater
ifeq ($(USER),kingbabasula)
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/GooManager_2.1.2.apk:system/app/GooManager.apk

PRODUCT_PROPERTY_OVERRIDES += \
	ro.modversion=KINGbabasula-$(BUILD_VERSION)-$(LUNCH)-$(BUILD_NUMBER) \
	ro.developerid=KINGbabasula \
	ro.goo.developerid=KINGbabasula \
	ro.goo.rom=KINGbabasula-$(TARGET_PRODUCT) \
	ro.goo.version=$(shell date +%s)
endif
