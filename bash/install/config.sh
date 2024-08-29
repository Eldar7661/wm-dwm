#!/bin/bash

/bin/bash ~/wm/bash/install/mkdir.sh ~/.config/cava
ln -s ~/wm/config/cava/config ~/.config/cava/config
/bin/bash ~/wm/bash/install/log_print.sh "Create link to: ~/.config/cava/config" "$?"

/bin/bash ~/wm/bash/install/mkdir.sh ~/.config/picom
ln -s ~/wm/config/picom.conf ~/.config/picom/picom.conf
/bin/bash ~/wm/bash/install/log_print.sh "Create link to: ~/.config/picom/picom.conf" "$?"
