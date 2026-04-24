#!/usr/bin/env fish
# Dependencies curl, stow

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin \
    launch=n dest=~/.local/stow

cd ~/.local/stow
stow -v kitty.app
