if [ $# -eq 0 ]
then
    echo ""
else
    swaymsg exec loginctl terminate-user $USER
fi
