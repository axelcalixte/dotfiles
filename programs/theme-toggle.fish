#!/usr/bin/env fish
# works through a distrobox container !

dpkg -s ddcutil > /dev/null 2>&1
if test $status -eq 1
    sudo apt install ddcutil
    sudo udevadm control --reload-rules && sudo udevadm trigger
end

gsettings set org.gnome.system.location enabled true

gdbus call --session \
 --dest org.gnome.Shell.Extensions \
 --object-path /org/gnome/Shell/Extensions \
 --method org.gnome.Shell.Extensions.InstallRemoteExtension \
 nightthemeswitcher@romainvigier.fr

dconf write /org/gnome/shell/extensions/nightthemeswitcher/time/manual-schedule 'false'

dconf write /org/gnome/shell/extensions/nightthemeswitcher/commands/enabled 'true'
dconf write /org/gnome/shell/extensions/nightthemeswitcher/commands/sunrise "'sh -c \'ddcutil setvcp 10 50\''"
dconf write /org/gnome/shell/extensions/nightthemeswitcher/commands/sunset "'sh -c \'ddcutil setvcp 10 0\''"

# Then individual cli programs that do not support what kitty / ghostty / neovim support can be scripted below
# ...
