#!/bin/bash

nitrogen --restore &
xautolock -time 10 -locker slock -corners ---- &
dunst -conf ~/.config/dunst/dunstrc &
picom -b --config ~/.config/picom/picom.conf &

# Fix Gnome Apps Slow  Start due to failing services
# Add this when you include flatpak in your system
# autorun = ws[1]:dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY   

/usr/bin/gnome-keyring-daemon --start --components=ssh &
/usr/bin/gnome-keyring-daemon --start --components=secrets &
