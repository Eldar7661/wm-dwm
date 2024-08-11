#!/bin/bash

./mkdir.sh "~/.local"
./mkdir.sh "~/.local/share"
./mkdir.sh "~/.local/share/fonts"

cp ~/wm/fonts/MaterialDesignIconsDesktop.ttf ~/.local/share/fonts/
fc-cache -fv
