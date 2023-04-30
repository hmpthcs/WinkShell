#!/bin/bash


# Define variables
# Entries for the menu

entries="1: Close menu\n4: List tabs\n7: Insert mode\n6: Passthrough mode\n8: Normal mode\n5: Open in current tab\n2: Bookmarks\n3: Appearance"

# Run the menu...


selected=$(echo -e $entries|wofi --dmenu --sort-order alphabetical --lines 10 --width 255 --yoffset 8 --xoffset 0) 

case $selected in
	"1: Close menu")
		wtype -k esc;;
	"4: List tabs")
		sleep 1s ; wtype ":open qute://tabs/ --tab" -k return;;
	"7: Insert mode")
		wtype -M shift -k escape -m shift -k i;;
	"6: Passthrough mode")
		wtype -M ctrl "V";;
	"8: Normal mode")
		wtype -k escape -M shift -k escape;;
	"5: Open in current tab")
		wtype -M shift -k escape ; wtype ":open ";;
	"3: Appearance")
		exec /usr/local/bin/wofi_qutebrowser_reader.sh;;
	"2: Bookmarks")
		exec /usr/local/bin/wofi_qutebrowser_bookmarks.sh;;
esac

exit
