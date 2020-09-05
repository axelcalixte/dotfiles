/* See LICENSE file for copyright and license details. */

/* appearance */
static const char font[]        = "DejaVu Sans Mono-9";
static const char* normbgcolor  = "#212733";
static const char* normfgcolor  = "#5e6f7c";
static const char* selbgcolor   = "#bbbdfd";
static const char* selfgcolor   = "#5e6f7c";
static const char before[]      = "<";
static const char after[]       = ">";
static const int  tabwidth      = 200;
static const Bool foreground    = True;

/*
 * Where to place a new tab when it is opened. When npisrelative is True,
 * then the current position is changed + newposition. If npisrelative
 * is False, then newposition is an absolute position.
 */
static int  newposition   = 0;
static Bool npisrelative  = False;

#define SETPROP(p) { \
	.v = (char *[]){ "/bin/sh", "-c", \
		"prop=\"`xwininfo -children -id $1 | grep '^     0x' | sed -e's@^ *\\(0x[0-9a-f]*\\) \"\\([^\"]*\\)\".*@\\1 \\2@' | xargs -0 printf %b | dmenu -l 10`\" &&" \
		"xprop -id $1 -f $0 8s -set $0 \"$prop\"", \
		p, winid, NULL \
	} \
}

#define MODKEY ControlMask
static Key keys[] = { \
	/* modifier                     key        function        argument */
	{ MODKEY|ShiftMask,             XK_Return, focusonce,      { 0 } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          { 0 } },
	{ MODKEY,                       XK_t,      spawn,          SETPROP("_TABBED_SELECT_TAB") },

	{ MODKEY,             XK_Next,      rotate,         { .i = +1 } },
	{ MODKEY,             XK_Prior,      rotate,         { .i = -1 } },
	{ MODKEY|ShiftMask,             XK_k,      movetab,        { .i = -1 } },
	{ MODKEY|ShiftMask,             XK_j,      movetab,        { .i = +1 } },
	{ MODKEY,                       XK_Tab,    rotate,         { .i = 0 } },

	{ MODKEY,                       XK_ampersand,      move,           { .i = 0 } },
	{ MODKEY,                       XK_eacute,      move,           { .i = 1 } },
	{ MODKEY,                       XK_quotedbl,      move,           { .i = 2 } },
	{ MODKEY,                       XK_apostrophe,      move,           { .i = 3 } },
	{ MODKEY,                       XK_parenleft,      move,           { .i = 4 } },
	{ MODKEY,                       XK_minus,      move,           { .i = 5 } },
	{ MODKEY,                       XK_egrave,      move,           { .i = 6 } },
	{ MODKEY,                       XK_underscore,      move,           { .i = 7 } },
	{ MODKEY,                       XK_ccedilla,      move,           { .i = 8 } },
	{ MODKEY,                       XK_agrave,      move,           { .i = 9 } },

	{ ControlMask,                       XK_w,      killclient,     { 0 } },

	{ 0,                            XK_F11,    fullscreen,     { 0 } },
};

