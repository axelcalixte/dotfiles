//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
    /*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
    {"", "~/dwmblocks/scripts/internet.sh",                                         10, 0},
    {"", "~/dwmblocks/scripts/volume.sh",                                         10, 0},
    {"", "~/dwmblocks/scripts/battery.sh",                                         30, 0},
    {"", "~/dwmblocks/scripts/date_time.sh",                                         60, 0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " ";
static unsigned int delimLen = 5;
