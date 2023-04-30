#!/bin/bash

# Define variables


#Specify entries
entries="Close Menu\nSave as File\nCopy to Clipboard\nPaste\nOpen in Rnote\nOpen in xournal++"


# Run the menu...

selected=$(echo -e $entries|wofi --dmenu --width 220 --lines 8)

case $selected in
	"Close Menu")
		wtype -P esc -p esc;;
	"Save as File")
		grim -g "$(slurp)" | wl-copy;;
	"Copy to Clipboard")
		/usr/local/bin/winksh_screenshot_to_clipboard.sh;;
	"Paste")
		wl-paste;;
	"Open in Rnote")
		/usr/local/bin/winksh_slurptornote.sh;;
	"Open in xournal++")
		/usr/local/bin/winksh_slurptoxournal.sh;;
esac
