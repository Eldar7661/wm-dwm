#!/bin/bash

ln -s ~/wm/xinitrc ~/.xinitrc
/bin/bash ~/wm/bash/install/log_print.sh "Create link to: .xinitrc" "$?"

ln -s ~/wm/Xresources ~/.Xresources
/bin/bash ~/wm/bash/install/log_print.sh "Create link to: .Xresources" "$?"
