# THEME PURE #
set fish_function_path /home/axel/.config/fish/functions/theme-pure/functions/ $fish_function_path
source /home/axel/.config/fish/functions/theme-pure/conf.d/pure.fish

#Default programs
set PATH /home/axel/.local/bin $PATH
set -x EDITOR vim
set -x TERMINAL st
set -x BROWSER chromium
set -x READER zathura

# ~/ Clean-up:
set -x XDG_CONFIG_HOME /home/axel/.config
set -x XDG_DATA_HOME /home/axel/.local/share
set -x XDG_CACHE_HOME /home/axel/.cache
set -x NOTMUCH_CONFIG XDG_CONFIG_HOME:-$HOME/.config/notmuch-config
set -x GTK2_RC_FILES XDG_CONFIG_HOME:-$HOME/.config/gtk-2.0/gtkrc-2.0
set -x LESSHISTFILE -
set -x WGETRC /home/axel/.config/wget/wgetrc
set -x INPUTRC /home/axel/.config/inputrc
set -x ZDOTDIR /home/axel/.config/zsh
set -x ALSA_CONFIG_PATH /home/axel/.config/alsa/asoundrc
set -x WINEPREFIX /home/axel/.local/share/wineprefixes/default
set -x PASSWORD_STORE_DIR /home/axel/.local/share/pass
set -x GNUPGHOME /home/axel/.local/share/gnupg
set -x ANDROID_SDK_HOME /home/axel/.config/android
set -x CARGO_HOME /home/axel/.local/share/cargo
set -x GOPATH /home/axel/.local/share/go
set -x ANSIBLE_CONFIG /home/axel/.config/ansible/ansible.cfg
set -x _JAVA_OPTIONS -Djava.util.prefs.userRoot /home/axel/.config/java

# Application configs
set -x _JAVA_AWT_WM_NONREPARENTING 1
set -x NNN_TRASH 1
set -x NNN_COLORS 2136

# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end
