#!/bin/sh

#xrandr --output HDMI2 --auto --same-as eDP1 --mode 1920x1080
#xrandr --output HDMI2 --auto --right-of eDP1
#xrandr --output HDMI2 --auto --left-of eDP1

xrandr --output eDP1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output DP1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP2 --off --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off

notify-send "Secondary screen setup changed : ok."
