fpath+=$HOME/.local/share/zsh/pure
autoload -U promptinit; promptinit
# change the color for both `prompt:success` and `prompt:error`
#zstyle ':prompt:pure:prompt:*' color cyan
# turn on git stash status
PURE_GIT_PULL=1
zstyle :prompt:pure:git:stash show yes
prompt pure

# The following lines were added by compinstall

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

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000
setopt autocd completealiases extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were read by zsh-newuser-install.
# They were moved here as they could not be understood.
# sam. 02 mai 2020 22:00:19 CEST
stty stop undef		# Disable ctrl-s to freeze terminal
# End of lines moved by zsh-newuser-install.

# Aliases
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias in='nvim /home/axel/Documents/notes/in.md'
alias t='todo-txt'
alias vi='nvim'
alias mkdir='mkdir -p'
alias sp='systemctl poweroff'
alias ss='systemctl suspend'
alias sr='systemctl reboot'

#Fish syntax highlighting
source /home/axel/.local/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
#ZSH auto-suggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#fzf fuzzy file search
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh