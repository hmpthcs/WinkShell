if [ $# -eq 0 ]
then
    echo ""
else
    brightnessctl -d backlight_cool set 0
fi

exit
