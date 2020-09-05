#!/bin/sh

screenshot() {
	case $1 in
	select-clip)
		sleep 0.2
		scrot -s '/tmp/%F_%T_$wx$h.png' -e 'xclip -selection clipboard -target image/png -i $f'
		;;
	select-save)
		sleep 0.2
		scrot -s 'scrot-%d-%m-%Y_%R_$wx$h.png' -e 'mv $f ~/pics/ ; sxiv ~/pics/$f'
		;;
	*)
		;;
	esac;
}

screenshot $1
