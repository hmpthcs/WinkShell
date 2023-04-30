#!/bin/bash


# Define variables
# Entries for the menu

entries="Close menu\nSwitch to WS __\nMove focused to __\nPull __ into current WS\nKill focused\nToggle fullscreen\nToggle float\nPin focused\nEnter resize mode\nEnter default mode"

# Run the menu...

selected=$(echo -e $entries|wofi --dmenu --width 380 --lines 10 --yoffset 8)

case $selected in
	"Close menu")
		wtype -P esc -p esc;;
	"Switch to WS __")
		swayr switch-workspace;;
	"Move focused to __")
		swayr move-focused-to-workspace;;
	"Pull __ into current WS")
		swayr steal-window;;
	"Kill focused")
		swaymsg kill;;
	"Toggle fullscreen")
		swaymsg fullscreen toggle;;
	"Toggle float")
		swaymsg floating toggle;;
	"Pin focused")
		swaymsg sticky toggle;;
	"Enter resize mode")
		exec /usr/local/bin/sway_resize_enable.sh &;;
	"Enter default mode")
		exec /usr/local/bin/sway_resize_disable.sh &;;

esac

exit
