if [ $# -eq 0 ]
then
    echo ""
else
    brightnessctl -d backlight_warm set 0
fi

exit
