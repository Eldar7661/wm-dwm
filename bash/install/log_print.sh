#!/bin/bash
# /bin/bash ~/wm/bash/install/log_print.sh "" "$?"

success="\e[1;31m"
if [[ $2 -eq 0 ]]; then
    success="\e[1;32m"
else
    echo "$1" >> ~/wm/log_error.txt
fi

echo -e "$success$1\e[0m"
