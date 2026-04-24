#!/usr/bin/env bash

install_packages() {
    apt install --no-install-recommends \
        mesa-vulkan-drivers \
        intel-gpu-tools \
        git tig \
        curl stow unzip \
        flatpak gnome-software-plugin-flatpak \
        keepassxc \
        zim \
        vis lua-lpeg \
	ncdu \
        fish \
	nnn \
        adwaita-qt qgnomeplatform-qt5 adwaita-qt6 qgnomeplatform-qt6 \
	ripgrep fd-find fzf rsync \
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
        it.mijorus.gearlever \
	com.nextcloud.desktopclient.nextcloud \
	org.qbittorrent.qBittorrent \
}

function configure_gcadapter {
    echo "SUBSYSTEM==\"usb\", ENV{DEVTYPE}==\"usb_device\", ATTRS{idVendor}==\"057e\", ATTRS{idProduct}==\"0337\", MODE=\"0666\"" | sudo tee /etc/udev/rules.d/51-gcadapter.rules
    echo "SUBSYSTEM==\"usb\", ENV{DEVTYPE}==\"usb_device\", ATTRS{idVendor}==\"2e8a\", ATTRS{idProduct}==\"102b\", MODE=\"0666\"" | sudo tee /etc/udev/rules.d/51-losslessadapter.rules

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


#install_appimages() {
# p+fr appimage
# slippi launcher
# helium browser (check for hardware acceleration)
# appimage manager or gearlever...
#}

main() {
    install_packages
    install_flatpaks
    change_gnome_settings
    configure_gcadapter
    gnome_online_accounts
    install_fonts
}

main
