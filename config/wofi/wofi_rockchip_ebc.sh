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

# Specify BW mode entry based on current state
if [[ "$CURRENTBW" -eq 1 ]]; then
	NEWBW=0
	BWTOGGLE="Toggle BW mode off"
else
	NEWBW=1
	BWTOGGLE="Toggle BW mode on"
fi
echo "NEWBW variable = $NEWBW"


CURRENTAUTOREFRESH=`cat /sys/module/rockchip_ebc/parameters/auto_refresh`
if [[ "$CURRENTAUTOREFRESH" -eq 1 ]]; then
        NEWAUTOREFRESH=0
        AUTOREFRESHTOGGLE="Toggle auto-refresh off"
else
        NEWAUTOREFRESH=1
        AUTOREFRESHTOGGLE="Toggle auto-refresh on"
fi

echo "NEWAUTOREFRESH variable = $NEWAUTOREFRESH"

entries="$BWTOGGLE\n Set BW threshold\n Set Default Waveform\n $AUTOREFRESHTOGGLE\n Set Refresh Waveform\n Set Refresh Threshold\n Set Split Area Limit"

echo "ENTRIES = $entries"

# Run the menu...

selected=$(echo -e $entries|wofi --dmenu)

case $selected in
	$BWTOGGLE)
		echo $NEWBW > /sys/module/rockchip_ebc/parameters/bw_mode
		echo "echoed NEWBW varaible to rockchip_ebc/bw_mode";;
	"Set BW Threshold")
		exec /usr/local/bin/wofi_set_bw_threshold.sh;;
	"Set Default Waveform")
		exec "/usr/local/bin/wofi_set_default_waveform.sh";;
	$AUTOREFRESHTOGGLE)
                echo $NEWAUTOREFRESH > /sys/module/rockchip_ebc/parameters/auto_refresh;;
	"Set Refresh Waveform")
		exec /usr/local/bin/wofi_set_refresh_waveform.sh;;
	"Set Refresh Threshold")
		exec /usr/local/bin/wofi_set_refresh_threshold.sh;;
	"Set Split Area Limit")
		exec /usr/local/bin/wofi_set_split_area_limit.sh;;
esac
