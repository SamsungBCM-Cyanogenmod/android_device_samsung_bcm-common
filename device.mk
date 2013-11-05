DEVICE_PACKAGE_OVERLAYS += device/samsung/galaxys2plus-common/overlay

LOCAL_PATH := device/samsung/galaxys2plus-common

# Use high-density artwork where available
PRODUCT_AAPT_CONFIG := normal mdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Init files
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/init.bcm281x5.usb.rc:root/init.bcm281x5.usb.rc \
	$(LOCAL_PATH)/rootdir/init.log.rc:root/init.log.rc \
	$(LOCAL_PATH)/rootdir/vold.fstab:system/etc/vold.fstab \
	$(LOCAL_PATH)/rootdir/lpm.rc:root/lpm.rc

# Prebuilt kl keymaps
PRODUCT_COPY_FILES += \
	device/samsung/galaxys2plus-common/keymaps/bcm_headset.kl:system/usr/keylayout/bcm_headset.kl \
	device/samsung/galaxys2plus-common/keymaps/bcm_keypad_v2.kl:system/usr/keylayout/bcm_keypad_v2.kl \
	device/samsung/galaxys2plus-common/keymaps/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
	device/samsung/galaxys2plus-common/keymaps/samsung-keypad.kl:system/usr/keylayout/samsung-keypad.kl \
	device/samsung/galaxys2plus-common/keymaps/sii9234_rcp.kl:system/usr/keylayout/sii9234_rcp.kl \
	device/samsung/galaxys2plus-common/keymaps/Vendor_04e8_Product_7021.kl:system/usr/keylayout/Vendor_04e8_Product_7021.kl \
	device/samsung/galaxys2plus-common/keymaps/Vendor_05ac_Product_0255.kl:system/usr/keylayout/Vendor_05ac_Product_0255.kl

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
	frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
	frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml

# common system.props for Galaxy S2 Plus
PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=240 \
	ro.lcd_brightness=180 \
	ro.lcd_min_brightness=40 \
	persist.sys.usb.config=mtp,adb \
	ro.product.multi_touch_enabled=true \
	ro.product.max_num_touch=2 \
	ro.opengles.version=131072 \
	debug.hwui.render_dirty_regions=false \
	brcm.graphics.async_errors=true \
	ro.tvout.enable=true \
	hdmi.orientation.locked=false \
	persist.sys.hdmi.on=0 \
	persist.sys.videomode = 0 \
	persist.sys.hdmivideorotation =0 \
	brcm.hwc.no-hdmi-trans=1 \
	media.enable-commonsource=true \
	persist.brcm.gralloc.force_hdcp=1 \
	rild.libpath=/system/lib/libbrcm_ril.so \
	ro.ril.hsxpa=1 \
	ro.ril.gprsclass=10 \
	debug.composition.type=gpu \
	wifi.interface=wlan0 \
	mobiledata.interfaces=rmnet0 \
	ro.telephony.ril_class=SamsungBCMRIL

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
	libtinyalsa

# Device-specific packages
PRODUCT_PACKAGES += \
	SamsungServiceMode \
	S2PlusSettings \
	Torch

# Wifi
PRODUCT_PACKAGES += \
	libnetcmdiface
