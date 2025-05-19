#!/bin/bash

#img=""
#case $((RANDOM % 4)) in
#    0) img='3';;
#    1) img='4';;
#    2) img='5';;
#    3) img='6';;
#esac

img="lock"
i3lock -feti ~/wm/wallpaper/$img.png -b

#-f, --show-failed-attempts
#-k, --show-keyboard-layout
#-e, --ignore-empty-password
#-t, --tiling
#-i path, --image=path
#-b, --beep

# pkill dwm
# pkill -KILL -u eldar
