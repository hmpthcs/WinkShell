#!/bin/bash

if [ $# -eq 0 ]
then
    echo ""
else
    if pgrep -x "waybar" > /dev/null
    then
	    killall -SIGUSR1 "waybar"
    else
    	    waybar -c ~/.config/waybar/waybar_hw_center_input.config
    fi
fi

#    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
#	DISTRIB=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
#	if [[ ${DISTRIB} = *"Void"* ]]; then
# 	    sudo /sbin/zzz
# 	else
# 	    swaymsg exec systemctl suspend
# 	fi
#     fi
# fi


