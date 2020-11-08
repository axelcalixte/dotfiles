#!/bin/sh

choice=$(echo "lock\nsuspend\nlogout\nreboot\npoweroff" | dmenu -fn "DejaVu Sans Mono:size=11" -nb "#eceff4" -nf "#2e3440" -sb "#81a1c1" -sf "#2e3440" )

case "$choice" in
    lock) slock ;;
    suspend) systemctl suspend && slock ;;
    logout) pkill xinit ;;
    reboot | poweroff) systemctl $choice;;
esac
