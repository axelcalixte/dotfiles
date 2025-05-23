#! /usr/bin/bash
# Utility functions to help setup my SpiralLinux debian system

function update_system {
    sudo apt update -y && sudo apt upgrade -y
}

# everything cli-related
function install_utils {
    sudo apt install \
        ani-cli \
        bash-completion \
        borgbackup \
        curl \
        fd-find \
        fish \
        fzf \
        git \
        hx \
        kitty \
        libfuse2t64 \
        libopengl0 \
        libssl-dev \
        ncdu \
        nnn \
        pkg-config \
        ripgrep \
        rsync \
        rustup \
        stow \
        tig \
        trash-cli \
        vis

    mkdir -p ~/.cache/bash && touch ~/.cache/bash/history
}

function download_dotfiles {
    git clone git@github.com/axelcalixte/dotfiles.git ~/.dots
    cd ~/.dots || echo "couldn't cd to ~/.dots" && exit
    stow bash
}

function install_neovim {
	sudo apt-get install ninja-build gettext cmake curl build-essential libnsl-dev
	mkdir -pv /home/axel/.local/dev
	git clone https://github.com/neovim/neovim /home/axel/.local/dev/neovim
	cd /home/axel/.local/dev/neovim
	git checkout v0.$(git tag -l | cut -d'.' -f2- | sort -g -r | head -1) # will work as long as nvim hasn't reached 1.X.Y version.
	make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=$HOME/.local install
}

function configure_gcadapter {
    echo 'SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="057e", ATTRS{idProduct}=="0337", MODE="0666"' | sudo tee /etc/udev/rules.d/51-gcadapters.rules > /dev/null

    sudo udevadm control --reload-rules
}

## For dev tools and dependencies, or trying stuff out
function install_distrobox {
    sudo apt install distrobox --no-install-recommends
    distrobox create -n toolbx --image docker.io/library/debian:trixie
}

function install_fnm {
    mkdir -p $HOME/.local/bin
    curl -fsSL https://fnm.vercel.app/install | bash -s -- --install-dir "$HOME/.local/bin" --skip-shell
}

function install_uv {
    mkdir -p $HOME/.local/bin
    curl -LsSf https://astral.sh/uv/install.sh | env INSTALLER_NO_MODIFY_PATH=1 UV_INSTALL_DIR="$HOME/.local/bin" sh
}

# everything gui-related
function install_desktop {
    sudo apt install gnome-core \
        gnome-tweaks gnome-shell-extension-manager gnome-shell-extension-prefs \
        gnome-calendar \
        seahorse \
        flatpak \
        gnome-software-plugin-flatpak \
        gnome-shell-extension-caffeine \
        gnome-shell-extension-gpaste \
        switcheroo-control \
        mesa-vulkan-drivers \
        keepassxc \
        syncthing \
        zim
}

function install_flatpaks {
    flatpak install -y \
        com.obsproject.Studio \
        org.gnome.World.PikaBackup \
        org.signal.Signal \
        com.microsoft.Edge \
        org.mozilla.Thunderbird \
        org.gimp.GIMP \
        org.telegram.desktop \
        com.github.tchx84.Flatseal \
        com.valvesoftware.Steam \
        org.libreoffice.LibreOffice \
        com.discordapp.Discord
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

possible_steps="update_system
install_desktop
install_flatpaks
install_utils
install_fnm
install_uv
install_neovim
get_dotfiles
install_distrobox
configure_gcadapter
gnome_settings
"

case "$1" in
    "update_system") update_system ;;
    "install_desktop") install_desktop ;;
    "install_flatpaks") install_flatpaks ;;
    "install_utils") install_utils ;;
    "install_fnm") install_fnm ;;
    "install_uv") install_uv ;;
    "install_neovim") install_neovim ;;
    "get_dotfiles") download_dotfiles ;;
    "install_distrobox") install_distrobox ;;
    "configure_gcadapter") configure_gcadapter ;;
    "gnome_settings") gnome_settings ;;

    *) printf "possible arguments are:\n%s" "$possible_steps";;
esac
