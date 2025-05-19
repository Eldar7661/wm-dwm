#!/bin/bash

/bin/bash ~/wm/bash/install/mkdir.sh ~/.local/share/fonts

cp ~/wm/source/font/Material/MaterialDesignIconsDesktop.ttf ~/.local/share/fonts/
/bin/bash ~/wm/bash/install/log_print.sh "Copy MaterialDesignIconsDesktop.ttf" "$?"

cp ~/wm/source/font/JetBrainsMono/JetBrainsMono-Bold.ttf    ~/.local/share/fonts/
/bin/bash ~/wm/bash/install/log_print.sh "Copy JetBrainsMono-Bold.ttf" "$?"
cp ~/wm/source/font/JetBrainsMono/JetBrainsMono-Medium.ttf  ~/.local/share/fonts/
/bin/bash ~/wm/bash/install/log_print.sh "Copy JetBrainsMono-Medium.ttf" "$?"
cp ~/wm/source/font/JetBrainsMono/JetBrainsMono-Regular.ttf ~/.local/share/fonts/
/bin/bash ~/wm/bash/install/log_print.sh "Copy JetBrainsMono-Regular.ttf" "$?"

fc-cache -fv
/bin/bash ~/wm/bash/install/log_print.sh "Update cache font" "$?"
