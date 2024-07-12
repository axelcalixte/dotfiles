#! /usr/bin/bash
# Utility functions to help setup my SpiralLinux debian system

function update_system {
    sudo apt update && sudo apt upgrade
}

function cleanup {
    sudo apt autopurge mousepad gdebi synaptic hplip lightdm lightdm-gtk-greeter
}

function install_utils {
    sudo apt install \
        git stow zsh zsh-syntax-highlighting zsh-autosuggestions fzf nnn

    mkdir -p ~/.cache/zsh && touch ~/.cache/zsh/history
}

function download_dotfiles {
    git clone git@github.com/axelcalixte/dotfiles.git ~/.dots
    cd ~/.dots || echo "couldn't cd to ~/.dots" && exit
    stow zsh
}

function configure_gcadapter {
    echo 'SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="057e", ATTRS{idProduct}=="0337", MODE="0666"' | sudo tee /etc/udev/rules.d/51-gcadapters.rules > /dev/null

    sudo udevadm control --reload-rules
}

## For dev tools and dependencies, or trying stuff out
function install_distrobox {
    sudo apt install distrobox rootlesskit
    distrobox create -n toolbx --image docker.io/library/debian:stable

    print "inside debian toolbox:\n \
    'sudo apt install distrobox locales' \
    'sudo dpkg-reconfigure locales' to keep fr_FR and en_US UTF-8 \
    'export LANG=fr_FR.UTF-8' to have ls be good"
}

function install_fnm {
    mkdir -p ~/.local/dev
    curl -fsSL https://fnm.vercel.app/install | bash -s -- --install-dir "./.local/dev/fnm" --skip-shell
}

function install_desktop {
    sudo apt install gnome-core \
        gnome-tweaks gnome-shell-extension-manager gnome-shell-extension-prefs \
        gnome-calendar \
        evolution \
        seahorse \
        gnome-software-plugin-flatpak \
        gnome-shell-extension-caffeine \
        switcheroo-control \
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
        org.gimp.GIMP
}


possible_steps="update_system\ncleanup\ninstall_desktop\ninstall_flatpaks\ninstall_utils\nget_dotfiles\ninstall_distrobox\nconfigure_gcadapter"

case "$1" in
    "update_system") update_system ;;
    "cleanup") cleanup ;;
    "install_desktop") install_desktop ;;
    "install_flatpaks") install_flatpaks ;;
    "install_utils") install_utils ;;
    "get_dotfiles") get_dotfiles ;;
    "install_distrobox") install_distrobox ;;
    "configure_gcadapter") configure_gcadapter ;;

    *) printf "possible arguments are:\n%s" "$possible_steps";;
esac
