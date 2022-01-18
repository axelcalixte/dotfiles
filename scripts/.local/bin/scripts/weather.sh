#!/bin/bash

## THIS SCRIPT NEEDS AN OPENWEATHERMAP APIKEY
## THIS SCRIPT ALSO USES GEOCLUE's WHERE-AM-I BINARY WHICH MAY BE LOCATED ELSEWHERE ON YOUR SYSTEM

open_url(){
    #grep location from geoclue
    TMPFILE=$(echo 'mkstemp(/tmp/foo-XXXXXX)' | m4)
    timeout 5 /usr/libexec/geoclue-2.0/demos/where-am-i > "$TMPFILE" # you may need to adjust GNU timeout's value

    #grep nearest city from openweathermap api call with gps data of geoclue
    lati=$(grep Lat < "$TMPFILE" | awk '{print $2}' | cut -c-6)
    longi=$(grep Lon < "$TMPFILE" | awk '{print $2}' | cut -c-6)
    id=$(curl "api.openweathermap.org/data/2.5/weather?lat="$lati"&lon="$longi"&appid=APIKEY_HERE" | grep -o 'id":[0-9]*,"n' | grep -o '[0-9]*')

    # You can use the city variable with websites other than openweathermap
    #city=$(curl "api.openweathermap.org/data/2.5/weather?lat="$lati"&lon="$longi"&appid=APIKEY_HERE" | grep -o 'ame":"[A-z-]*' | cut -d'"' -f3)

    xdg-open https://openweathermap.org/city/"$id"
}

ACTION=$(dunstify --action="default,Web" "Current Weather" "$(curl "wttr.in?T0")")

case "$ACTION" in
"default")
    open_url
    ;;
"2")
    exit 1
    ;;
esac
