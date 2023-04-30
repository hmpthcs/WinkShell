#!/bin/bash

# Define variables

# Entries for the menu

# Probably not using this (yet?) LIST=$(ls /sys/class/module/rockchip_ebc/parameters/*)

CURRENTAUTOREFRESH=`cat /sys/module/rockchip_ebc/parameters/auto_refresh`
CURRENTBWTHRESHOLD=`cat /sys/module/rockchip_ebc/parameters/bw_threshold`
CURRENTDEFAULTWAVEFORM=`cat /sys/module/rockchip_ebc/parameters/default_waveform`
CURRENTREFRESHTHRESHOLD=`cat /sys/module/rockchip_ebc/parameters/refresh_threshold`
CURRENTREFRESHWAVEFORM=`cat /sys/module/rockchip_ebc/parameters/refresh_waveform`
CURRENTSPLITAREALIMIT=`cat /sys/module/rockchip_ebc/parameters/split_area_limit`
CURRENTBW=`cat /sys/module/rockchip_ebc/parameters/bw_mode`

TARGETPARAMETER=$refresh_waveform

# Specify entries
entries="1: a2 (fast)\n2: DU\n3: ?unknown\n4: GC16 (slow)\n5: GLD16/GCC16\n6: GL16\n7: GLR16"


# Run the menu...

selected=$(echo -e $entries|wofi --dmenu)

case $selected in
	"1: a2 (fast)")
		echo 1 > /sys/module/rockchip_ebc/parameters/$TARGETPARAMETER;;
	"2: DU")
		echo 2 > /sys/module/rockchip_ebc/parameters/$TARGETPARAMETER;;
	"3: ?unknown")
		echo 3 > /sys/module/rockchip_ebc/parameters/$TARGETPARAMETER;;
	"4: GC16 (slow)")
		echo 4 > /sys/module/rockchip_ebc/parameters/$TARGETPARAMETER;;
	"5: GLD16/GCC16")
		echo 5 > /sys/module/rockchip_ebc/parameters/$TARGETPARAMETER;;
	"6: GL16")
		echo 6 > /sys/module/rockchip_ebc/parameters/$TARGETPARAMETER;;
	"7: GLR16")
		echo 7 > /sys/module/rockchip_ebc/parameters/$TARGETPARAMETER;;
esac
