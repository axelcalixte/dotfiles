#!/bin/bash

nitrogen --restore &
xrdb -merge ~/.config/X11/Xresources &
xautolock -time 10 -corners ---- -locker i3lock &
dunst -conf ~/.config/dunst/dunstrc &
picom -b --config ~/.config/picom/picom.conf &

# Fix Gnome Apps Slow  Start due to failing services
# Add this when you include flatpak in your system
# dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY   
