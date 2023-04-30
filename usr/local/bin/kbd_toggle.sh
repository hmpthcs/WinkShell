#!/bin/bash

#get processID
PID=`pgrep wvkbd-mobintl`

if pgrep -x "wvkbd-mobintl" > /dev/null
then
   kill -SIGRTMIN $PID
else
   swaymsg 'exec "wvkbd-mobintl"'
fi



## old templates below

## pidof squeekboard || squeekboard &
## busctl call --user sm.puri.OSK0 /sm/puri/OSK0 sm.puri.OSK0 SetVisible b true

# if pgrep -x "waybar" > /dev/null
# then 
#	killall -SIGUSR1 "waybar"
# else
#	waybar
#fi

