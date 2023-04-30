#!/bin/bash


# Define variables
# Entries for the menu

entries="Close menu\nAdd bookmark\nAdd quickmark\nOpen bookmarks (current tab)\nOpen bookmarks (new tab)"

# Run the menu...

selected=$(echo -e $entries|wofi --dmenu --lines 7 --yoffset 8 --width 350)

case $selected in
	"Close menu")
		wtype -k Esc;;
	"Add quickmark")
		wtype -k m;;
	"Add bookmark")
		wtype ":bookmark-add" -k return;;
	"Open bookmarks (current tab)")
		wtype ":bookmark-list" -k return;;
        "Open bookmarks (new tab)")
                wtype ":open --tab qute://bookmarks/" -k return;;
esac

exit
