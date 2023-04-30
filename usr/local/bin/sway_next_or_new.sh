#!/bin/bash

next_or_new=`swaymsg -r -t get_workspaces | jq -r --arg OUTPUT $(swaymsg -t get_outputs -r | jq -r '.[] | select(.focused == true) | .name') '(. | (max_by(.num) | .num)) as $max | [.[] | select(.output == $OUTPUT)] | (max_by(.num) | .num) as $maxOutput | (.[] | select(.focused == true) | .num) as $current | if $maxOutput > $current then "next_on_output" else $max + 1 end'` && swaymsg "workspace $next_or_new"
