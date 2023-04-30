if [ $# -eq 0 ]
then
# return actual volume when no parameter is received
    echo $(pactl get-source-volume @DEFAULT_SOURCE@)
else
# set first parameter as volume if there is parameter
    res=$(pactl set-sink-volume @DEFAULT_SOURCE@ $1%)
fi
