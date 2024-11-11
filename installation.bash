#! /usr/bin/bash
# Utility functions to help setup my SpiralLinux debian system

function update_system {
    sudo apt update && sudo apt upgrade
}

function cleanup {
    sudo apt autopurge mousepad xterm gdebi synaptic hplip lightdm lightdm-gtk-greeter
}

function install_utils {
    sudo apt install \
        git bash-completion fzf ripgrep nnn fd-find stow

    mkdir -p ~/.cache/bash && touch ~/.cache/bash/history
}

function download_dotfiles {
    git clone git@github.com/axelcalixte/dotfiles.git ~/.dots
    cd ~/.dots || echo "couldn't cd to ~/.dots" && exit
    stow bash
}

function configure_gcadapter {
    echo 'SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="057e", ATTRS{idProduct}=="0337", MODE="0666"' | sudo tee /etc/udev/rules.d/51-gcadapters.rules > /dev/null

    sudo udevadm control --reload-rules
}

## For dev tools and dependencies, or trying stuff out
function install_distrobox {
    sudo apt install podman
    curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sudo sh

    # distrobox create -n toolbx --image docker.io/library/debian:stable

    # print "inside debian toolbox:\n \
    # 'sudo apt install distrobox locales fzf zsh-syntax-highlighting zsh-autosuggestions git build-essential stow nnn ripgrep fd-find' \
    # 'sudo dpkg-reconfigure locales' to keep fr_FR and en_US UTF-8 \
    # 'export LANG=fr_FR.UTF-8' to have ls be good"
}

function install_fnm {
    mkdir -p $HOME/.local/bin
    curl -fsSL https://fnm.vercel.app/install | bash -s -- --install-dir "$HOME/.local/bin" --skip-shell
}

function install_kitty {
    mkdir -p $HOME/.local/dev
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin dest="$HOME/.local/dev"
}

function install_desktop {
    sudo apt install gnome-core \
        gnome-tweaks gnome-shell-extension-manager gnome-shell-extension-prefs \
        gnome-calendar \
        evolution \
        seahorse \
        gnome-software-plugin-flatpak \
        gnome-shell-extension-caffeine \
        gnome-shell-extension-gpaste \
        switcheroo-control \
        mesa-vulkan-drivers \
        keepassxc
}

function install_flatpaks {
    flatpak install -y \
        com.obsproject.Studio \
        org.gnome.World.PikaBackup \
        org.signal.Signal \
        org.zim_wiki.Zim \
        com.microsoft.Edge \
        org.mozilla.Thunderbird \
        org.gimp.GIMP \
        org.telegram.desktop \
        org.gnome.clocks \
        com.github.tchx84.Flatseal \
        com.valvesoftware.Steam \
        org.libreoffice.LibreOffice
}

function gnome_settings {
    dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:swapescape']"
    dconf write /org/gnome/desktop/peripherals/mouse/accel-profile 'flat'
    dconf write /org/gnome/mutter/center-new-windows true
    dconf write /org/gnome/desktop/search-providers/disabled ['org.gnome.Software.desktop']
    dconf write /org/gnome/desktop/privacy/remove-old-temp-files true
    dconf write /org/gnome/settings-daemon/plugins/color/night-light-enabled true
    dconf write /org/gnome/settings-daemon/plugins/color/night-light-temperature uint32 4240
    dconf write /org/gnome/desktop/interface/locate-pointer true
    dconf write /org/gnome/desktop/search-providers/disabled ['org.gnome.Software.desktop']

    dconf write /org/gnome/shell/keybindings/show-screenshot-ui ['<Shift><Super>s']
    dconf write /org/gnome/desktop/wm/keybindings/toggle-fullscreen ['<Super>F11']
    dconf write /org/gnome/settings-daemon/plugins/media-keys/home ['<Super>e']
    dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings ['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']
    dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding '<Super>Return'
    dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/command 'gnome-terminal'
    dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/name 'Terminal'
}

function setup_fonts {
    fonts_dir="~/.local/share/fonts"
    mkdir -p "$fonts_dir"

    curl -LO https://github.com/rsms/inter/releases/download/v4.0/Inter-4.0.zip > "$fonts_dir"/Inter-4.0.zip
    unzip "$fonts_dir"/Inter-4.0.zip
    mkdir "$fonts_dir"/Inter && mv "$fonts_dir"/extras/ttf/Inter* "$fonts_dir"/Inter
    rm -rf "$fonts_dir"/extras "$fonts_dir"/web "$fonts_dir"/help.txt "$fonts_dir"/Inter-4.0.zip "$fonts_dir"/Inter.ttc "$fonts_dir"/*.ttf "$fonts_dir"/LICENSE.txt

    curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/NerdFontsSymbolsOnly.zip > "$fonts_dir"/NerdFontsSymbolsOnly.zip
    unzip "$fonts_dir"/NerdFontsSymbolsOnly.zip -d "$fonts_dir"/NerdFontsSymbolsOnly

    fc-cache -fv
    dconf write /org/gnome/desktop/interface/font-name 'Inter 11'
    dconf write /org/gnome/desktop/interface/document-font-name 'Inter  11'
    dconf write /org/gnome/desktop/wm/preferences/titlebar-font 'Inter Bold 11'
    dconf write /org/gnome/desktop/interface/monospace-font-name 'DejaVu Sans Mono 11'
}


possible_steps="update_system
cleanup
install_desktop
install_flatpaks
install_utils
install_fnm
install_kitty
get_dotfiles
install_distrobox
configure_gcadapter
gnome_settings
setup_fonts
"

case "$1" in
    "update_system") update_system ;;
    "cleanup") cleanup ;;
    "install_desktop") install_desktop ;;
    "install_flatpaks") install_flatpaks ;;
    "install_utils") install_utils ;;
    "install_fnm") install_fnm ;;
    "install_kitty") install_kitty ;;
    "get_dotfiles") download_dotfiles ;;
    "install_distrobox") install_distrobox ;;
    "configure_gcadapter") configure_gcadapter ;;
    "gnome_settings") gnome_settings ;;
    "setup_fonts") setup_fonts ;;

    *) printf "possible arguments are:\n%s" "$possible_steps";;
esac
