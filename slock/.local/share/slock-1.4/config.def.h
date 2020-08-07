/* user and group to drop privileges to */
static const char *user  = "nobody";
static const char *group = "nogroup";

static const char *colorname[NUMCOLS] = {
	[INIT]   =  "#2e3440",     /* after initialization black was the default to have a non lit display as much as possible*/
	[INPUT]  =  "#a3be8c",   /* during input */
	[FAILED] =  "#d08770",   /* wrong password */
	[CAPS]   =  "#bf616a",       /* CapsLock on */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;

/* time in seconds before the monitor shuts down */
static const int monitortime = 5;
