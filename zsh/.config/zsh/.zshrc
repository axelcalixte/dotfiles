fpath+=~/.local/share/zsh/pure/
autoload -U promptinit; promptinit
# change the color for both `prompt:success` and `prompt:error`
#zstyle ':prompt:pure:prompt:*' color cyan
# turn on git stash status
PURE_GIT_PULL=1
zstyle :prompt:pure:git:stash show yes
prompt pure

[ "$(tty)" = "/dev/tty1" ] && ! pidof Xorg >/dev/null 2>&1  && exec startx $XDG_CONFIG_HOME/x11/.xinitrc

export PATH="${PATH}:${HOME}/.local/bin:${HOME}/.local/bin/scripts"

# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh/history
HISTSIZE=5000
SAVEHIST=10000
setopt autocd
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/axel/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Aliases
alias syncftp="ssh -L 41127:localhost:41127 axel@rpi.remi.calixte.eu"
alias aptcount="apt list --installed | wc -l"
alias backup="rsync -a --delete --verbose -e ssh /home/axel/ axel@creney:~/Storage/debian"
alias mkdir='mkdir -pv'
alias ll="ls -lhAF --color --group-directories-first"
alias lc="ls -lA | wc -l"
alias sp='systemctl poweroff'
alias ss='systemctl suspend'
alias sr='systemctl reboot'
alias g="git"
alias gs="git status"
alias gcm="git commit -m"
alias gau="git add -u"
alias ga="git add"
alias gco="git checkout --"
alias gps="git push"
alias gpl="git pull"
alias t="todo-txt"


#fzf fuzzy file search
source /usr/share/doc/fzf/examples/key-bindings.zsh
