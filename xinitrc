#!/bin/bash

# Disable TouchPad
TouchPad=$(xinput list | grep TouchPad | grep -oP "(?<=id=)\d+")
[ -n "$TouchPad" ] && xinput disable "$TouchPad"

# Enable NumLock
numlockx on



# For Cursor
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

# Setting Monitor
xrandr --output eDP-1  --auto --primary
xrandr --output HDMI-1 --auto --left-of eDP-1
xrandr --output VGA-1  --auto --right-of eDP-1

# Set background desktop
#feh --bg-scale ~/wm/source/wallpaper/2.png
feh --no-fehbg \
    --bg-fill ~/wm/source/wallpaper/2.png \
    --bg-fill ~/wm/source/wallpaper/5.png \
    --bg-fill ~/wm/source/wallpaper/6.png \



dwmblocks &   # Status bar
clipmenud &   # history Clipboard
picom &       # Blur
/bin/bash ~/wm/bash/autostart/sound.sh & # Sound welcome

exec dwm
