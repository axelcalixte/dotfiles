#!/bin/bash

languages=$(echo "lua c cpp python java javascript" | tr ' ' '\n')
core_utils=$(echo "grep sed find" | tr ' ' '\n')

selected=$(printf "%s\n%s" "$languages" "$core_utils" | fzf)
read -rp "query: " query 

if printf "%s" "$languages" | grep -qs "$selected"; then
     kitty @ launch --type tab --title cheat.sh --self --hold \
         curl -s cht.sh/"$selected"/"$(echo "$query" | tr ' ' '+')"
else
     kitty @ launch --type tab --title cheat.sh --self --hold \
    curl -s cht.sh/"$selected"~"$query"
fi


