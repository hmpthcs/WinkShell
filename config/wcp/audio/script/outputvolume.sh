if [ $# -eq 0 ]
then
# return actual volume when no parameter is received
    echo $(pactl get-sink-volume @DEFAULT_SINK@)
else
# set first parameter as volume if there is parameter
    res=$(pactl set-sink-volume @DEFAULT_SINK@ $0%)
fi
