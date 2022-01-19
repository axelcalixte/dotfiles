#!/bin/sh

choice=$(printf "lock\nsuspend\nlogout\nreboot\npoweroff" | dmenu -fn 'Iosevka Term:style=Regular:size=13' -nb '#1F1F28' -nf '#DCD7BA' -sb '#223249' -sf '#DCD7BA')

case "$choice" in
    lock) slock ;;
    suspend) systemctl suspend && slock ;;
    logout) pkill "$(wmctrl -m | grep Name | awk '{print $2}')" ;;
    reboot | poweroff) systemctl "$choice";;
esac
