#!/bin/bash

~/wm/bash/install/mkdir.sh ~/.local
~/wm/bash/install/mkdir.sh ~/.local/share
~/wm/bash/install/mkdir.sh ~/.local/share/fonts

cp ~/wm/fonts/Material/MaterialDesignIconsDesktop.ttf ~/.local/share/fonts/
cp ~/wm/fonts/JetBrainsMono/JetBrainsMono-Bold.ttf    ~/.local/share/fonts/
cp ~/wm/fonts/JetBrainsMono/JetBrainsMono-Medium.ttf  ~/.local/share/fonts/
cp ~/wm/fonts/JetBrainsMono/JetBrainsMono-Regular.ttf ~/.local/share/fonts/
fc-cache -fv
