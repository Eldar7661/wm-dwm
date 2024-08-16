#!/bin/bash

# dd=$(date +%H:%M:%S)
hour=$(date +%H)
minute=$(date +%M)
second=$(date +%S)

year=$(date +%Y)
month=$(date +%m)
day=$(date +%d)

echo -e "\e[1;32m$hour:$minute:$second\e[0m"
# echo -e "\e[1;32m$hour:$minute:$second~$day.$month.$year\e[0m"
