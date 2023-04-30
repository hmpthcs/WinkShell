#!/bin/bash
# Auto rotate screen based on device orientation
# based on https://linuxappfinder.com/blog/auto_screen_rotation_in_ubuntu

# install
# 1. apt-get install iio-sensor-proxy inotify-tools
# 2. add script to autostart

# Receives input from monitor-sensor (part of iio-sensor-proxy package)
# Screen orientation and launcher location is set based upon accelerometer position
# Launcher will be on the left in a landscape orientation and on the bottom in a portrait orientation
# This script should be added to startup applications for the user

LOG=/run/user/$(id -u $USER)/sensor.log
export DISPLAY=:0

# put your display name here
DNAME=DSI-1

# may change grep to match your touchscreen
INDEV=$(xinput --list | grep TouchScreen | sed 's/.*id=\([0-9]*\).*/\1/')


function rotate {
	#echo ---- rotete ----
	ORIENTATION=$1
	CUR_ROT=$(xrandr -q --verbose | grep $DNAME | cut -d" " -f6)

	NEW_ROT="normal"
	CTM="1 0 0 0 1 0 0 0 1"

	# Set the actions to be taken for each possible orientation
	case "$ORIENTATION" in
	normal)
		NEW_ROT="normal"
		CTM="1 0 0 0 1 0 0 0 1"
		gsettings set com.canonical.Unity.Launcher launcher-position Top
		;;
	bottom-up)
		NEW_ROT="inverted"
		CTM="-1 0 1 0 -1 1 0 0 1"
		gsettings set com.canonical.Unity.Launcher launcher-position Top
		;;
	right-up)
		NEW_ROT="left"
		CTM="0 -1 1 1 0 0 0 0 1"
		gsettings set com.canonical.Unity.Launcher launcher-position Left
		;;
	left-up)
		NEW_ROT="right"
		CTM="0 1 0 -1 0 1 0 0 1"
		gsettings set com.canonical.Unity.Launcher launcher-position Left
		;;
	esac


	#echo ORIENTATION: $ORIENTATION
	#echo INDEV:   $INDEV
	#echo DNAME:   $DNAME
	#echo DISPLAY: $DISPLAY
	##echo NEW_ROT: $NEW_ROT
	#echo CUR_ROT: $CUR_ROT
	#echo CTM:     $CTM
	#if [ "$NEW_ROT" != "$CUR_ROT" ] ; then
		xrandr --output $DNAME --rotate $NEW_ROT
		xinput set-prop $INDEV 'Coordinate Transformation Matrix' $CTM
	#	fi

}

# set default orientation
rotate left-up

# kill old monitor-sensor
killall monitor-sensor

# Clear sensor.log so it doesn't get too long over time
> $LOG

# Launch monitor-sensor and store the output in a variable that can be parsed by the rest of the script
monitor-sensor >> $LOG 2>&1 &

# Parse output or monitor sensor to get the new orientation whenever the log file is updated
# Possibles are: normal, bottom-up, right-up, left-up
# Light data will be ignored
while inotifywait -e modify $LOG; do
	# Read the last line that was added to the file and get the orientation
	ORIENTATION=$(tail -n 1 $LOG | grep 'orientation' | grep -oE '[^ ]+$')

	if [ ! -z $ORIENTATION ] ; then
		rotate $ORIENTATION
	fi

done
