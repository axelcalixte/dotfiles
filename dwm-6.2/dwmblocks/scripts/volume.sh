#!/bin/sh

[ $(pamixer --get-mute) = true ] && echo X && exit

vol="$(pamixer --get-volume)"

if [ "$vol" -gt "70" ]; then
	icon=" "
elif [ "$vol" -lt "30" ]; then
	icon=""
else
	icon=" "
fi

if [ $(amixer scontents | grep -m 1 -o off) ]; then
	mic=" "
else
	mic=" "
fi

echo "$icon$vol% $mic"
