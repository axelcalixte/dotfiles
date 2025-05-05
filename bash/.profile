export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export LOCAL_DEV="$HOME/.local/dev"
export LANG="fr_FR.utf8"

export MOZ_ENABLE_WAYLAND=1
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
export HELIX_RUNTIME="$LOCAL_DEV/helix/runtime"
export DENO_INSTALL="$LOCAL_DEV/deno"
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64

export NNN_TRASH=1
export NNN_BMS="p:~/Documents/projects;v:~/.config/moi;"
export NNN_PLUG="p:preview-tui;"

export LESSHISTFILE=-
export INPUTRC="${XDG_CONFIG_HOME}"/readline/inputrc
export HISTFILE="${XDG_CACHE_HOME}"/bash/history

export PATH="${PNPM_HOME}:${HOME}/.local/bin:${DENO_INSTALL}/bin:${LOCAL_DEV}/lua_ls/bin:${PATH}"

if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi
