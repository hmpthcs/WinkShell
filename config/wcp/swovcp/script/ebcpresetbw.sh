#!/bin/bash

if [ $# -eq 0 ]
then
    echo ""
else
    echo 1 > /sys/module/rockchip_ebc/parameters/default_waveform
    echo 4 > /sys/module/rockchip_ebc/parameters/refresh_waveform
    echo 2 > /sys/module/rockchip_ebc/parameters/bw_mode
    echo 11 > /sys/module/rockchip_ebc/parameters/bw_threshold
    echo 30 > /sys/module/rockchip_ebc/parameters/refresh_threshold
fi

exit

#    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
#	DISTRIB=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
#	if [[ ${DISTRIB} = *"Void"* ]]; then
# 	    sudo /sbin/zzz
# 	else
# 	    swaymsg exec systemctl suspend
# 	fi
#     fi
# fi


