if [ $# -eq 0 ]
then
    echo ""
else

echo 0 > /sys/class/backlight/backlight_cool/brightness
echo 0 > /sys/class/backlight/backlight_warm/brightness

fi
