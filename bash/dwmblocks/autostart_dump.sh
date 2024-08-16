#!/bin/bash


# DUMP !!! NO WORK

# this script listen even, and give a signal to dwmBlocks





# battory

inotifywait -m -e modify /sys/class/power_supply/BAT1/status | while read -r path action file; do
    pkill -RTMIN+1 dwmblocks
done &

# bluetooth

dbus-monitor --system "type='signal',interface='org.freedesktop.DBus.Properties',member='PropertiesChanged'" |
while read -r line; do
    echo "Event\n"
    pkill -RTMIN+5 dwmblocks
    pkill -RTMIN+2 dwmblocks
done &
