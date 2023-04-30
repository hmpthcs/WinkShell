if [ $# -eq 0 ]
then
# return actual volume when no parameter is received
    echo $(wpctl get-volume @DEFAULT_AUDIO_SINK@)
else
# set first parameter as volume if there is parameter
    res=$(wpctl set-volume @DEFAULT_AUDIO_SINK@ $1% ; wpctl set-mute @DEFAULT_AUDIO_SINK@ 0)
fi
