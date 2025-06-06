{directory}_rest
    means that this directory does not contain all the files that fit in this folder
    [ru] означает что в этой папки не все файлы, которые подходят в эту папку





all apps, utilites {

    Installing : make, tar, fc-cache, localectl
    user       : dmenu, clipmenu, cava, i3lock
    xinitrc    : xinput, numlockx, xrdb, xrandr, feh, mpv, picom, dwmblocks
    dwm        : brightnessctl, amixer
    dwmBlocks  : systemctl, bluetoothctl, dbus-send, nmcli, mpstat, free, pactl, ip,

    other commands     "/bin/: mv, cp, mkdir, echo, ln, pkill,
                               cat, cut, grep, sed, awk, bc, eval, date"

}

Installing used {

    For package bilds             used "make"
    For unpack                    used "tar"
    For update fonst system       used "fc-cache -fv"
    For hot-key-lang              used "localectl"

}

user used {

    For run program                used         "dmenu"    run from dwm
    For history clipboard          used utilite "clipmenu" run from dwm
    For visual sound               used         "cava"     run from dwm
    For lock user                  used         "i3lock"   run from dwm

}

xinitrc used {

    For disable TouchPad           used utilite "xinput"
    For enable NumLock             used utilite "numlockx"
    For set Cursor                 used utilite "xrdb"
    For settings Monitor           used utilite "xrandr"
    For wallpaper                  used app     "feh"
    For sound                      used app     "mpv"
    For transparency and blur      used utilite "picom &"
    For status bar                 used         "dwmblocks &"

}

dwm used {

    For adjustment brightness      used utilite "brightnessctl"
    For adjustment sound volume    used utilite "amixer"

}

dwmBlocks used {

    For battory                    used cat grep
    For bluetooth                  used systemctl, bluetoothctl, dbus-send, grep, sed
    For brightness                 used brightnessctl, grep
    For CPU                        used mpstat awk bc
    For network                    used NetworkManager( nmcli ), grep
    For RAM                        used free grep bc
    For sound                      used pactl, amixer, grep, awk
    For speed                      used ip grep awk eval cat bc awk
    For time                       used date
    For wifi                       used NetworkManager( nmcli ), grep, cut

}





Installing window manager

dwm
[/wm/dwm/]$           sudo make clean install

dmenu
[/wm/dmenu/]$         sudo make clean install

dwmblocks
[/wm/dblocks/]$       sudo make clean install

[/wm/]$               ./install.sh

    create link files ~/.xinitrc ~/.Xresources
    create link files configs
    unpack cursor-theme to ~/.local/share/icons/
    copy font to ~/.local/share/fonts/
    added keyboard "alt + shift" for switch language "us,ru"

other           Additionally, Necessarily   !!!

    dwmblocks
    $ sudo cp ~/wm/bash/dblocks/99-motitor-for-dwmblocks /etc/NetworkManager/dispatcher.d/

    dwm->clipmenu
    $ sudo cp ~/wm/bash/clipmenu/clipmenu /usr/bin/
    $ sudo cp ~/wm/bash/clipmenu/clipmenud /usr/bin/
