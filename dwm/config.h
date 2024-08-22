/* See LICENSE file for copyright and license details. */


/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 16;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = {
    "JetBrains Mono:style=Regular:size=10",
    "Material Design Icons Desktop:style=Regular:size=10"
};
static const char dmenufont[]       = "monospace:size=10";


const char *prefix_window_title = "󱩅";
static const char bg_bar[] = "#222222";
static const char *colors[][3]      = {
    /*               fg         bg      border   */
    [SchemeNorm] = { "#ffa500", bg_bar, "#ffffff" },
    [SchemeSel]  = { "#8f00ff", bg_bar, "#ff0000" },
};
static const char *colors_window_title[][3]      = {
    [SchemeIcon]  = { "#00ffff", bg_bar, "#ffffff" },
    [SchemeTitle] = { "#ffffff", bg_bar, "#ff0000" },
};
// NO CHANGING
static const char *barcolors[] = {
    "#000000", "#7f0000", "#007f00", "#7f7f00",
    "#00007f", "#7f007f", "#007f7f", "#cccccc",
    "#333333", "#ff0000", "#00ff00", "#ffff00",
    "#0000ff", "#ff00ff", "#00ffff", "#ffffff",
};

/* tagging */
static const char *tags[] =        { "󰧞", "󰧞", "󰧞", "󰧞", "󰧞", "󰧞", "󰧞", "󰧞", "󰧞" };
static const char *tags_active[] = { "󰮯", "󰊠", "󰊠", "󰊠", "󰊠", "󰊠", "󰊠", "󰊠", "󰊠" };
static const char *tagsalt[] =     { "1", "2", "3", "4", "5", "6", "7", "8", "9" };
static const char *tagsel[][2] = {
	{ "#ffff00", bg_bar },
	{ "#ff0000", bg_bar },
	{ "#ff7f00", bg_bar },
	{ "#00ff00", bg_bar },
	{ "#00ffff", bg_bar },
	{ "#0000ff", bg_bar },
	{ "#8f00ff", bg_bar },
	{ "#ff0080", bg_bar },
	{ "#008080", bg_bar },
};
static const Rule rules[] = {
    /* xprop(1):
     *	WM_CLASS(STRING) = instance, class
     *	WM_NAME(STRING) = title
     */
    /* class      instance    title       tags mask     isfloating   monitor */
    { "Gimp",     NULL,       NULL,       0,            1,           -1 },
    { "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
    /* symbol     arrange function */
    { "[ T ]",        tile },    /* first entry is default */
    { "[ F ]",        NULL },    /* no layout function means floating behavior */
    { "[ M ]",      monocle },
};

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = {
    "dmenu_run",            // run dmenu
    "-m", dmenumon,         // Опция для выбора монитора, на котором будет отображаться dmenu
    "-fn", dmenufont,       // set font
    "-nb", bg_bar,          // Color Norm background
    "-nf", "#808080",       // Color Norm font
    "-sb", bg_bar,          // Color Sel  background
    "-sf", "#ffffff",       // Color Sel  font
    NULL
};
static const char *termcmd[]  = { "xfce4-terminal", "--hide-menubar", "--hide-scrollbar", NULL };
static const char *flameshot_cmd[]  = { "flameshot", "gui", NULL };

static const char *sound_incr_cmd[] =       { "/bin/sh", "-c", "~/wm/bash/sound_volume.sh -inc", NULL};
static const char *sound_decr_cmd[] =       { "/bin/sh", "-c", "~/wm/bash/sound_volume.sh -dec", NULL};
static const char *sound_toggle_cmd[] =     { "/bin/sh", "-c", "~/wm/bash/sound_toggle.sh", NULL };
static const char *brightness_incr_cmd[] =  { "/bin/sh", "-c", "~/wm/bash/brightness.sh -inc", NULL};
static const char *brightness_decr_cmd[] =  { "/bin/sh", "-c", "~/wm/bash/brightness.sh -dec", NULL};
static const char *logout_cmd[] =           { "/bin/sh", "-c", "~/wm/bash/lock_user.sh", NULL };


// #include <X11/XF86keysym.h>
/* key definitions */
#define M Mod4Mask
#define S ShiftMask
#define C ControlMask
#define A Mod1Mask
// For pc Lenovo Y510P
#define XK_sound_incr         0x1008ff13  // Fn + SoundUp
#define XK_sound_decr         0x1008ff11  // Fn + SoundDown
#define XK_brightness_incr    0x1008ff02  // Fn + brightnessUp
#define XK_brightness_decr    0x1008ff03  // Fn + brightnessDown
// #define                    0xff9e      // NumIns
// #define                    0xffb0      // Num0
#define XK_Menu               0xff67      // Menu

// {
#define TAGKEYS(KEY,TAG) \
    { M,        KEY,      view,           {.ui = 1 << TAG} }, \
    { M|S,      KEY,      tag,            {.ui = 1 << TAG} }, \
    { M|C,      KEY,      toggleview,     {.ui = 1 << TAG} }, \
    { M|C|S,    KEY,      toggletag,      {.ui = 1 << TAG} },
    // line 1: view TAGE
    // line 2: move window in TAGE
    // line 3: toggle view TAGE
    // line 4: copy window in TAGE
// }
static const Key keys[] = {
    /* modifier   key                 function        argument */
    // toggle bar
    { M|C,        XK_Menu,            togglebar,      {0} },


    // run programm
    { C|A,        XK_t,               spawn,          {.v = termcmd } },
    { M,          XK_Menu,            spawn,          {.v = dmenucmd } },
    { 0,          XK_Print,           spawn,          {.v = flameshot_cmd } },
    // exit
    { M,          XK_q,               killclient,     {0} },
    { M|S,        XK_q,               quit,           {0} },
    { M,          XK_l,               spawn,          {.v = logout_cmd} },


    // Sound
    { 0,          XK_sound_incr,      spawn,          {.v = sound_incr_cmd} },
    { 0,          XK_sound_decr,      spawn,          {.v = sound_decr_cmd} },
    { M,          0xff9e,             spawn,          {.v = sound_toggle_cmd} },
    { M,          0xffb0,             spawn,          {.v = sound_toggle_cmd} },
    // Backlight
    { 0,          XK_brightness_incr, spawn,          {.v = brightness_incr_cmd} },
    { 0,          XK_brightness_decr, spawn,          {.v = brightness_decr_cmd} },


    // go to in Monitor
    { M,          XK_comma,           focusmon,       {.i = -1 } },
    { M,          XK_period,          focusmon,       {.i = +1 } },


    // view TAGE
    //M,          [0-9]

    // view all TAGE
    { M,          XK_0,               view,           {.ui = ~0 } },

    // view last TAGE
    { M,          XK_Tab,             view,           {0} },

    // toggle view TAGE
    //M|C,        [0-9]

    // change mode TAGE
    { M|C,        XK_Left,            setlayout,      {.v = &layouts[0]} },
    { M|C,        XK_Down,            setlayout,      {.v = &layouts[1]} },
    { M|C,        XK_Right,           setlayout,      {.v = &layouts[2]} },

    // change on last mode TAGE
    // { M,                       XK_space,  setlayout,      {0} },

    //
    { M|C,        XK_0,               togglealttag,   {.i = 0} },
    { M|A,        XK_0,               togglealttag,   {.i = 1} },



    // toggle floating window
    { M|C,        XK_Up,              togglefloating, {0} },

    // go to window
    { M,          XK_Up,              focusstack,     {.i = -1 } },
    { M,          XK_Down,            focusstack,     {.i = +1 } },

    // move window in Monitor
    { M|S,        XK_comma,           tagmon,         {.i = -1 } },
    { M|S,        XK_period,          tagmon,         {.i = +1 } },

    // move window in TAGE
    //M|S,        [0-9]

    // copy window in TAGE
    //M|C|S       [0-9]

    // copy window in all TAGE
    // { M|S,        XK_0,               tag,            {.ui = ~0 } },

    // move window in master
    { M,          XK_Return,          zoom,           {0} },
    // amount window in master
    { M,          XK_minus,           incnmaster,     {.i = -1 } },
    { M,          XK_equal,           incnmaster,     {.i = +1 } },
    // resize window
    { M,          XK_Left,            setmfact,       {.f = -0.05} },
    { M,          XK_Right,           setmfact,       {.f = +0.05} },

    TAGKEYS(XK_1, 0)
    TAGKEYS(XK_2, 1)
    TAGKEYS(XK_3, 2)
    TAGKEYS(XK_4, 3)
    TAGKEYS(XK_5, 4)
    TAGKEYS(XK_6, 5)
    TAGKEYS(XK_7, 6)
    TAGKEYS(XK_8, 7)
    TAGKEYS(XK_9, 8)
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
    /* click                event mask      button          function        argument */
    // { ClkTagBar,            0,              Button1,        view,           {0} },                   // view tage
    // { ClkTagBar,            0,              Button3,        toggleview,     {0} },                   // toggle view tage
    // { ClkTagBar,            M,              Button1,        tag,            {0} },                   // move win in tage
    // { ClkTagBar,            M,              Button3,        toggletag,      {0} },                   // copy win in tage

    // { ClkLtSymbol,          0,              Button1,        setlayout,      {0} },                   // set last mode tage
    // { ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },    // set mode[2] tage

    // { ClkWinTitle,          0,              Button2,        zoom,           {0} },                   // move window in master

    // { ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },        // run terminal

    { ClkClientWin,         M,              Button1,        movemouse,      {0} },                      // move window
    // { ClkClientWin,         M,              Button2,        togglefloating, {0} },                   // toggle floating window
    { ClkClientWin,         M,              Button3,        resizemouse,    {0} },                      // resize window
};
