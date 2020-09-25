#!/bin/bash

setxbmap fr & 
xwallpaper --center $HOME/pics/arto-marttinen-pQS0ETF3KTI-unsplash.jpg &
xrdb -merge ~/.config/X11/Xresources &
xautolock -time 10 -corners ---- -locker i3lock &
dunst -conf ~/.config/dunst/dunstrc &
compton -b --config ~/.config/compton/picom.conf &

# Fix Gnome Apps Slow  Start due to failing services
# Add this when you include flatpak in your system
# dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY   
