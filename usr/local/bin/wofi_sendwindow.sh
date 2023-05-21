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
    | "\($ws.name)"' \
    | wofi -dmenu -markup -i)

if [ ! -z "$row" ]
then
    echo "row = $row"
    SELECTEDWS=$(echo "$row")
    echo "selectedws = $SELECTEDWS"
    swaymsg "move window to workspace $SELECTEDWS"
fi
