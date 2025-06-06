#!/bin/bash

total=$(free -m | grep -oP "^Mem:\s+\K\d+")
# used=$(free -m | grep -oP "^Mem:\s+\d+\s+\K\d+")
available=$(free -m | grep -oP "^Mem:.+\s\K\d+$")

used_new=$(( $total - $available ))
used_percent=$(echo "scale=3; $used_new * 100 / $total" | bc -l)

if (( $(echo "$used_percent > 70" | bc -l) )); then
    color="\e[1;31m"
elif (( $(echo "$used_percent > 40" | bc -l) )); then
    color="\e[1;33m"
else
    color="\e[1;32m"
fi

echo -e "$color$used_new\e[1;37m/$total\e[0m"
# echo -e "$color$used\e[1;37m/$total $color$used_percent%\e[0m"
