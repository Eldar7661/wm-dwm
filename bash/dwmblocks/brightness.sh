#!/bin/bash

# declare -A colors
# # color code
# colors["5%"]="208"
# colors["10%"]="208"
# colors["15%"]="208"
# colors["20%"]="208"
# colors["25%"]="208"
# colors["30%"]="208"
# colors["35%"]="208"
# colors["40%"]="208"
# colors["45%"]="208"
# colors["50%"]="208"
# colors["55%"]="220"
# colors["60%"]="219"
# colors["65%"]="88"
# colors["70%"]="109"
# colors["75%"]="108"
# colors["80%"]="107"
# colors["85%"]="106"
# colors["90%"]="102"
# colors["95%"]="101"
# colors["100%"]="100"


level=$(brightnessctl | grep -o -m 1 "[0-9]*%")
# level_number=$(echo $level | grep -o -m 1 "[0-9]*")
# code=$(( 40 + (($level_number - ( $level_number % 10)) / 10) ))

# echo -e "\e[38;5;${colors["$level"]}m󰃟 \e[1;36m$level\e[0m"
# echo -e "\e[38;5;${code}m󰃟 \e[1;36m$level\e[0m"

echo -e "\e[38;5;15m󰃟 \e[1;36m$level\e[0m"
