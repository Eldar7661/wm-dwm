#!/bin/bash

declare -A icons
icons["0"]="\e[1;31m󰂲" # bluetooth off
icons["1"]="\e[1;33m󰂯" # bluetooth on
icons["2"]="\e[1;33m󰥰" # bluetooth connect



if systemctl is-active --quiet bluetooth; then
    bluetoothctl show | grep "Powered: yes" > /dev/null
    if [ $? -eq 0 ]; then

        icon="1"

        macs=$(bluetoothctl devices | grep -o -E "([0-9A-F:]{17})")
        array=($macs)

        for device_mac in "${array[@]}"; do

            # Преобразуем MAC-адрес в формат, используемый D-Bus
            dbus_mac=$(echo "$device_mac" | sed 's/:/_/g')
            # Проверяем статус подключения
            connected=$(dbus-send --system \
                --print-reply \
                --dest=org.bluez /org/bluez/hci0/dev_"$dbus_mac" \
                org.freedesktop.DBus.Properties.Get \
                string:"org.bluez.Device1" string:"Connected" \
                | grep -o -E "true|false")
                # | grep boolean | awk '{print $2}')

            if [ "$connected" = "true" ]; then
                icon="2"
            fi

        done

    else
        icon="0"
    fi
else
    icon="0"
fi

echo -e "${icons["$icon"]}\e[0m"
