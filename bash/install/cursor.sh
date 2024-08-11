#!/bin/bash

#tar -xvf Bibata.tar.gz                # extract `Bibata.tar.gz`
#mv Bibata-* ~/.local/share/icons/     # Install to local users
#sudo mv Bibata-* /usr/share/icons/    # Install to all users


./mkdir.sh "~/.local"
./mkdir.sh "~/.local/share"
./mkdir.sh "~/.local/share/icons"

tar -xvf ~/wm/cursor/Bibata-Modern-Classic.tar.xz -C ~/.local/share/icons/
mv ~/.local/share/icons/Bibata-Modern-Classic ~/.local/share/icons/bibata

#echo -e "Xcursor.theme: bibata\nXcursor.size: 24" >> ~/.Xresources
