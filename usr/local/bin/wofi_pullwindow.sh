#!/usr/bin/env bash
# Based on https://gist.github.com/lbonn/89d064cde963cfbacabd77e0d3801398
#
# In order to have meaningful window names for terminals, use

# inside .vimrc:
# set title

# inside .bashrc:
# export PROMPT_COMMAND='echo -en "\033]0; $("pwd")  \a"'

row=$(swaymsg -t get_tree | jq  -r '
    ..
    | objects
    | select(.type == "workspace") as $ws
    | ..
    | objects
    | select(has("app_id"))
    | (if .focused == true then "*" else " " end) as $asterisk
    | "[\($ws.name)] \($asterisk) <span weight=\"bold\">\(.app_id)</span>  - \(.name) <!-- \(.id) -->\u0000icon\u001f\(.app_id)"' \
| sed 's/&/&amp;/g' \
| wofi -dmenu -markup -i)

if [ ! -z "$row" ]
then
    echo "row = $row"
    winid=$(echo "$row" | sed 's/.*<!-- \([0-9]*\) -->.*/\1/')
    echo "winid = $winid"
    swaymsg "[con_id=$winid] move window to workspace current"
fi
