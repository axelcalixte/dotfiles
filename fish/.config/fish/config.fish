#Default programs
set PATH /home/axel/.local/bin $PATH
set -x EDITOR nvim
set -x PAGER less
set -x TERMINAL xfce4-terminal
set -x BROWSER firefox
set -x READER xreader

# ~/ Clean-up:
set -x XDG_CONFIG_HOME /home/axel/.config
set -x XDG_DATA_HOME /home/axel/.local/share
set -x XDG_CACHE_HOME /home/axel/.cache
set -x XINITRC /home/axel/.config/X11/xinitrc
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
set -x ICEAUTHORITY /home/axel/.cache/Iceauthority
set -x ANSIBLE_CONFIG /home/axel/.config/ansible/ansible.cfg
set -x _JAVA_OPTIONS -Djava.util.prefs.userRoot /home/axel/.config/java
set -x QT_SCALE_FACTOR 1.2
set -x QT_AUTO_SCREEN_SCALE_FACTOR 1.2

# Application configs
set -x _JAVA_AWT_WM_NONREPARENTING 1
set -x NNN_TRASH 1
set -x NNN_COLORS 2136
#set -x NNN_BMS='s:~/.local/share;c:~/.config;u:~/utt'
#set -x NNN_ARCHIVE='\\.(7z|bz2|gz|tar|tgz|zip)$'
#set -x NNN_PLUG='t:nmount'

# Abbreviations
abbr vi 'nvim'
abbr sr 'systemctl reboot'
abbr sp 'systemctl poweroff'
abbr ss 'systemctl suspend'
abbr stencyl '~/.local/share/Stencyl-4.0.2-linux/Stencyl'
abbr mkdir 'mkdir -pv'
# alias ls'ls -lhA --color --group-directories-first'
abbr ls 'exa -la --group-directories-first'
abbr g 'git'
abbr gs 'git status'
abbr gcm 'git commit -m'
abbr gau 'git add -u'
abbr ga 'git add'
abbr gps 'git push'
abbr gpl 'git pull'


