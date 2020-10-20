setxkbmap fr latin9 &
dunst -conf ~/.config/dunst/dunstrc &
xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &
redshift -l 48.9:2.3 -t 6500:4200 -g 0.8 -m randr -v &
slstatus &
nitrogen --restore &
exec dwm
