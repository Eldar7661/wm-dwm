#!/bin/bash

color="\e[38;5;15m"

declare -A icons
# speaker
#     i  j
icons["0,0"]="\e[1;31m󰖁"
icons["0,1"]="$color󰕾"
# headphones
icons["1,0"]="\e[1;31m󰟎"
icons["1,1"]="$color󰋋"
# bluetooth-headphones
icons["2,0"]="\e[1;31m󰟎󰂱"
icons["2,1"]="$color󰋋󰂱"


i=0  # type Active Port
j=0  # Mute this Active Port
# pactl list sinks | grep "Active Port: analog-output-speaker" > /dev/null
# if [[ $? -eq 0 ]]; then
#     i=0
# fi
pactl list sinks | grep "Active Port: analog-output-headphones" > /dev/null
if [[ $? -eq 0 ]]; then
    i=1
fi
pactl info | grep "Default Sink:" | awk '{print $3}' | grep "bluez_sink" >> /dev/null
if [[ $? -eq 0 ]]; then
    i=2
fi

amixer get Master | grep '\[on\]' > /dev/null
if [ $? -eq 0 ]; then
    j=1
fi

level=$(amixer get Master | grep -o -m 1 "[0-9]*%")

echo -e "${icons["$i,$j"]} \e[1;36m$level\e[0m"
