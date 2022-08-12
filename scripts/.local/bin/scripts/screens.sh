#!/bin/sh
# On my computer I have 3 possible outputs eDP1 (my laptop's display) and HDMI2 or DP1
# I never try to connect two additionnal screens at the same time.

right(){
  xrandr --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal \
         --output "$1" --primary --mode 1920x1080 --rate 74.97 --pos 1928x0 --rotate normal
}

left() {
  xrandr --output eDP1 --mode 1920x1080 --pos 1920x0 --rotate normal \
         --output "$1" --primary --mode 1920x1080 --rate 74.97 --pos 0x0 --rotate normal
}

monitor(){
  xrandr --output eDP1 --off \
         --output "$1" --primary --mode 1920x1080 --rate 74.97 --pos 0x0 --rotate normal
  setxkbmap -option caps:swapescape
}

if ! xrandr | grep -E "^(DP1|HDMI2) connected" > /dev/null ; then
  notify-send "no external monitor detected" "only eDP1 is configured as output"
  xrandr --output eDP1 --primary --auto \
         --output DP1 --off \
         --output HDMI2 --off
  exit 1
fi

# If I have both HDMI and DP then DP is used thanks to head
# Again, I'm only using one external monitor at the same time
output="$(xrandr | grep -E "^(HDMI2|DP1) connected" | cut -d" " -f1 | head -1)"

choice=$(printf "left to laptop\nright to laptop\nmonitor only\n" | dmenu -p "screen position" -fn 'Liga SFMono Nerd Font:style=Regular:size=11')

case "$choice" in
    "left to laptop") left "$output";;
    "right to laptop") right "$output";;
    "monitor only") monitor "$output" ;;
esac
