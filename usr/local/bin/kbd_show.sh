#!/bin/bash

#get processID
PID=`pgrep wvkbd-mobintl`

kill -SIGUSR2 $PID

#SIGRTMIN is supposed to toggle the board. isnt working for some reason.

## old templates below

## pidof squeekboard || squeekboard &
## busctl call --user sm.puri.OSK0 /sm/puri/OSK0 sm.puri.OSK0 SetVisible b true

# if pgrep -x "waybar" > /dev/null
# then 
#	killall -SIGUSR1 "waybar"
# else
#	waybar
#fi

