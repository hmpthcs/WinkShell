#!/bin/bash

if pgrep -x "waybar" > /dev/null
then 
	killall -SIGUSR1 "waybar"
else
	waybar -c ~/.config/waybar/waybar_hw_center_input.config
fi

# if pgrep -x "wlclock" > /dev/null
# then
#	killall "wlclock"
# else
#	exec /usr/local/bin/wlclock_topright-run.sh
# fi
