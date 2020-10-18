setxkbmap fr latin9 &
xautolock -time 10 -corners ---- -locker slock &
dunst -conf ~/.config/dunst/dunstrc &
xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &
dwmblocks &
nitrogen --restore &
exec dwm
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
