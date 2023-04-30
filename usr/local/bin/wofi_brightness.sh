#!/bin/bash

# Define variables

#Specify entries
entries="Close Menu\nOpen Menu for Warm Only\nOpen Menu for Cool Only\nMax\nSet to 50%\nSet to 25%\nBacklight Off\n+10%\n-10%"


# Run the menu...

selected=$(echo -e $entries|wofi --dmenu --width 280 --lines 10 --location 0)

case $selected in
	"Close Menu")
		wtype -P esc -p esc;;
	"Open Menu for Warm Only")
		exec "/usr/local/bin/wofi_brightness_warm.sh";;
	"Open Menu for Cool Only")
		exec "/usr/local/bin/wofi_brightness_cool.sh";;
	"Max")
		brightnessctl -d backlight_cool s 100%
		brightnessctl -d backlight_warm s 100%;;
	"Set to 50%")
		brightnessctl -d backlight_cool s 50%
		brightnessctl -d backlight_warm s 50%;;
	"Set to 25%")
		brightnessctl -d backlight_cool s 25%
		brightnessctl -d backlight_warm s 25%;;
	"Backlight Off")
		brightnessctl -d backlight_cool s 0 ; 
		brightnessctl -d backlight_warm s 0;;
	"+10%")
		brightnessctl -d backlight_cool s +10%
		brightnessctl -d backlight_warm s +10%;;
	"-10%")
		brightnessctl -d backlight_cool s 10%-
		brightnessctl -d backlight_warm s 10%-;;
esac
