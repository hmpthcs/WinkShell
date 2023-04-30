#!/bin/bash


# TODO: use sway IPC to get workspace count; if count <= 5, use 1x5 menu; ifcount > 5, use 2x5 menu


chosen=$(printf '%s;%s;%s;%s;%s\n' "1" "2" "3" "4" "5"\
	| wofi -dmenu \
		-sep ';' \
		-selected-row 2)

case "$chosen" in
	"1")
	swaymsg switch workspace 2;;
	"2")
	"3")
	"4")
	"5")
