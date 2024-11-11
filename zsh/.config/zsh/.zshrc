# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="${PATH}:${HOME}/.local/bin:${XDG_DATA_HOME}/JetBrains/Toolbox/scripts:$DENO_INSTALL/bin:${LOCAL_DEV}/lua_ls/bin"

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
alias ll="ls -ghAF --color --group-directories-first"
alias la="ls -gAh --color --group-directories-first"
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
alias box="distrobox enter debian"

#fzf fuzzy file search
[ -n "$(which fzf)" ] && source /usr/share/doc/fzf/examples/key-bindings.zsh

# fnm
eval "`fnm env`"

# pnpm
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Load Angular CLI autocompletion.
source <(ng completion script)

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/axel/.local/share/zsh/zsh-nvim-appname/zsh-nvim-appname.plugin.zsh

source ~/.local/share/zsh/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

