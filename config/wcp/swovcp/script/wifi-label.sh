if [ $# -eq 0 ]
then
# return actual volume when no parameter is received
    echo $(iwctl station wlan0 show | sed -n 7p | awk '{print $3,$4,$5,$6,$7}')
fi
