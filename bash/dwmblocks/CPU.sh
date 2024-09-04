#!/bin/bash

# Вычисляем загрузку CPU
cpu_load=$(mpstat 1 1 | awk '/Average/ {print 100 - $NF}')

if (( $(echo "$cpu_load > 70" | bc -l) )); then
    color="\e[1;31m"
elif (( $(echo "$cpu_load > 30" | bc -l) )); then
    color="\e[1;33m"
else
    color="\e[1;32m"
fi

echo -e "\e[1;37mCPU: $color$cpu_load%\e[0m"
