#!/bin/bash

DIRECTORY=$1

if [ ! -d "$DIRECTORY" ]; then
    mkdir -p $DIRECTORY
    if [[ $? -eq 0 ]]; then
        echo -e "\e[1;32mDirectory created: $DIRECTORY\e[0m"
    else
        echo -e "\e[1;31mDirectory no created: $DIRECTORY\e[0m"
        echo "Directory no created: $DIRECTORY" >> ~/wm/log_error.txt
    fi
else
    echo -e "\e[1;32mDirectory already exists: $DIRECTORY\e[0m"
fi
