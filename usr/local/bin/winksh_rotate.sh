#!/bin/bash

LOG=/run/user/$(id -u $USER)/sensor.log



function swayrot {
        swaymsg output DPI-1 transform $DEGREES scale 2 ; swaymsg input * map_to_output DPI-1
}

killall monitor-sensor

> $LOG

monitor-sensor --accel >> $LOG 2>&1 &

while inotifywait -e modify $LOG; do

        ORIENTATION=$(tail -n 1 $LOG | grep 'orientation' | grep -oE '[^ ]+$')

        if [ ! -z $ORIENTATION ] ; then
                case "$ORIENTATION" in
			normal)
			DEGREES=0
			swayrot
			killall -9 lisgd ; killall -9 lisgd-run.sh ; swaymsg 'exec "/usr/local/bin/lisgd-run.sh"' ; /usr/local/bin/sov_reset.sh &
			;;
			bottom-up)
			DEGREES=180
			swayrot
			killall -9 lisgd ; killall -9 lisgd-run.sh ; swaymsg 'exec "/usr/local/bin/lisgd-run.sh"' ; /usr/local/bin/sov_reset.sh &
			;;
			right-up)
			DEGREES=90
			swayrot
			killall -9 lisgd ; killall -9 lisgd-run.sh ; swaymsg 'exec "/usr/local/bin/lisgd-run.sh"' ; /usr/local/bin/sov_reset.sh &
			;;
			left-up)
			DEGREES=270
			swayrot
			killall -9 lisgd ; killall -9 lisgd-run.sh ; swaymsg 'exec "/usr/local/bin/lisgd-run.sh"' ; /usr/local/bin/sov_reset.sh &
			;;
		esac
        fi

done
