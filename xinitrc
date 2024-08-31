#!/bin/sh



# Enable NumLock
numlockx on

# Disable TouchPad
TouchPad=$(xinput list | grep TouchPad | grep -oP "(?<=id=)\d+")
xinput disable "$TouchPad"


# for Cursor
xrdb -merge ~/.Xresources

# set background desktop
feh --bg-scale ~/wm/wallpaper/2.jpg



# Setting Monitor
xrandr --output HDMI-1 --auto --left-of eDP-1
xrandr --output VGA-1 --auto --right-of eDP-1

# Status bar {
    # Enabling only one!!! homemade OR slstatus

    # homemade bar
    #~/wm/bash/bar.sh &

    # slstatus
    # exec slstatus &

    # dwmblocks
    exec dwmblocks &
# }

# history Clipboard
clipmenud &

picom &

# Sound welcome
~/wm/bash/autostart/sound.sh &

exec dwm
