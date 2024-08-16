#!/bin/bash

declare -A icons
# icon discharging
icons["0,0"]="󱃍" # 0  - 10
icons["1,0"]="󰁺" # 10 - 19
icons["2,0"]="󰁻" # 20 - 29
icons["3,0"]="󰁼" # 30 - 39
icons["4,0"]="󰁽" # 40 - 49
icons["5,0"]="󰁾" # 50 - 59
icons["6,0"]="󰁿" # 60 - 69
icons["7,0"]="󰂀" # 70 - 79
icons["8,0"]="󰂁" # 80 - 89
icons["9,0"]="󰂂" # 90 - 99
icons["10,0"]="󰁹" #    100
# icon charging
icons["0,1"]="󰢟" # 0  - 10
icons["1,1"]="󰢜" # 10 - 19
icons["2,1"]="󰂆" # 20 - 29
icons["3,1"]="󰂇" # 30 - 39
icons["4,1"]="󰂈" # 40 - 49
icons["5,1"]="󰢝" # 50 - 59
icons["6,1"]="󰂉" # 60 - 69
icons["7,1"]="󰢞" # 70 - 79
icons["8,1"]="󰂊" # 80 - 89
icons["9,1"]="󰂋" # 90 - 99
icons["10,1"]="󰂅" #    100

# level battory volte in "%"
level=$(cat /sys/class/power_supply/BAT1/capacity)
# level=$1
i=$(( ($level - ($level % 10)) / 10 ))   # Example 62 => 6, 91 => 9
j="0"                                    # flag charging/discharging

# Full, charging, discharging
cat /sys/class/power_supply/BAT1/status | grep "Discharging" > /dev/null
if [ ! $? -eq 0 ]; then
    j="1"
fi

if (( level >= 90)); then
    echo -e "\e[1;32m${icons["$i,$j"]} \e[36m$level%\e[0m"
elif (( level <= 30 )); then
    echo -e "\e[1;31m${icons["$i,$j"]} \e[36m$level%\e[0m"
else
    echo -e "\e[1;33m${icons["$i,$j"]} \e[36m$level%\e[0m"
fi
