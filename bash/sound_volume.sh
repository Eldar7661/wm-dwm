#!/bin/bash

if [ "$1" = "-inc" ]; then
    amixer set Master 1%+
elif [ "$1" = "-dec" ]; then
    amixer set Master 1%-
fi

pkill -RTMIN+2 dwmblocks
