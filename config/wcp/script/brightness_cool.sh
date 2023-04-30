if [ $# -eq 0 ]
then
    # return actual volume when no parameter is received
    act=$(brightnessctl -d backlight_cool g)
    max=$(brightnessctl -d backlight_cool m)
    echo "scale=2 ; $act / $max * 100" | bc
else
# set first parameter as volume if there is parameter
    res=$(brightnessctl -d backlight_cool set $1%)
fi
