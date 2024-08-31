#!/bin/bash

volume=$(amixer get Master | grep -m 1 -Eo "..%")
mute=0

amixer get Master | grep '\[off\]' > /dev/null
if [ $? -eq 0 ]; then
    amixer set Master unmute > /dev/null
    mute=1
fi
amixer set Master 80% > /dev/null

mpv ~/wm/sound/welcome.mp3

amixer set Master "$volume" > /dev/null
if (( $mute == 1 )); then
    amixer set Master mute > /dev/null
fi

pkill -RTMIN+2 dwmblocks
