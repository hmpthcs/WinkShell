if [ $# -eq 0 ]
then
    # return actual volume when no parameter is received
    act=$(brightnessctl -d backlight_warm g)
    max=$(brightnessctl -d backlight_warm m)
    echo "scale=2 ; $act / $max * 100" | bc
else
# set first parameter as volume if there is parameter
    res=$(brightnessctl -d backlight_warm set $1%)
fi
