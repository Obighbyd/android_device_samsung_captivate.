#!/bin/sh

# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE=captivate

mkdir -p ../../../vendor/samsung/$DEVICE/proprietary

DIRS="
app
bin
bin/gpsd
etc/dhcpcd
etc/dhcpcd/dhcpcd-hooks
etc/wifi
firmware
lib/egl
lib/hw
xbin
"

for DIR in $DIRS; do
	mkdir -p ../../../vendor/samsung/$DEVICE/proprietary/$DIR
done

FILES="
etc/asound.conf
lib/libspeech.so

bin/BCM4329B1_002.002.023.0417.0430.hcd
bin/mfgloader
bin/wlservice
bin/wpa_supplicant
etc/wifi/bcm4329_aps.bin
etc/wifi/bcm4329_mfg.bin
etc/wifi/bcm4329_sta.bin
etc/wifi/nvram_mfg.txt
etc/wifi/nvram_net.txt
etc/wifi/wifi.conf
etc/wifi/wpa_supplicant.conf
lib/libwlservice.so
lib/libwpa_client.so

bin/btld
bin/dbus-daemon
bin/hciattach
bin/npsmobex
etc/jupiter.xml

bin/dhcpcd
etc/dhcpcd/dhcpcd-hooks/01-test
etc/dhcpcd/dhcpcd-hooks/20-dns.conf
etc/dhcpcd/dhcpcd-hooks/95-configured
etc/dhcpcd/dhcpcd-run-hooks
etc/dhcpcd/dhcpcd.conf

lib/egl/libEGL_POWERVR_SGX540_120.so
lib/egl/libGLES_android.so
lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so
lib/egl/libGLESv2_POWERVR_SGX540_120.so
lib/libIMGegl.so
lib/libpvrANDROID_WSEGL.so

bin/sensorcalibutil_yamaha
bin/sensorserver_yamaha
bin/sensorstatutil_yamaha
lib/hw/copybit.s5pc110.so
lib/hw/gralloc.s5pc110.so
lib/hw/lights.s5pc110.so
lib/hw/sensors.default.so
lib/libms3c_yamaha.so
lib/libsensor_yamaha.so
lib/libsensor_yamaha_test.so

lib/libarccamera.so
lib/libcamera.so
lib/libcamerafirmwarejni.so
lib/libseccamera.so
lib/libseccameraadaptor.so

bin/drexe
bin/rilclient-test
bin/rild
lib/libreference-ril.so
lib/libril.so
lib/libsec-ril.so
lib/libsecril-client.so

bin/gpsd/66ca3eb6.0
bin/gpsd/7651b327.0
bin/gpsd/803ca020.0
bin/gpsd/8c7fccef.0
bin/gpsd/c9dbfc2e.0
bin/gpsd/ddc328ff.0
bin/gpsd/ed62f4e3.0
bin/gpsd/f0b6e66f.0
bin/gpsd/glgps_samsungJupiter
bin/gpsd/supl_att_root.cer
bin/gpsd/supl_spirent_root.cer
lib/libglslcompiler.so
lib/libgps.so
lib/libsecgps.so

lib/libs263domxoc.so
lib/libs263eomxoc.so
lib/libs264domxoc.so
lib/libs264eomxoc.so
lib/libsaacdomxoc.so
lib/libsac3domxoc.so
lib/libsamrdomxoc.so
lib/libsamreomxoc.so
lib/libsdiv3domxoc.so
lib/libsflacdomxoc.so
lib/libsmp3domxoc.so
lib/libsmp4vdomxoc.so
lib/libsmp4veomxoc.so
lib/libsvc1domxoc.so
lib/libswmadomxoc.so
lib/libswmv7domxoc.so
lib/libswmv8domxoc.so

bin/tvoutserver
lib/lib_tvoutengine.so
lib/libs3cjpeg.so
lib/libtvout.so
lib/libtvout_jni.so
lib/libtvoutfimc.so
lib/libtvouthdmi.so
lib/libtvoutservice.so

app/Superuser.apk
xbin/busybox
xbin/su

bin/immvibed

bin/vold
etc/vold.fstab

firmware/CE147F00.bin
firmware/CE147F01.bin
firmware/CE147F02.bin
firmware/CE147F03.bin

bin/killmediaserver
bin/notified_event
bin/playlogos1
bin/pvrsrvinit
lib/libPVRScopeServices.so
lib/libhardware.so
lib/libhardware_legacy.so
lib/libnetutils.so
lib/libpvr2d.so
lib/libsmp4fmocn.so
lib/libsrv_init.so
lib/libsrv_um.so
"

for FILE in $FILES; do
	adb pull system/$FILE ../../../vendor/samsung/$DEVICE/proprietary/$FILE
done

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g > ../../../vendor/samsung/$DEVICE/$DEVICE-vendor-blobs.mk
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file is generated by device/samsung/__DEVICE__/extract-files.sh

# Prebuilt libraries that are needed to build open-source libraries
PRODUCT_COPY_FILES := \\
    vendor/samsung/__DEVICE__/proprietary/lib/libgps.so:obj/lib/libgps.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsecgps.so:obj/lib/libsecgps.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsecril-client.so:obj/lib/libsecril-client.so

#
# Audio
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/etc/asound.conf:system/etc/asound.conf \\
    vendor/samsung/__DEVICE__/proprietary/lib/libspeech.so:system/lib/libspeech.so

#
# WiFi
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/bin/BCM4329B1_002.002.023.0417.0430.hcd:system/bin/BCM4329B1_002.002.023.0417.0430.hcd \\
    vendor/samsung/__DEVICE__/proprietary/bin/mfgloader:system/bin/mfgloader \\
    vendor/samsung/__DEVICE__/proprietary/bin/wlservice:system/bin/wlservice \\
    vendor/samsung/__DEVICE__/proprietary/bin/wpa_supplicant:system/bin/wpa_supplicant \\
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/bcm4329_aps.bin:system/etc/wifi/bcm4329_aps.bin \\
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/bcm4329_mfg.bin:system/etc/wifi/bcm4329_mfg.bin \\
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/bcm4329_sta.bin:system/etc/wifi/bcm4329_sta.bin \\
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/nvram_mfg.txt:system/etc/wifi/nvram_mfg.txt \\
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/nvram_net.txt:system/etc/wifi/nvram_net.txt \\
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/wifi.conf:system/etc/wifi/wifi.conf \\
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \\
    vendor/samsung/__DEVICE__/proprietary/lib/libwlservice.so:system/lib/libwlservice.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libwpa_client.so:system/lib/libwpa_client.so

#
# Bluetooth
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/bin/btld:system/bin/btld \\
    vendor/samsung/__DEVICE__/proprietary/bin/dbus-daemon:system/bin/dbus-daemon \\
    vendor/samsung/__DEVICE__/proprietary/bin/hciattach:system/bin/hciattach \\
    vendor/samsung/__DEVICE__/proprietary/bin/npsmobex:system/bin/npsmobex \\
    vendor/samsung/__DEVICE__/proprietary/etc/jupiter.xml:system/etc/jupiter.xml

#
# DHCPCD
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/bin/dhcpcd:system/bin/dhcpcd \\
    vendor/samsung/__DEVICE__/proprietary/etc/dhcpcd/dhcpcd-hooks/01-test:system/etc/dhcpcd/dhcpcd-hooks/01-test \\
    vendor/samsung/__DEVICE__/proprietary/etc/dhcpcd/dhcpcd-hooks/20-dns.conf:system/etc/dhcpcd/dhcpcd-hooks/20-dns.conf \\
    vendor/samsung/__DEVICE__/proprietary/etc/dhcpcd/dhcpcd-hooks/95-configured:system/etc/dhcpcd/dhcpcd-hooks/95-configured \\
    vendor/samsung/__DEVICE__/proprietary/etc/dhcpcd/dhcpcd-run-hooks:system/etc/dhcpcd/dhcpcd-run-hooks \\
    vendor/samsung/__DEVICE__/proprietary/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf

#
# Display (3D)
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/lib/egl/libEGL_POWERVR_SGX540_120.so:system/lib/egl/libEGL_POWERVR_SGX540_120.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/egl/libGLES_android.so:system/lib/egl/libGLES_android.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so:system/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/egl/libGLESv2_POWERVR_SGX540_120.so:system/lib/egl/libGLESv2_POWERVR_SGX540_120.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libIMGegl.so:system/lib/libIMGegl.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libpvrANDROID_WSEGL.so:system/lib/libpvrANDROID_WSEGL.so

#
# Sensors, Lights, etc
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/bin/sensorcalibutil_yamaha:system/bin/sensorcalibutil_yamaha \\
    vendor/samsung/__DEVICE__/proprietary/bin/sensorserver_yamaha:system/bin/sensorserver_yamaha \\
    vendor/samsung/__DEVICE__/proprietary/bin/sensorstatutil_yamaha:system/bin/sensorstatutil_yamaha \\
    vendor/samsung/__DEVICE__/proprietary/lib/hw/copybit.s5pc110.so:system/lib/hw/copybit.s5pc110.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/hw/gralloc.s5pc110.so:system/lib/hw/gralloc.s5pc110.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/hw/lights.s5pc110.so:system/lib/hw/lights.s5pc110.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/hw/sensors.default.so:system/lib/hw/sensors.default.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libms3c_yamaha.so:system/lib/libms3c_yamaha.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsensor_yamaha.so:system/lib/libsensor_yamaha.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsensor_yamaha_test.so:system/lib/libsensor_yamaha_test.so

#
# Camera
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/lib/libarccamera.so:system/lib/libarccamera.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libcamera.so:system/lib/libcamera.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libcamerafirmwarejni.so:system/lib/libcamerafirmwarejni.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libseccamera.so:system/lib/libseccamera.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libseccameraadaptor.so:system/lib/libseccameraadaptor.so

#
# RIL
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/bin/drexe:system/bin/drexe \\
    vendor/samsung/__DEVICE__/proprietary/bin/rilclient-test:system/bin/rilclient-test \\
    vendor/samsung/__DEVICE__/proprietary/bin/rild:system/bin/rild \\
    vendor/samsung/__DEVICE__/proprietary/lib/libreference-ril.so:system/lib/libreference-ril.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libril.so:system/lib/libril.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsec-ril.so:system/lib/libsec-ril.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsecril-client.so:system/lib/libsecril-client.so

#
# GPS
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/bin/gpsd/66ca3eb6.0:system/bin/gpsd/66ca3eb6.0 \\
    vendor/samsung/__DEVICE__/proprietary/bin/gpsd/7651b327.0:system/bin/gpsd/7651b327.0 \\
    vendor/samsung/__DEVICE__/proprietary/bin/gpsd/803ca020.0:system/bin/gpsd/803ca020.0 \\
    vendor/samsung/__DEVICE__/proprietary/bin/gpsd/8c7fccef.0:system/bin/gpsd/8c7fccef.0 \\
    vendor/samsung/__DEVICE__/proprietary/bin/gpsd/c9dbfc2e.0:system/bin/gpsd/c9dbfc2e.0 \\
    vendor/samsung/__DEVICE__/proprietary/bin/gpsd/ddc328ff.0:system/bin/gpsd/ddc328ff.0 \\
    vendor/samsung/__DEVICE__/proprietary/bin/gpsd/ed62f4e3.0:system/bin/gpsd/ed62f4e3.0 \\
    vendor/samsung/__DEVICE__/proprietary/bin/gpsd/f0b6e66f.0:system/bin/gpsd/f0b6e66f.0 \\
    vendor/samsung/__DEVICE__/proprietary/bin/gpsd/glgps_samsungJupiter:system/bin/gpsd/glgps_samsungJupiter \\
    vendor/samsung/__DEVICE__/proprietary/bin/gpsd/supl_att_root.cer:system/bin/gpsd/supl_att_root.cer \\
    vendor/samsung/__DEVICE__/proprietary/bin/gpsd/supl_spirent_root.cer:system/bin/gpsd/supl_spirent_root.cer \\
    vendor/samsung/__DEVICE__/proprietary/lib/libglslcompiler.so:system/lib/libglslcompiler.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libgps.so:system/lib/libgps.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsecgps.so:system/lib/libsecgps.so

#
# OMX
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/lib/libs263domxoc.so:system/lib/libs263domxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libs263eomxoc.so:system/lib/libs263eomxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libs264domxoc.so:system/lib/libs264domxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libs264eomxoc.so:system/lib/libs264eomxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsaacdomxoc.so:system/lib/libsaacdomxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsac3domxoc.so:system/lib/libsac3domxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsamrdomxoc.so:system/lib/libsamrdomxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsamreomxoc.so:system/lib/libsamreomxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsdiv3domxoc.so:system/lib/libsdiv3domxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsflacdomxoc.so:system/lib/libsflacdomxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsmp3domxoc.so:system/lib/libsmp3domxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsmp4vdomxoc.so:system/lib/libsmp4vdomxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsmp4veomxoc.so:system/lib/libsmp4veomxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsvc1domxoc.so:system/lib/libsvc1domxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libswmadomxoc.so:system/lib/libswmadomxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libswmv7domxoc.so:system/lib/libswmv7domxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libswmv8domxoc.so:system/lib/libswmv8domxoc.so

#
# TV-Out
#
PRODUCT_COPY_FILES += \\
	vendor/samsung/__DEVICE__/proprietary/lib/lib_tvoutengine.so:system/lib/lib_tvoutengine.so \\
    vendor/samsung/__DEVICE__/proprietary/bin/tvoutserver:system/bin/tvoutserver \\
    vendor/samsung/__DEVICE__/proprietary/lib/libs3cjpeg.so:system/lib/libs3cjpeg.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libtvout.so:system/lib/libtvout.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libtvout_jni.so:system/lib/libtvout_jni.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libtvoutfimc.so:system/lib/libtvoutfimc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libtvouthdmi.so:system/lib/libtvouthdmi.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libtvoutservice.so:system/lib/libtvoutservice.so

#
# Test/Utilities
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/app/Superuser.apk:system/app/Superuser.apk \\
    vendor/samsung/__DEVICE__/proprietary/xbin/busybox:system/xbin/busybox \\
    vendor/samsung/__DEVICE__/proprietary/xbin/su:system/xbin/su

#
# Haptic Feedback
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/bin/immvibed:system/bin/immvibed \\

#
# Storage
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/bin/vold:system/bin/vold \\
    vendor/samsung/__DEVICE__/proprietary/etc/vold.fstab:system/etc/vold.fstab

#
# Some other firmware. I am not certain if we need it.
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/firmware/CE147F00.bin:system/firmware/CE147F00.bin \\
    vendor/samsung/__DEVICE__/proprietary/firmware/CE147F01.bin:system/firmware/CE147F01.bin \\
    vendor/samsung/__DEVICE__/proprietary/firmware/CE147F02.bin:system/firmware/CE147F02.bin \\
    vendor/samsung/__DEVICE__/proprietary/firmware/CE147F03.bin:system/firmware/CE147F03.bin

#
# Dependent Files. These are files which Samsung has likely modified and cannot easily be replaced with
# versions built from source. I will try to get rid of them one at a time.
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/bin/killmediaserver:system/bin/killmediaserver \\
    vendor/samsung/__DEVICE__/proprietary/bin/notified_event:system/bin/notified_event \\
    vendor/samsung/__DEVICE__/proprietary/bin/playlogos1:system/bin/playlogos1 \\
    vendor/samsung/__DEVICE__/proprietary/bin/pvrsrvinit:system/bin/pvrsrvinit \\
    vendor/samsung/__DEVICE__/proprietary/lib/libhardware_legacy.so:system/lib/libhardware_legacy.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libhardware.so:system/lib/libhardware.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libnetutils.so:system/lib/libnetutils.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libpvr2d.so:system/lib/libpvr2d.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libPVRScopeServices.so:system/lib/libPVRScopeServices.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsmp4fmocn.so:system/lib/libsmp4fmocn.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsrv_init.so:system/lib/libsrv_init.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsrv_um.so:system/lib/libsrv_um.so
EOF

./setup-makefiles.sh