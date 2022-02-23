# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="${PATH}:${HOME}/.local/bin:${HOME}/.local/bin/scripts:${XDG_DATA_HOME}/npm/bin:${XDG_DATA_HOME}/cargo/bin"

# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh/history
HISTSIZE=5000
SAVEHIST=10000
setopt autocd
unsetopt beep
bindkey -v
bindkey -s "^Z" fg"^M" # same ^Z behaviour in zsh and a shell program like vim
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/axel/.config/zsh/.zshrc'
zstyle ':completion:*' menu select

autoload -Uz compinit
compinit
_comp_options+=(globdots)		# Include hidden files.
# End of lines added by compinstall

# Aliases
alias website_update="rsync -uvrP --delete-after ~/docs/projects/website/ axel@azure:/srv/www/monSite"
alias syncftp="ssh -L 41127:localhost:41127 rpi"
alias rpmcount="rpm -qa | wc -l"
alias backup="rsync -a --delete --verbose -e ssh /home/axel/ rpi:~/Storage/cloud/axelSUSE"
alias mkdir='mkdir -pv'
alias rm='rm -I'
alias ll="exa --icons -al  --git --group-directories-first"
#alias ll="ls -lhAF --color --group-directories-first"
alias la="ls -lAh --color --group-directories-first"
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

#fast-syntax-highlighting
source ~/.local/share/zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
#fzf fuzzy file search
source /etc/zsh_completion.d/fzf-key-bindings

source ~/.local/share/zsh/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

alias luamake=/home/axel/.local/share/lua-language-server/3rd/luamake/luamake
