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

TARGETPARAMETER="bw_threshold"

# Specify entries
entries="Close Menu\nBack\n1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15"


# Run the menu...

selected=$(echo -e $entries|wofi --dmenu --width 60 --lines 17)

case $selected in
	"Close Menu")
                wtype -P esc -p esc;;
	"Back")
		exec "/usr/local/bin/wofi_rockchip_ebc.sh";;
	"1")
		echo 1 > /sys/module/rockchip_ebc/parameters/$TARGETPARAMETER;;
	"2")
		echo 2 > /sys/module/rockchip_ebc/parameters/$TARGETPARAMETER;;
	"3")
		echo 3 > /sys/module/rockchip_ebc/parameters/$TARGETPARAMETER;;
	"4")
		echo 4 > /sys/module/rockchip_ebc/parameters/$TARGETPARAMETER;;
	"5")
		echo 5 > /sys/module/rockchip_ebc/parameters/$TARGETPARAMETER;;
	"6")
		echo 6 > /sys/module/rockchip_ebc/parameters/$TARGETPARAMETER;;
	"7")
		echo 7 > /sys/module/rockchip_ebc/parameters/$TARGETPARAMETER;;
	"8")
                echo 8 > /sys/module/rockchip_ebc/parameters/$TARGETPARAMETER;;
	"9")
                echo 9 > /sys/module/rockchip_ebc/parameters/$TARGETPARAMETER;;
	"10")
                echo 10 > /sys/module/rockchip_ebc/parameters/$TARGETPARAMETER;;
	"11")
                echo 11 > /sys/module/rockchip_ebc/parameters/$TARGETPARAMETER;;
	"12")
                echo 12 > /sys/module/rockchip_ebc/parameters/$TARGETPARAMETER;;
	"13")
                echo 13 > /sys/module/rockchip_ebc/parameters/$TARGETPARAMETER;;
	"14")
                echo 14 > /sys/module/rockchip_ebc/parameters/$TARGETPARAMETER;;
	"15")
                echo 15 > /sys/module/rockchip_ebc/parameters/$TARGETPARAMETER;;
esac
