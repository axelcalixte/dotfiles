#!/bin/sh

xrandr --output HDMI2 --auto --same-as eDP1 --mode 1920x1080
#xrandr --output HDMI2 --auto --right-of eDP1
xrandr --output HDMI2 --auto --left-of eDP1

notify-send "Secondary screen setup changed : ok."
