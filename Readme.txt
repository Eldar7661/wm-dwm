

For enable NumLock          used utilite "numlockx"
For disable TouchPad        used utilite "xinput"
For settings Monitor        used utilite "xrandr"

For adjustment brightness   used utilite "brightness"
For adjustment sound volume used utilite "amixer"


Settings window manager

dwm
[/wm/dwm/]$           sudo make clean install

dmenu
[/wm/dmenu/]$         sudo make clean install

slstatus
[/wm/slstatus/]$      sudo make clean install


[/wm/]$               ./install.sh

    create link files ~/.xinitrc ~/.Xresources
    unpack cursor-theme to ~/.local/share/icons/
    added keyboard for switch language "alt + shift"
