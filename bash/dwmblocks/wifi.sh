#!/bin/bash

ssid=""
level=""

nmcli device status | grep -m 1 "^wlp8s0\s*wifi\s*connected" > /dev/null
if [ $? -eq 0 ]; then
    ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)
    level=$(nmcli -t -f active,ssid,signal dev wifi | grep '^yes' | cut -d: -f3)
fi

echo -e "\e[36m$ssid $level\e[0m"
