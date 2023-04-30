if [ $# -eq 0 ]
then
    echo ""
else

wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 1

fi

exit
