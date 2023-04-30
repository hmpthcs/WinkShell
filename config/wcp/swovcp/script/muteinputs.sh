if [ $# -eq 0 ]
then
    echo ""
else

pactl set-source-mute @DEFAULT_SOURCE@ 1

fi

exit
