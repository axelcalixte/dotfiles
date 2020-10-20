fpath+=~/.local/share/zsh/pure/
autoload -U promptinit; promptinit
# change the color for both `prompt:success` and `prompt:error`
#zstyle ':prompt:pure:prompt:*' color cyan
# turn on git stash status
PURE_GIT_PULL=1
zstyle :prompt:pure:git:stash show yes
prompt pure

[ "$(tty)" = "/dev/tty1" ] && ! pidof Xorg >/dev/null 2>&1  && exec startx $XDG_CONFIG_HOME/x11/.xinitrc

export PATH="${PATH}:${HOME}/.local/bin"

# The following lines were added by compinstall
autoload -Uz compinit
compinit

zstyle ':completion:*' completer _expand _complete _ignored _match _correct _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' file-sort modification
zstyle ':completion::complete*' gain-privileges 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents pwd directory
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' max-errors 2 numeric
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' substitute 1
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/axel/.config/zsh/.zshrc'

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=/home/axel/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000
setopt autocd completealiases extendedglob nomatch notify
#bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were read by zsh-newuser-install.
# They were moved here as they could not be understood.
# sam. 02 mai 2020 22:00:19 CEST
stty stop undef		# Disable ctrl-s to freeze terminal
# End of lines moved by zsh-newuser-install.

# Aliases
alias syncftp="ssh -L 41127:localhost:41127 axel@rpi.remi.calixte.eu"
alias aptcount="apt list --installed | wc -l"
alias aptcheck="apt list --installed | less"
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
alias gco="git checkout"
alias gps="git push"
alias gpl="git pull"

#fish syntax highlighting
#source /home/axel/.local/share/zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#fish auto-suggestions
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#fzf fuzzy file search
source /usr/share/doc/fzf/examples/key-bindings.zsh

