#!/bin/sh

choice=$(printf "lock\nsuspend\nlogout\nreboot\npoweroff" | dmenu -fn 'Liga SFMono Nerd Font:style=Regular:size=11')

case "$choice" in
    lock) slock ;;
    suspend) systemctl suspend && slock ;;
    logout) pkill "$(wmctrl -m | grep Name | awk '{print $2}')" ;;
    reboot | poweroff) systemctl "$choice";;
esac
