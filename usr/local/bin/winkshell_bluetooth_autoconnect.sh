#!/bin/bash

# below is done by the show kbd script:
# PID=`pgrep wvkbd-mobintl`
# kill -SIGUSR2 $PID

alacritty & sleep 2s ; swaymsg floating enable, resize set width 600px, resize set height 150px ; sleep 1s ; wtype "bluetooth-autoconnect" -k return ; exec /usr/local/bin/kbd_show.sh 
