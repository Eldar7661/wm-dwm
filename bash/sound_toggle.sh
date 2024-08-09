#!/bin/bash

amixer get Master | grep '\[on\]' > /dev/null
if [ $? -eq 0 ]; then
    amixer set Master mute > /dev/null
else
    amixer set Master unmute > /dev/null
fi 
