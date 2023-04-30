#!/bin/bash

# Define variables

#Specify entries

entries="Close Menu\nBT autocon script\nPower Off BT\nPower On BT\nOpen Wifi Menu"

# Run the menu...

selected=$(echo -e $entries|wofi --dmenu --width 220 --lines 6)

case $selected in
	"Close Menu")
		wtype -P esc -p esc;;
	"BT autocon script")
		exec /usr/local/bin/winkshell_bluetooth_autoconnect.sh;;
	"Power Off BT")
		bluetoothctl power off;;
	"Power On BT")
		bluetoothctl power on;;
	"Open Wifi Menu")
		exec ~/.config/wofi/wofi-wifi.sh;;
esac
