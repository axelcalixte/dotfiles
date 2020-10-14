#!/bin/sh

choice=$(echo "lock\nlogout\nreboot\npoweroff" | dmenu)

case "$choice" in
	lock) slock ;;
    logout) pkill xinit ;;
    reboot | poweroff) systemctl $choice;;
esac
