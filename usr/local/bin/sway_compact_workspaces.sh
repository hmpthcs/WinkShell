#!/bin/bash
count=1
for workspace in $(swaymsg -t get_workspaces -r | jq '. | sort_by(.num)[] | .name'); do
  swaymsg rename workspace $workspace to $count
  ((count+=1))
done
