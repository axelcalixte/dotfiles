#Default programs
export EDITOR='vim'
export TERMINAL='st'
export BROWSER='firefox-esr'
export READER='zathura'

# ~/ Clean-up:
export XDG_CONFIG_HOME='/home/axel/.config'
export XDG_DATA_HOME='/home/axel/.local/share'
export XDG_CACHE_HOME='/home/axel/.cache'
export NOTMUCH_CONFIG='XDG_CONFIG_HOME:-$HOME/.config/notmuch-config'
export GTK2_RC_FILES='XDG_CONFIG_HOME:-$HOME/.config/gtk-2.0/gtkrc-2.0'
export LESSHISTFILE='-'
export WGETRC='$XDG_CONFIG_HOME/wget/wgetrc'
export INPUTRC='$XDG_CONFIG_HOME/inputrc'
export ZDOTDIR='$XDG_CONFIG_HOME/zsh'
#export ALSA_CONFIG_PATH='$XDG_CONFIG_HOME/alsa/asoundrc'
export WINEPREFIX='$XDG_DATA_HOME/wineprefixes/default'
export PASSWORD_STORE_DIR='$XDG_DATA_HOME/pass'
export GNUPGHOME='~/.local/share/gnupg'
export ANDROID_SDK_HOME='$XDG_CONFIG_HOME/android'
export CARGO_HOME='$XDG_DATA_HOME/cargo'
export GOPATH='$XDG_DATA_HOME/go'
export ANSIBLE_CONFIG='$XDG_CONFIG_HOME/ansible/ansible.cfg'
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot='$XDG_CONFIG_HOME/java'

# Application configs
export _JAVA_AWT_WM_NONREPARENTING=1
export NNN_TRASH='1'
export NNN_COLORS='2136'

# Start X at login
[ "$(tty)" = "/dev/tty1" ] && ! ps -e | grep -qw Xorg && exec startx
