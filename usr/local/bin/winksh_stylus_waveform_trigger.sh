#!/bin/bash

LOG=/run/user/$(id -u $USER)/stylusprox.log



function setfast {
        echo 1 > /sys/module/rockchip_ebc/parameters/bw_mode
        echo 1 > /sys/module/rockchip_ebc/parameters/default_waveform
        echo 30 > /sys/module/rockchip_ebc/parameters/refresh_threshold
}

function setslow {
	echo 0 > /sys/module/rockchip_ebc/parameters/bw_mode
	echo 4 > /sys/module/rockchip_ebc/parameters/default_waveform
	echo 12 > /sys/module/rockchip_ebc/parameters/refresh_threshold
}

killall libinput-record /dev/input/event4

> $LOG

libinput record /dev/input/event4 | grep 'BTN_TOOL_PEN' >> $LOG 2>&1 &

while inotifywait -e modify $LOG; do

        PROXIMITY=$(tail -n 1 $LOG | grep 'EV_KEY' | grep -oE '[^ ]+$')

        if [ ! -z $PROXIMITY ] ; then
                case "$PROXIMITY" in
			0)
			setfast
			;;
			1)
			setslow
			;;
		esac
        fi

done
