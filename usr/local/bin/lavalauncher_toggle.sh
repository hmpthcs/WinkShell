#!/bin/bash

if 
	pgrep -x "lavalauncher" > /dev/null
 
then
	killall -SIGUSR1 "lavalauncher"

else
	swaymsg 'exec "lavalauncher -c ~/.config/lavalauncher/lavamain.conf"'
fi
