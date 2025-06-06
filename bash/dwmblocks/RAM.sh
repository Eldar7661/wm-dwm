#!/bin/bash

total=$(free -m | grep -oP "^Mem:\s+\K\d+")
# used=$(free -m | grep -oP "^Mem:\s+\d+\s+\K\d+")
available=$(free -m | grep -oP "^Mem:.+\s\K\d+$")

used_new=$(( $total - $available ))
used_percent=$(echo "scale=3; ${used_new} * 100 / ${total}" | bc -l)

# thd -> threshold
thd_average_percent=70
thd_low_percent=40
# thd_high_percent=100

color_white="\e[1;37m"
color_green="\e[1;32m"
color_yellow="\e[1;33m"
color_red="\e[1;31m"
color_null="\e[0m"

if (( $(echo "${used_percent} > ${thd_average_percent}" | bc -l) )); then
    color=$color_red
elif (( $(echo "${used_percent} > ${thd_low_percent}" | bc -l) )); then
    color=$color_yellow
else
    color=$color_green
fi

echo -e "${color}${used_new}${color_white}/${total}${color}MB${color_null}"

# if there is an argument, do not
# show additional information
if (( $# == 0 )); then
    echo -e "\nRAM: ${color}${used_percent}%${color_null}"
    # echo -e "${color}${used_new}${color_white}${total}${color}MB ${used_percent}%${color_null}"

    thd_average=$(echo "scale=0; ${total} * ${thd_average_percent} / 100" | bc -l)
    thd_low=$(echo "scale=0; ${total} * ${thd_low_percent} / 100" | bc -l)

    echo -e " "
    echo -e "is used <= ${color_green}${thd_low}MB${color_null}"
    echo -e "is used <= ${color_yellow}${thd_average}MB${color_null}"
    echo -e "is used <= ${color_red}${total}MB${color_null}"
fi
