#!/bin/bash


# Define variables
# Entries for the menu

entries="Close menu\nE-ink mode on\nE-ink mode off\nReadability script\nScreenshot menu"

# Run the menu...

selected=$(echo -e $entries|wofi --dmenu --width 210 --lines 7 --yoffset 8)

case $selected in
	"Close menu")
		wtype -k Esc;;
	"E-ink mode on")
		qutebrowser ':set content.user_stylesheets ~/.config/qutebrowser/css/e-ink.css';;
	"E-ink mode off")
		qutebrowser ':set content.user_stylesheets ""';;
	"Readability script")
		qutebrowser ':spawn --userscript ~/.config/qutebrowser/userscripts/readability-js';;
	"Screenshot menu")
		exec /usr/local/bin/wofi_screenshot.sh ;;
	

	esac

exit
