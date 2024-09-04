//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
    /*Icon*/    /*Command*/         /*Update Interval*/ /*Update Signal*/
    {"", "~/wm/bash/dwmblocks/CPU.sh",          6,      0 },
    {"", "~/wm/bash/dwmblocks/bluetooth.sh",   60,      0 },
    {"", "~/wm/bash/dwmblocks/network.sh",      0,      4 },
    {"", "~/wm/bash/dwmblocks/wifi.sh",        60,      4 },
    {"", "~/wm/bash/dwmblocks/sound.sh",       20,      2 },
    {"", "~/wm/bash/dwmblocks/brightness.sh",   0,      3 },
    {"", "~/wm/bash/dwmblocks/battory.sh",     60,      0 },
    {"", "~/wm/bash/dwmblocks/time.sh",         1,      0 },

    // {"Mem:", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",	30,		0},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
