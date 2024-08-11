
For package bilds           used "make"
For unpack                  used "tar"
For update fonst system     used "fc-cache -fv"
For hot-key-lang            used "localectl"


For enable NumLock          used utilite "numlockx"
For disable TouchPad        used utilite "xinput"
For settings Monitor        used utilite "xrandr"

For adjustment brightness   used utilite "brightness"
For adjustment sound volume used utilite "amixer"
For statusbar               used "slstatus or xsetroot"


other commands              "/bin/bash: mv, cp, mkdir, echo, ln, pkill"



Installing window manager

dwm
[/wm/dwm/]$           sudo make clean install

dmenu
[/wm/dmenu/]$         sudo make clean install

slstatus
[/wm/slstatus/]$      sudo make clean install


[/wm/]$               ./install.sh

    create link files ~/.xinitrc ~/.Xresources
    unpack cursor-theme to ~/.local/share/icons/
    copy font to ~/.local/share/fonts/
    added keyboard "alt + shift" for switch language "us,ru"
