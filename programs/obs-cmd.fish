#!/usr/bin/env fish
# Dependencies curl, tar, stow

# Download and extract the appropriate binary for your system
curl -L https://github.com/grigio/obs-cmd/releases/latest/download/obs-cmd-x64-linux.tar.gz | tar xz
chmod +x obs-cmd

mkdir -pv ~/.local/stow/obs-cmd/bin/

mv obs-cmd ~/.local/stow/obs-cmd/bin/

cd ~/.local/stow
stow -v obs-cmd

# TODO: properly add a GNOME shortcut