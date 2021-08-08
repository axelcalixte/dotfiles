#!/bin/sh

choice=$(echo "lock\nsuspend\nlogout\nreboot\npoweroff" | dmenu -fn "DejaVu Sans Mono:size=11")

case "$choice" in
    lock) slock ;;
    suspend) systemctl suspend && slock ;;
    logout) pkill xinit ;;
    reboot | poweroff) systemctl $choice;;
esac
