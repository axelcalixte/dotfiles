nitrogen --restore &
aslstatus &
dunst -c ~/.config/dunst/dunstrc &
picom --experimental-backends --config /home/axel/.config/picom/picom.conf &
xrdb -merge /home/axel/.config/x11/.Xresources &
xautolock -time 15 -locker ~/.local/bin/scripts/locker.sh &
redshift -l 48.86:2.35 &

exec dwm
