#!/bin/bash

current=$(cat /sys/class/backlight/intel_backlight/brightness)
max=$(cat /sys/class/backlight/intel_backlight/max_brightness)

step=$(($max / 20))

if [ "$1" == "-h" ]; then
    echo -e "\t-inc \t up level brightness on 5%"
    echo -e "\t-dec \t down level brightness on 5%\n"
elif [ "$1" = "-inc" ]; then

    new=$(($current + $step))
    if [ $new -le $max ]; then
        echo $new | sudo tee /sys/class/backlight/intel_backlight/brightness
    fi

elif [ "$1" = "-dec" ]; then

    new=$(($current - $step))
    if [ $new -ge 0 ]; then
        echo $new | sudo tee /sys/class/backlight/intel_backlight/brightness
    fi

else
    echo -e "\t run: brightness.sh -h\n"
fi
