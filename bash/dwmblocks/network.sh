#!/bin/bash

declare -A icons
# icon
icons["0,0"]="\e[1;31m󰅛"      # Ehternet off
icons["0,1"]="\e[1;32m󰌗"      # Ehternet on
# icon
icons["1,0"]="\e[1;31m󰤯"      # WiFi Off
icons["1,1"]="\e[1;32m󰤨"      # WiFi On
# icon
icons["2,0"]="\e[1;31m󰅛\e[0m" # Network Off
icons["2,1"]="\e[1;32m󰱓\e[0m" # Network On

access_ehternet="0"
access_wifi="0"
access_network="0"

nmcli device status | grep -m 1 "^enp7s0.*ethernet.*connected" > /dev/null
if [ $? -eq 0 ]; then
    access_ehternet="1"
fi

nmcli device status | grep -m 1 "^wlp8s0\s*wifi\s*connected" > /dev/null
if [ $? -eq 0 ]; then
    access_wifi="1"
fi

nmcli networking connectivity check | grep "full" > /dev/null
if [ $? -eq 0 ]; then
    access_network="1"
fi

echo -e "${icons["0,$access_ehternet"]} ${icons["1,$access_wifi"]} ${icons["2,$access_network"]}"
