#!/bin/sh

#dmenu=$(dmenu -fn "monospace:size=10" -nb "#212733" -nf "#cbccc6" -sb "#ffcc66" -sf "#212733")
choice=$(echo "lock\nsuspend\nlogout\nreboot\npoweroff" | dmenu -fn "monospace:size=10" -nb "#212733" -nf "#cbccc6" -sb "#ffcc66" -sf "#212733")

case "$choice" in
    lock) slock ;;
    suspend) systemctl suspend && slock ;;
    logout) pkill xinit ;;
    reboot | poweroff) systemctl $choice;;
esac
