{directory}_rest
    means that this directory does not contain all the files that fit in this folder
    [ru] означает что в этой папки не все файлы, которые подходят в эту папку





all apps, utilites {

    make, tar, fc-cache, localectl
    numlockx, xinput, xrandr, feh
    brightnessctl, amixer
    systemctl, bluetoothctl, dbus-send, nmcli, clipmenu

    cat, cut, grep, sed, awk, date

    other commands     "/bin/bash: mv, cp, mkdir, echo, ln, pkill, grep"

}

Installing used {

    For package bilds             used "make"
    For unpack                    used "tar"
    For update fonst system       used "fc-cache -fv"
    For hot-key-lang              used "localectl"

}

xinitrc used {

    For enable NumLock             used utilite "numlockx"
    For disable TouchPad           used utilite "xinput"
    For settings Monitor           used utilite "xrandr"
    For wallpaper                  used app     "feh"

}

dwm used {

    For adjustment brightness      used utilite "brightnessctl"
    For adjustment sound volume    used utilite "amixer"
    For history clipboard          used utilite "clipmenu"

}

dwmBlocks used {

    For battory                    used cat
    For bluetooth                  used systemctl, bluetoothctl, dbus-send, grep, sed
    For Brightness                 used brightnessctl, grep
    For Network                    used NetworkManager( nmcli ), grep
    For Sound                      used pactl, amixer, grep, awk
    For time                       used date
    For wifi                       used NetworkManager( nmcli ), grep, cut

}





Installing window manager

dwm
[/wm/dwm/]$           sudo make clean install

dmenu
[/wm/dmenu/]$         sudo make clean install

slstatus
[/wm/slstatus/]$      sudo make clean install

dwmblocks
[/wm/dblocks/]$       sudo make clean install

[/wm/]$               ./install.sh

    create link files ~/.xinitrc ~/.Xresources
    unpack cursor-theme to ~/.local/share/icons/
    copy font to ~/.local/share/fonts/
    added keyboard "alt + shift" for switch language "us,ru"

other           Additionally, Necessarily   !!!

    dwmblocks
    $ sudo cp ~/wm/bash/dblocks/99-motitor-for-dwmblocks /etc/NetworkManager/dispatcher.d/

    dwm->clipmenu
    $ sudo cp ~/wm/bash/clipmenu/clipmenu /usr/bin/
    $ sudo cp ~/wm/bash/clipmenu/clipmenud /usr/bin/
