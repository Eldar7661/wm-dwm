#!/bin/bash

get_time() {
    echo $(date +"%H:%M:%S")
    # echo $(date +"%H:%M")
}
get_bat() {
    echo "󰁹 "$(cat /sys/class/power_supply/BAT1/capacity)"%"
}
get_volume() {
    echo "󰕾 "$(amixer get Master | grep -o -m 1 '[0-9]*%')
}
get_net() {
    nmcli device status | grep -m 1 "^enp7s0.*ethernet.*connected" > /dev/null
    if [ $? -eq 0 ]; then
        echo "󰒍"
    else
        nmcli device status | grep -m 1 "^wlp8s0.*wifi.*disconnected" > /dev/null
        if [ $? -eq 0 ]; then
            echo "󰒎"
        else
            wifi_level=$(nmcli -f IN-USE,SIGNAL device wifi list | grep "\*" | sed 's/^\*\s*\([0-9]*\)\s*$/\1/')
            wifi_name=$(nmcli device status | grep -m 1 "^wlp8s0.*wifi.*connected" | sed 's/.*connected\s*\(.*\)/\1/')

            nmcli networking connectivity check | grep full > /dev/null
            if [ $? -eq 0 ]; then
                echo "󰖩 $wifi_name$wifi_level"
            else
                echo "󱚵 $wifi_name $wifi_level"
            fi
        fi
    fi
}
get_cpu() {
    echo "󰻠 "$(top -bn1 | grep -o -m 1 "%Cpu(s):  [0-9]" | grep -o -m 1 "[0-9]")
}
get_brightness() {
    current=$(cat /sys/class/backlight/intel_backlight/brightness)
    max=$(cat /sys/class/backlight/intel_backlight/max_brightness)

    echo "󰃟 "$(( ($current * 100) / $max ))
}

space() {
    echo " | "
}

print() {
    line=""
    line+=$(get_cpu)
    line+=$(space)
    line+=$(get_net)
    line+=$(space)
    line+=$(get_volume)
    line+=$(space)
    line+=$(get_brightness)
    line+=$(space)
    line+=$(get_bat)
    line+=$(space)
    line+=$(get_time)

    echo "$line"
    # xsetroot -name "$line"
}

while true; do

    print

    sleep 1s

done
