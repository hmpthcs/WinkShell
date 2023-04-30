#!/bin/bash

# This bit modifies the lavalauncher config so that the bar reflects the current drag state as DISABLED
# more importantly, it sets the button state to be ready to receive a "toggle ON"
# removed this line as could not get it to work.. "file not found or sth" configfile="~/.config/lavalauncher/lavawindow.conf"
# icon_search_string="hand-grabbing-thin"
# icon_replace_string="hand-thin"
# script_search_string="sway_drag_disable"
# script_replace_string="sway_drag_enable

### = was working in lavalauncher
### sed -i 's/selection-plus-thin/crop-thin/' ~/.config/lavalauncher/lavawindow.conf
### sed -i 's/sway_resize_disable/sway_resize_enable/' ~/.config/lavalauncher/lavawindow.conf &&

## swaymsg floating_modifier Alt normal
 
## PID=`pgrep sway_resize_enable.sh`
## killall wtype ; killall /bin/bash /usr/local/bin/sway_resize_enable.sh ; killall /bin/bash /usr/local/bin/sway_drag_enable.sh ; killall wtype

# below is all the crap from the drag enable script, from which I copied this one to have a template
# another version below. not sure
# TARGET_KEY=
# REPLACEMENT_VALUE=
# CONFIG_FILE="~/.config/lavalauncher/lavawindow.conf"
# sed -c -i "s/\($TARGET_KEY *= *\).*/\1$REPLACEMENT_VALUE/" $CONFIG_FILE


# This loop fools silly sway into believing it's receiving a held-down key press. Thank you wtype. And screw you search engines.. trial+error has taken more of my life than I can stomach
# x=1
# while [[ x -eq 1 ]]; do wtype -M alt -s 1000 -m alt; done

# 1000 ms seems to be the cutoff for sway to interpret the sequential presses as a "hold"
# Haven't tried anything less than 600 ms as I think longer = less strain/stress 

swaymsg border pixel 2

