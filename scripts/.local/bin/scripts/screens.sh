#!/bin/sh

right(){
    xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP1 --off --output DP2 --off --output HDMI1 --off --output HDMI2 --mode 1920x1080 --pos 1928x0 --rotate normal --output VIRTUAL1 --off
}

left() {
    xrandr --output eDP1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output DP1 --off --output DP2 --off --output HDMI1 --off --output HDMI2 --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
}

laptop(){
    xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP1 --off --output DP2 --off --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off
}


choice=$(printf "left to laptop\nright to laptop\nlaptop only\n" | dmenu -p "screen position" -fn 'Iosevka Term:style=Regular:size=12' -nb '#191724' -nf '#e0def4' -sb '#31748f' -sf '#eceff4')

case "$choice" in
    "left to laptop") left ;;
    "right to laptop") right ;;
    "laptop only") laptop ;;
esac
