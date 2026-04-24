#!/usr/bin/env fish
# Dependencies curl, tar

set -l stow_dir $HOME/.local/stow
set -l api_url https://api.github.com/repos/LuaLS/lua-language-server/releases/latest
set -l tag (curl -fsSL $api_url | string match -r -g '"tag_name"\s*:\s*"([^"]+)"')

set -l package lua-language-server
set -l archive "$package-$tag-linux-x64.tar.gz"
set -l url "https://github.com/LuaLS/lua-language-server/releases/download/$tag/$archive"

set -l output "$stow_dir/$package"

rm -rf $output
mkdir -pv $output
curl -fL "$url" | tar -xzf - -C $output

set -l script_to_binary "$HOME/.local/bin/$package"
printf '#!/bin/bash\nexec "%s/bin/%s" "$@"' $output $package > $script_to_binary
chmod +x $script_to_binary
