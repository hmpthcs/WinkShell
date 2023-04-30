#!/bin/bash

killall -9 wlclock ; echo "killed wlclock"

killall -9 lisgd ; echo "killed lisgd"; killall -9 lisgd-run.sh; echo "killed lisgd-run.sh" ; exec /usr/local/bin/lisgd-run.sh &
echo "started new lisgd-run.sh"

# killall -9 lavalauncher echo "killed lava" ; swaymsg 'exec "lavalauncher -c ~/.config/lavalauncher/lavaapp.conf"' ; echo "sent swaymsg instructing to open new lava"; swaymsg 'exec "lavalauncher -c ~/.config/lavalauncher/lavainput.conf"';

killall -9 swayrd ; echo "killed swayrd" ; swaymsg 'exec "env RUST_BACKTRACE=1 RUST_LOG=swayr=debug swayrd > /tmp/swayrd.log 2>&1"' ; echo "sent swaymsg to open new swayrd"

killall -9 winksh_rotate.sh ; echo "killed winksh_rotate.sh" ; killall monitor-sensor ; echo "kiled monitor-sensor"; killall -9 winksh_rotate.sh ; echo "killed winksh_rotate.sh" ; exec /usr/local/bin/winksh_rotate.sh & echo "opened new winksh_rotate.sh"

killall -9 wvkbd-mobintl ; echo "killed wvkbd" ; exec /usr/local/bin/keyboard_start.sh & echo "started new kbd process"

exec /usr/local/bin/lisgd_1diag_fromTR.sh &

killall  waybar ; echo "killed waybar" ; /usr/local/bin/waybar -c ~/.config/waybar/waybar_bars.config & echo "started new waybar"

echo "executed clock command; exiting init script"

exit
