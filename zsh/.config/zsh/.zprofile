export EDITOR="nvim"
export PAGER="less"
export TERMINAL="kitty"
export READER="less"

# ~/ Clean-up:
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export HISTFILE="$XDG_CACHE_HOME/bash/history"
#export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export NOTMUCH_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/notmuch-config"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export LESSHISTFILE="-"
export GPG_TTY=$(tty)
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/inputrc"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
#export ALSA_CONFIG_PATH="$XDG_CONFIG_HOME/alsa/asoundrc"
export WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/wineprefixes/default"
export PASSWORD_STORE_DIR="$HOME/sync/pass"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export ADB_VENDOR_KEY="$XDG_CONFIG_HOME/android"
export ANDROID_AVD_HOME="$XDG_DATA_HOME/android/"
export ANDROID_EMULATOR_HOME="$XDG_DATA_HOME/android/"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export ANSIBLE_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/ansible/ansible.cfg"
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
#export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export ICEAUTHORITY="$XDG_CACHE_HOME"/Iceauthority
#export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export QT_SCALE_FACTOR=1.10
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_QPA_PLATFORMTHEME='gtk2'
#export GDK_SCALE=2
export SFEED_URL_FILE="$XDG_CONFIG_HOME/sfeed/read"

# Application configs
export _JAVA_AWT_WM_NONREPARENTING=1
export NNN_TRASH=1
export NNN_COLORS="3246"
export NNN_ARCHIVE="\\.(7z|bz2|gz|tar|tgz|zip)$"
export NNN_PLUG='m:nmount;a:mtpmount;p:preview-tui'
export NNN_BMS='u:~/utt;v:~/.config/nvim;p:~/utt/lo02/projet;s:~/.local/suckless'
export NNN_FIFO=/tmp/nnn.fifo

eval "$(keychain -q --absolute --dir "$XDG_RUNTIME_DIR"/keychain --eval --agents ssh,gpg id_rsa --noask)" # not if using keepass or gcr
