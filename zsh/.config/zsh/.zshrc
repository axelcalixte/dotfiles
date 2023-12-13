# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# fpath+=($HOME/.local/share/zsh/pure)
# autoload -U promptinit; promptinit
# prompt pure

export PATH="${PATH}:${HOME}/.local/bin:${HOME}/.local/bin/scripts:${XDG_DATA_HOME}/npm/bin:${HOME}/.local/dev/fnm:${BUN_INSTALL}/bin:${DENO_INSTALL}/bin"

# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh/history
HISTSIZE=5000
SAVEHIST=10000
setopt autocd
unsetopt beep
bindkey -v
bindkey "^R" history-incremental-search-backward
#bindkey -s "^Z" fg"^M" # same ^Z behaviour in zsh and a shell program like vim
# End of lines configured by zsh-newuser-install
bindkey '^[[Z' reverse-menu-complete # go backward in the selection menu
# The following lines were added by compinstall
zstyle :compinstall filename '/home/axel/.config/zsh/.zshrc'
zstyle ':completion:*' menu select

autoload -Uz compinit
compinit
_comp_options+=(globdots)		# Include hidden files.
# End of lines added by compinstall

### Aliases
alias website_update="rsync -uvrP --delete-after ~/docs/projects/website/ axel@azure:/srv/www/axelcalixte.fr"
alias syncftp="ssh -L 41127:localhost:41127 rpi"
alias rpmcount="rpm -qa | wc -l"
alias mkdir='mkdir -pv'
alias rm='rm -I'
alias ll="eza --icons -al  --git --group-directories-first"
# alias ll="ls -ghAF --color --group-directories-first"
# alias la="ls -gAh --color --group-directories-first"
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
alias connect="kitty +kitten ssh"
alias box="distrobox enter debian"

### Plugins
#fast-syntax-highlighting
source ~/.local/share/zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
#fzf fuzzy file search
[ -f "/etc/zsh_completion.d/fzf-key-bindings" ] && source /etc/zsh_completion.d/fzf-key-bindings

# fnm
eval "`fnm env`"

# bun completions
[ -s "/home/axel/.bun/_bun" ] && source "/home/axel/.bun/_bun"

source ~/.local/share/zsh/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh


# bun completions
[ -s "/home/axel/.local/dev/bun/_bun" ] && source "/home/axel/.local/dev/bun/_bun"
