#!/bin/bash

localectl --no-convert set-x11-keymap us,ru pc104 ,qwerty grp:alt_shift_toggle
/bin/bash ~/wm/bash/install/log_print.sh "Set locale" "$?"
