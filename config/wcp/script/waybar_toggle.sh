#!/bin/bash

#######
# part 1: this part is so that the script can be assigned to a wcp button and not triggered anytime wcp opens; (that is, wait for button push before doing anything)

# part 2: this part can be cut away from part 1 for general use outside of wcp
######################
# flag here is "b"; argument for the flag is "barid"
# case part sets the provided argument as the variable "barid"
# input to script as follows to set the barid as "hw": "waybar_toggle.sh -b hw"
#########################

while getopts b: flag
do
    case "${flag}" in
        b) barid=${OPTARG};;
    esac
done

echo "barid = $barid"

if [ $# -eq 0 ]
then
    echo ""
else

#########################
# mode is double-quoted because swaymsg returns various lines which contain the word.
# awk '{print $2}' prints the second item on the line returned by grep for "mode"
# this includes quotes; thus substr is used with this logic: substring of item2, starting with character2, continuing for the length of item2, stopping at character which is 3 from the final character
##############################

  currentbarmode=$(swaymsg -t get_bar_config ${barid} | grep '"mode"' | awk '{print substr($2,2,length($2)-3)}')

  echo "currentbarmode = $currentbarmode"

# actual meat of the shell script below:

  if [[ "$currentbarmode" == "invisible" ]];
  then
    echo "sending hide command to swaymsg for $barid"
    swaymsg "bar ${barid} mode hide"
  elif [[ "$currentbarmode" == "hide" ]];
  then
    echo "sending invisible command to swaymsg for $barid" 
    swaymsg "bar ${barid} mode invisible"
  fi

fi

exit

# if pgrep -x "waybar" > /dev/null
# then 
#	killall -SIGUSR1 "waybar"
# else
#	waybar -c ~/.config/waybar/waybar_hw_center_input.config
#fi
#
# if pgrep -x "wlclock" > /dev/null
# then
#	killall "wlclock"
# else
#	exec /usr/local/bin/wlclock_topright-run.sh
# fi
