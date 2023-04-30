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

# Specify entries
entries="1\n 2\n 3\n 4\n 5\n 6\n 7\n 8\n 9\n 10\n 11\n 12\n 13\n 14\n 15\n"


# Run the menu...

selected=$(echo -e $entries|wofi --dmenu | awk '{print tolower($2)}')

case $selected in
	$selected)
		echo $selected > /sys/module/rockchip_ebc/parameters/bw_threshold;;
#	2)
#		exec /usr/local/bin/wofi_set_bw_threshold.sh;;
#	3)
#		exec /usr/local/bin/wofi_set_default_waveform.sh;;
#	4)
#		exec /usr/local/bin/wofi_set_refresh_waveform.sh;;
#	5)
##		exec /usr/local/bin/wofi_set_refresh_threshold.sh;;
#	6)
#		exec /usr/local/bin/wofi_set_split_area_limit.sh;;
#	7)
#	8)
#	9)
#	10)
#	11)
#	12)
#	13)
#	14)
#	15)
esac
