if [ $# -eq 0 ]
then
    echo ""
else

pactl set-sink-mute @DEFAULT_SINK@ 1

fi

exit
