#!/bin/sh

net(){
	case "$(cat /sys/class/net/w*/operstate 2>/dev/null)" in
	down) wifiicon="" ;;
	up) wifiicon="$(awk '/^\s*w/ { print "", int($3 * 100 / 70) "%" }' /proc/net/wireless)" ;;
	esac

printf "%s%s\n" " $wifiicon" "$(sed "s/down/  /;s/up/  /" /sys/class/net/e*/operstate 2>/dev/null)"
}

volume(){

[ $(pamixer --get-mute) = true ] && echo X && exit

vol="$(pamixer --get-volume)"

if [ "$vol" -gt "70" ]; then
	icon=""
elif [ "$vol" -lt "30" ]; then
	icon=""
else
	icon=""
fi

echo " $icon $vol%"
}

mic(){
if [ $(amixer scontents | grep -m 1 -o off) ]; then
	mic=" "
else
	mic=""
fi
echo " $mic "
}

battery(){
for battery in /sys/class/power_supply/BAT?
do
	# Get its remaining capacity and charge status.
	capacity=$(cat "$battery"/capacity 2>/dev/null) || break
	status=$(sed "s/[Dd]ischarging/  /;s/[Nn]ot charging/ /;s/[Cc]harging/  /;s/[Uu]nknown/  /;s/[Ff]ull/  /" "$battery"/status)

	# If it is discharging and 20% or less, we will add a  as a warning.
	 [ "$capacity" -le 20 ] && [ "$status" = "  " ] && warn=" "

	printf "%s%s%s%% " "$status" "$warn" "$capacity "
	unset warn
done | sed 's/ *$//'
}

dte(){
	hm=$(date +%R)
	cal=$(date +%x)
	echo "  $hm |  $cal "
}

xsetroot -name "$(net)|$(volume)$(mic)|$(battery)|$(dte)"
