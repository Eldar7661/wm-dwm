#!/bin/bash

if [ "$1" = "-inc" ]; then
    brightnessctl set 5%+
elif [ "$1" = "-dec" ]; then
    brightnessctl set 5%-
fi

pkill -RTMIN+3 dwmblocks
