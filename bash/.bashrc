### LIGHTENED DEFAULT CONFIG
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# ch[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR"/bash_completion  # This loads nvm bash_completioneck the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

### MY CONFIG
function projects {
	cd $(find ~/projects/ -maxdepth 2 | fzf)
}

function gco {
	git switch $(git branch 2> /dev/null | fzf) 2> /dev/null
}

set -o vi
stty -ixon # stupid ctrl-s freeze

alias website_update="rsync -uvrP --delete-after ~/docs/projects/website/ axel@azure:/srv/www/axelcalixte.fr"
alias syncftp="ssh -L 42373:localhost:42373 rpi"
alias aptcount="apt list --installed | wc -l"
alias mkdir='mkdir -pv'
alias rm='rm -I'
alias ll="ls -gAh --color --group-directories-first"
alias la="ls -gAh --color --group-directories-first"
alias lc="ls -lA | wc -l"
alias sp='systemctl poweroff'
alias ss='systemctl suspend'
alias sr='systemctl reboot'
alias g="git"
alias nnn="nnn -HC -a -P preview-tui"
[ -n "$(which nvim)" ] && alias vi=nvim

[ -n $(which fnm) ] && eval "$(fnm env)"
[ -n "$(which fzf)" ] && source "/usr/share/doc/fzf/examples/key-bindings.bash"
# [ -n $(which uv) ] && eval "$(uv generate-shell-completion-bash)"
# [ -n $(which uvx) ] && eval "$(uvx --generate-shell-completion-bash)"
# [ $(which ng) ] && source <(ng completion script)
# [ -s "$DENO_INSTALL/env" ] && source "$DENO_INSTALL"/env

eval "$(starship init bash)"
