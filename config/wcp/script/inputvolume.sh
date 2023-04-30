if [ $# -eq 0 ]
then
# return actual volume when no parameter is received
    echo $(wpctl get-volume @DEFAULT_AUDIO_SOURCE@)
else
# set first parameter as volume if there is parameter
    res=$(wpctl set-volume @DEFAULT_AUDIO_SOURCE@ $1% ; wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 0)
fi
