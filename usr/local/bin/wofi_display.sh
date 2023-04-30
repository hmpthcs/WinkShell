#!/bin/bash

# Define variables

ROTATIONSTATE=`cat /tmp/rotationstate`
ROTATIONCLOCK=$(echo $(( $ROTATIONSTATE + 1 )))
ROTATIONCOUNTER=$(echo $(( $ROTATIONSTATE - 1 )))

# Entries for the menu

# Probably not using this (yet?) LIST=$(ls /sys/class/module/rockchip_ebc/parameters/*)

CURRENTAUTOREFRESH=`cat /sys/module/rockchip_ebc/parameters/auto_refresh`
CURRENTBWTHRESHOLD=`cat /sys/module/rockchip_ebc/parameters/bw_threshold`
CURRENTDEFAULTWAVEFORM=`cat /sys/module/rockchip_ebc/parameters/default_waveform`
CURRENTREFRESHTHRESHOLD=`cat /sys/module/rockchip_ebc/parameters/refresh_threshold`
CURRENTREFRESHWAVEFORM=`cat /sys/module/rockchip_ebc/parameters/refresh_waveform`
CURRENTSPLITAREALIMIT=`cat /sys/module/rockchip_ebc/parameters/split_area_limit`
CURRENTBW=`cat /sys/module/rockchip_ebc/parameters/bw_mode`


if [[ CURRENTDEFAULTWAVEFORM -eq 1 ]]; then
        NEWDEFAULTWAVEFORM=4
else
        NEWDEFAULTWAVEFORM=1
fi

if [[ CURRENTBW -eq 0 ]]; then
        NEWBW=1
else
        NEWBW=0
fi

TOGGLEBWA2="Toggle A2 (currently $CURRENTDEFAULTWAVEFORM) + BW Mode (currently $CURRENTBW)"


# Specify entries
entries="Close Menu\nRotation\nBrightness\nRockchip EBC\n$TOGGLEBWA2\nRotate Clockwise 90\nRotate Counterclockwise 90"


# Run the menu...

selected=$(echo -e $entries|wofi --dmenu --lines 8)

case $selected in
	"Close Menu")
		wtype -P esc -p esc;;
	"Rotation")
		exec "/usr/local/bin/wofi_rotation.sh";;
	"Rotate Clockwise 90")
		swaymsg output DPI-1 transform 90 clockwise scale 2;
		swaymsg input * map_to_output DPI-1 && 
		swaymsg 'exec "echo $ROTATIONCLOCK > /tmp/rotationstate"';
		killall lisgd;
		swaymsg 'exec "/usr/local/bin/lisgd-run.sh"';;
	"Rotate Counterclockwise 90")
		swaymsg output DPI-1 transform 90 anticlockwise scale 2;
		swaymsg input * map_to_output DPI-1 && 
		swaymsg 'exec "echo $ROTATIONCOUNTER > /tmp/rotationstate"';
		killall lisgd;
		swaymsg 'exec "/usr/local/bin/lisgd-run.sh"';;
	"Brightness")
		exec "/usr/local/bin/wofi_brightness.sh";;
	"Rockchip EBC")
		exec "/usr/local/bin/wofi_rockchip_ebc.sh";;
	$TOGGLEBWA2)
		echo $NEWBW > /sys/module/rockchip_ebc/parameters/bw_mode
		echo $NEWDEFAULTWAVEFORM > /sys/module/rockchip_ebc/parameters/default_waveform;;
esac
