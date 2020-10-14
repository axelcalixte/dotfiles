#!/bin/sh

case "$(cat /sys/class/net/w*/operstate 2>/dev/null)" in
	down) wifiicon="" ;;
	up) wifiicon="$(awk '/^\s*w/ { print "", int($3 * 100 / 70) "% " }' /proc/net/wireless)" ;;
esac

printf "%s%s\n" "$wifiicon" "$(sed "s/down//;s/up//" /sys/class/net/e*/operstate 2>/dev/null)"
