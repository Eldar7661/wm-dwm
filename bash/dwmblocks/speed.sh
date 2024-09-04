#!/bin/bash

# Интерфейс сети
# INTERFACE="wlp8s0"
INTERFACE=$(ip route | grep '^default' | awk '{print $5}')

# Путь к файлам для хранения предыдущих значений
RX_FILE="~/wm/bash/dwmblocks/rx_bytes"
# TX_FILE="~/wm/bash/dwmblocks/tx_bytes"

# Преобразование в абсолютный путь
RX_FILE=$(eval echo $RX_FILE)
# TX_FILE=$(eval echo $TX_FILE)

# Получаем текущие значения байтов
RX_CURRENT=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
# TX_CURRENT=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)

# Читаем предыдущие значения, если файлы существуют
if [[ -f $RX_FILE ]]; then
    RX_PREV=$(cat $RX_FILE)
else
    RX_PREV=$RX_CURRENT
fi

# if [[ -f $TX_FILE ]]; then
#     TX_PREV=$(cat $TX_FILE)
# else
#     TX_PREV=$TX_CURRENT
# fi

# Вычисляем скорость загрузки и выгрузки
RX_RATE=$((RX_CURRENT - RX_PREV))
# TX_RATE=$((TX_CURRENT - TX_PREV))

# Преобразуем скорость в МБ/с
RX_DISPLAY=$(echo "scale=2; $RX_RATE/1024/1024" | bc | awk '{printf "%.2f", $0}')MB/s
# TX_DISPLAY=$(echo "scale=2; $TX_RATE/1024/1024" | bc | awk '{printf "%.2f", $0}')MB/s


# Сохраняем текущие значения для следующего запуска
echo $RX_CURRENT > $RX_FILE
# echo $TX_CURRENT > $TX_FILE

# Отображаем результат в статусной строке
echo $RX_DISPLAY
# echo -e "\e[1;36m$RX_DISPLAY\e[0m"
