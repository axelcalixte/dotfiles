/* See LICENSE file for copyright and license details. */

#define myTERM "kitty"

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "monospace:size=11:antialias:true:autohint:true",
					"fontawesome:size=11" 
};
static const char dmenufont[]       = "monospace:size=10";
static const char col_gray1[]       = "#212733";
static const char col_gray2[]       = "#212733";
static const char col_gray3[]       = "#cbccc6";
static const char col_gray4[]       = "#212733";
static const char col_cyan[]        = "#ffcc66";
static const char *colors[][3]      = {
    /*               fg         bg         border   */
    [SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
    [SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4"};

static const Rule rules[] = {
    /* xprop(1):
     *	WM_CLASS(STRING) = instance, class
     *	WM_NAME(STRING) = title
     */
    /* class      instance    title       tags mask     isfloating   monitor */
    { "KeePassXC",     "keepassxc",       NULL,        1 << 3,                       0,		-1 },
    { "thunderbird",	    "Mail",       NULL,        1 << 2,                       0,		-1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
    /* symbol     arrange function */
    { "[]=",		tile },    /* first entry is default */
    { "><>",		NULL },    /* no layout function means floating behavior */
    { "[M]",		monocle }
};

/* key definitions */
#include <X11/XF86keysym.h>
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { myTERM, NULL };

static Key keys[] = {
    /* modifier                     key        function        argument */
    { MODKEY,                       XK_p,      spawn,		{.v = dmenucmd } },
    { MODKEY|ShiftMask,		    XK_Return, spawn,		{.v = termcmd } },
    { MODKEY,                       XK_b,      togglebar,	{0} },
    { MODKEY,                       XK_j,      focusstack,	{.i = +1 } },
    { MODKEY,                       XK_k,      focusstack,	{.i = -1 } },
    { MODKEY,                       XK_i,      incnmaster,	{.i = +1 } },
    { MODKEY,                       XK_d,      incnmaster,	{.i = -1 } },
    { MODKEY,                       XK_h,      setmfact,	{.f = -0.05} },
    { MODKEY,                       XK_l,      setmfact,	{.f = +0.05} },
    { MODKEY,			    XK_Return, zoom,		{0} },
    { MODKEY,                       XK_Tab,    view,		{0} },
    { MODKEY|ShiftMask,             XK_c,      killclient,	{0} },
    { MODKEY,                       XK_t,      setlayout,	{.v = &layouts[0]} },
    { MODKEY,                       XK_f,      setlayout,	{.v = &layouts[1]} },
    { MODKEY,                       XK_m,      setlayout,	{.v = &layouts[2]} },
    { MODKEY,                       XK_space,  setlayout,	{0} },
    { MODKEY|ShiftMask,             XK_space,  togglefloating,	{0} },
    { MODKEY,                       XK_agrave, view,		{.ui = ~0 } },
    { MODKEY|ShiftMask,             XK_agrave, tag,		{.ui = ~0 } },
    { MODKEY,                       XK_ugrave, focusmon,	{.i = -1 } },
    { MODKEY|ShiftMask,		    XK_ugrave, tagmon,		{.i = -1 } },
    { MODKEY,                       XK_asterisk, focusmon,	{.i = +1 } },
    { MODKEY|ShiftMask,		    XK_asterisk, tagmon,	{.i = +1 } },

    TAGKEYS(                        XK_ampersand,                     0)
    TAGKEYS(                        XK_eacute,                        1)
    TAGKEYS(                        XK_quotedbl,                      2)
    TAGKEYS(                        XK_apostrophe,                    3)
    TAGKEYS(                        XK_parenleft,                     4)
    TAGKEYS(                        XK_minus,                         5)
    TAGKEYS(                        XK_egrave,                        6)
    TAGKEYS(                        XK_underscore,                    7)
    TAGKEYS(                        XK_ccedilla,                      8)
    { MODKEY|ShiftMask,             XK_Delete,      quit,           {0} },

    /* Function keys keybindings and/or scripts keybinds*/
    /* Mod1+Shift is the binding an application otherwise use MODKEY+Shift*/
    { MODKEY|ShiftMask,		    XK_q,			spawn, SHCMD("~/.local/bin/poweroff.sh") },
    {0,				    XF86XK_AudioMute,		spawn, SHCMD("amixer sset Master toggle ; notify-send 'audio muted'") },
    {0,				    XF86XK_AudioLowerVolume,	spawn, SHCMD("amixer -M set Master 5%-") },
    {0,				    XF86XK_AudioRaiseVolume, 	spawn, SHCMD("amixer -M set Master 5%+") },
    {0,				    XF86XK_AudioMicMute, 	spawn, SHCMD("amixer sset Capture toggle ; notify-send 'mic muted'") },
    {0,				    XF86XK_MonBrightnessDown, 	spawn, SHCMD("xbacklight -dec 5") },
    {0,				    XF86XK_MonBrightnessUp, 	spawn, SHCMD("xbacklight -inc 5") },
    {0,				    XF86XK_Display,		spawn, SHCMD("~/.local/bin/screens.sh") },
    //{0,			    XF86XK_WLAN,		spawn, SHCMD(myTERM " -e nmtui") }, casse tout nm sur debian... ?
    //{0,			    XF86XK_Tools,		spawn, SHCMD("utilities script with dmenu") },
    //{0,			    XF86XK_Bluetooth,		spawn, SHCMD("some_bluetooth_cli/gui") },
    //{0,			    XF86XK_Favorites,		spawn, SHCMD("config editor ? project ?") },
    { MODKEY,			    XK_Print,		    	spawn, SHCMD("sleep 0.2; scrot -s '/tmp/%F_%T_$wx$h.png' -e 'xclip -selection clipboard -target image/png -i $f'") },
    {MODKEY|ShiftMask,		    XK_Print,		    	spawn, SHCMD("sleep 0.2; scrot -s 'scrot-%d-%m-%Y_%R_$wx$h.png' -e 'mv $f ~/pics/ ; sxiv ~/pics/$f'") },

    /* Application keybinds */
    {Mod1Mask|ShiftMask,	    XK_h, 			spawn, SHCMD(myTERM " -e htop") },
    {Mod1Mask|ShiftMask,	    XK_n, 			spawn, SHCMD(myTERM " -e nnn") },
    {Mod1Mask|ShiftMask,	    XK_m, 			spawn, SHCMD(myTERM " -e pulsemixer") },
    {Mod1Mask|ShiftMask,	    XK_t, 			spawn, SHCMD("thunderbird") },
    {Mod1Mask|ShiftMask,	    XK_k, 			spawn, SHCMD("keepassxc") },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
    /* click                event mask      button          function        argument */
    { ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
    { ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
    { ClkWinTitle,          0,              Button2,        zoom,           {0} },
    { ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
    { ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
    { ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
    { ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
    { ClkTagBar,            0,              Button1,        view,           {0} },
    { ClkTagBar,            0,              Button3,        toggleview,     {0} },
    { ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
    { ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

