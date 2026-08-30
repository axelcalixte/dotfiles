FROM registry.opensuse.org/opensuse/distrobox:latest

RUN zypper --non-interactive install --no-recommends \
    nnn \
    ncdu \
    htop \
    stow \
    fd \
    ripgrep \
    fzf \
    git \
    neovim \
    kitty kitty-shell-integration kitty-terminfo \
    starship \
    fnm \
    maven \
    java-25-openjdk \
&& zypper clean
