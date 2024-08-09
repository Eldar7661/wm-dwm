#!/bin/sh



# Enable NumLock
numlockx on

# Disable TouchPad
xinput disable 15


# for Cursor
xrdb -merge ~/.Xresources

# set background desktop
#feh --bg-scale ~/1.png



# Setting Monitor
xrandr --output HDMI-1 --auto --left-of eDP-1
xrandr --output VGA-1 --auto --right-of eDP-1

# Status bar {
    # Enabling only one!!! homemade OR slstatus

    # homemade bar
    #~/wm/bash/bar.sh &

    # slstatus
    exec slstatus &
# }

exec dwm
