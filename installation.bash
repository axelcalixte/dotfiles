#!/bin/bash

install_packages() {
    apt install --no-install-recommends \
        mesa-vulkan-drivers \
        git \
        curl \
        flatpak gnome-software-plugin-flatpak \
        keepassxc \
        zim \
        vis lua-lpeg \
        stow \
        intel-gpu-tools \
        adwaita-qt qgnomeplatform-qt5 adwaita-qt6 qgnomeplatform-qt6 \
        rsync \
# gnome-shell-extension-manager gnome-shell-extension-prefs \

        flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
}

install_flatpaks() {
    flatpak --user install -y \
        com.valvesoftware.Steam \
        com.obsproject.Studio \
        com.github.tchx84.Flatseal \
        it.mijorus.gearlever \
        org.gnome.World.PikaBackup \
        com.discordapp.Discord \
        org.signal.Signal \
        org.telegram.desktop \
        com.github.PintaProject.Pinta \
        com.github.tchx84.Flatseal \
        com.vixalien.sticky \
        org.gnome.gitlab.YaLTeR.VideoTrimmer \
        it.mijorus.gearlever
}

function configure_gcadapter {
    echo 'SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="057e", ATTRS{idProduct}
=="0337", MODE="0666"' | sudo tee /etc/udev/rules.d/51-gcadapters.rules > /dev/null
    echo 'SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="2e8a", ATTRS{idProduct}=="102b", MODE="0666"' | sudo tee /etc/udev/rules.d/51-losslessadapters.rules > /dev/null

    sudo udevadm control --reload-rules
}

change_gnome_settings() {
    declare -A settings=(\
        ["/org/gnome/desktop/input-sources/xkb-options"]="['caps:swapescape']" \
        ["/org/gnome/shell/app-switcher/current-workspace-only"]="true" \
        ["/org/gnome/desktop/peripherals/mouse/accel-profile"]="'flat'" \
        ["/org/gnome/desktop/sound/event-sounds"]="false" \
        ["/org/gnome/settings-daemon/plugins/color/night-light-enabled"]="true" \
#	    ["/org/gnome/settings-daemon/plugins/color/night-light-temperature"]="'uint32 3200'" \
        ["/org/gnome/desktop/interface/locate-pointer"]="true" \
        ["/org/gnome/desktop/wm/keybindings/toggle-fullscreen"]="['<Super>F11']" \
#	    ["/org/gnome/shell/favorite-apps"]="['org.gnome.Terminal.desktop', 'firefox-esr.desktop']" \
        ["/org/gnome/settings-daemon/plugins/media-keys/home"]="['<Super>e']" \
        ["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"]="['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']" \
        ["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding"]="['<Super>Return']" \
        # this doesn't work for reasons... manual step required
        ["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/command"]="'gnome-terminal'" \
        ["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/name"]="'Terminal'" \
    )

    for setting in "${!settings[@]}"; do
        echo $setting
        dconf write $setting ${settings[$setting]}
    done

}

gnome_online_accounts() {
    goa_dir="${HOME}/.config/goa-1.0"
    if [ ! -d "$goa_dir" ]; then
        mkdir -pv "$goa_dir"
    fi
    
    echo "[Account account_1752676242_2]
Provider=owncloud
Identity=axel
PresentationIdentity=axel@rpi.remi.calixte.eu
Uri=https://rpi.remi.calixte.eu/remote.php/webdav
CalendarEnabled=true
CalDavUri=https://rpi.remi.calixte.eu/remote.php/dav
ContactsEnabled=true
CardDavUri=https://rpi.remi.calixte.eu/remote.php/dav
FilesEnabled=true
AcceptSslErrors=false" > "${goa_dir}/accounts.conf"
}

install_fonts() {
    fonts_dir="${HOME}/.local/share/fonts"
    if [ -d "$fonts_dir" ]; then
        rm -rf "$fonts_dir"
    fi 
    mkdir -pv "$fonts_dir"

    base_tmp="$(pwd)"
    cd "$fonts_dir" || echo "not able to create fonts dir" && exit

    curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/NerdFontsSymbolsOnly.zip
    curl -LO https://github.com/eigilnikolajsen/commit-mono/releases/download/v1.143/CommitMono-1.143.zip
    curl -LO https://download.gnome.org/sources/adwaita-fonts/49/adwaita-fonts-49.0.tar.xz

    find . -name '*.zip' -exec sh -c 'unzip $1' ';'
    rm ./*.zip
    find . -name '*.tar.xz' -exec sh -c 'tar -xf $1' ';'
    rm ./*.tar.xz

    cd "$(base_tmp)" || echo "chouldn't return to base dir when installing fonts" && exit

    fc-cache -fv

    gsettings set org.gnome.desktop.interface font-name "Adwaita Sans 11"
    gsettings set org.gnome.desktop.interface monospace-font-name "CommitMono 11"
}

install_nix() {
# for dev env, dependencies, runtimes etc
sudo apt install nix-setup-systemd

if [ -s "$(getent group nix-users)" ]; then
    sudo usermod -aG nix-users axel
else
    echo "${USER}\C2\A0already belongs to nix-users group"
fi

nix-channel --add https://nixos.org/channels/nixos-25.05 nixpkgs

echo "log out and log in from session, then run :"
echo "nix-channel --update"
# then add nix-profile/bin to PATH in .profile and everything is good !
# nix-env -iA nixpkgs.nnn to install latest nnn !
}

#install_appimages() {
# p+fr appimage
# helium browser (check for hardware acceleration)
#}

#setup_obs() {

# obs-cmd binary and zenity in path
# fish / bash function replay_buffer to display zenity
# obs configured to expose a websocket server

# curl -L https://github.com/grigio/obs-cmd/releases/latest/download/obs-cmd-linux-amd64 -o obs-cmd
#\C2\A0chmod +x obs-cmd
# sudo mv obs-cmd /usr/local/bin/
# or nixpkgs

# Defined in /home/axel/.config/fish/functions/replay-buffer.fish @ line 1
# function replay-buffer 
#    if not command -q obs-cmd; or not command -q zenity
#        exit 1
#    end
#
#    if obs-cmd info &>/dev/null
#        obs-cmd replay (zenity --list  --column "command"  --text (obs-cmd replay status | tail -1) "save" "toggle")
#    end
# end

# gnome shortcut added

#}

main() {
    install_packages
    install_flatpaks
    change_gnome_settings
    configure_gcadapter
    gnome_online_accounts
    install_fonts
    install_nix
}

main
