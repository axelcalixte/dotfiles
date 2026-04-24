#!/usr/bin/env fish
# Dependencies curl, unzip, stow

# Download and install fnm:
curl -o- https://fnm.vercel.app/install | bash -s -- --skip-shell --install-dir ~/.local/stow/fnm/bin

cd ~/.local/stow
stow -v fnm

# Download and install Node.js:
fnm install 24

fnm env | source

# Verify the Node.js version:
echo "Installed node" (node -v)

# Download and install pnpm:
yes | corepack enable pnpm

# Verify pnpm version:
echo "Installed node" (pnpm -v)

pnpm -g i \
    @angular/cli @angular/language-server \
    @vtsls/language-server vscode-langservers-extracted \
    opencode-ai@latest \
