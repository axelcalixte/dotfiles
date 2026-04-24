#!/usr/bin/env fish
# Dependencies stow, curl, tar

rm -rf ~/.local/stow/nvim-linux-x86_64

curl -L https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz | tar -C ~/.local/stow -xzf -

echo "Downloaded nvim-linux-x86_64 to ~/local/stow"

cd ~/.local/stow
stow -v nvim-linux-x86_64
