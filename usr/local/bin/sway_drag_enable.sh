#!/bin/bash

# This bit modifies the lavalauncher config so that the bar reflects the current drag state as enabled
#more importantly, it sets the button state to be ready to receive a "toggle off"
# removed this line as could not get it to work.. "file not found or sth" configfile="~/.config/lavalauncher/lavawindow.conf"
#icon_search_string="hand-thin"
#icon_replace_string="hand-grabbing-thin"
#script_search_string="sway_drag_enable"
#script_replace_string="sway_drag_disable"

### = was working in lavalauncher
### sed -i 's/hand-thin/hand-grabbing-thin/' ~/.config/lavalauncher/lavawindow.conf
### sed -i 's/sway_drag_enable/sway_drag_disable/' ~/.config/lavalauncher/lavawindow.conf

swaymsg floating_modifier Alt normal

# another version below. not sure
# TARGET_KEY=
# REPLACEMENT_VALUE=
# CONFIG_FILE="~/.config/lavalauncher/lavawindow.conf"
# sed -c -i "s/\($TARGET_KEY *= *\).*/\1$REPLACEMENT_VALUE/" $CONFIG_FILE


# This loop fools silly sway into believing it's receiving a held-down key press. Thank you wtype. And screw you search engines.. trial+error has taken more of my life than I can stomach
x=1
while [[ x -eq 1 ]]; do wtype -M alt -s 1000 -m alt; done

# 1000 ms seems to be the cutoff for sway to interpret the sequential presses as a "hold"
# Haven't tried anything less than 600 ms as I think longer = less strain/stress 

