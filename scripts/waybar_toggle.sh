#!/bin/bash

if pgrep -x "waybar" > /dev/null
then 
	killall -SIGUSR1 "waybar"
else
	waybar
fi

