#!/bin/bash
for i in {0..255}; do
    echo -ne "\033[48;5;${i}m ${i} \033[0m"
    if [ $(( (i + 1) % 12 )) == 0 ]; then
        echo
    fi
done
echo -e "\n"
