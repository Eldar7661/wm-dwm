#!/bin/bash

#tar -xvf Bibata.tar.gz                # extract `Bibata.tar.gz`
#mv Bibata-* ~/.local/share/icons/     # Install to local users
#sudo mv Bibata-* /usr/share/icons/    # Install to all users


/bin/bash ~/wm/bash/install/mkdir.sh ~/.local/share/icons

tar -xvf ~/wm/source/cursor/Bibata-Modern-Classic.tar.xz -C ~/.local/share/icons/
/bin/bash ~/wm/bash/install/log_print.sh "Unpake cursor" "$?"
mv ~/.local/share/icons/Bibata-Modern-Classic ~/.local/share/icons/bibata
/bin/bash ~/wm/bash/install/log_print.sh "Rename cursor" "$?"

#echo -e "Xcursor.theme: bibata\nXcursor.size: 24" >> ~/.Xresources
