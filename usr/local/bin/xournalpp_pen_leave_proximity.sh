#!/bin/sh

# sleep 5s

echo auto > /sys/devices/platform/fdec0000.ebc/power/control

# if [ -e /sys/module/rockchip_ebc/parameters/lut_type ]; then
#  echo 7 > /sys/module/rockchip_ebc/parameters/lut_type
# elif [ -e /sys/module/rockchip_ebc/parameters/default_waveform ]; then

echo 7 > /sys/module/rockchip_ebc/parameters/default_waveform
echo 0 > /sys/module/rockchip_ebc/parameters/bw_mode

# fi
