#!/bin/bash

#get processID
PID=`pgrep wvkbd-mobintl`

kill -SIGRTMIN $PID


## old templates below

## pidof squeekboard || squeekboard &
## busctl call --user sm.puri.OSK0 /sm/puri/OSK0 sm.puri.OSK0 SetVisible b true

# if pgrep -x "waybar" > /dev/null
# then 
#	killall -SIGUSR1 "waybar"
# else
#	waybar
#fi

