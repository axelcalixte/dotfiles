#!/bin/sh

choice=$(echo "suspend\nlogout\nreboot\npoweroff" | dmenu)

case "$choice" in
	suspend) systemctl suspend && slock ;;
    logout) pkill xinit ;;
    reboot | poweroff) systemctl $choice;;
esac