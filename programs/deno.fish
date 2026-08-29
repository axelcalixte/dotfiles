#!/usr/bin/env fish
# unzip or 7zip is required

set -l stow_dir $HOME/.local/stow
set -l package deno
set -l output $stow_dir/$package

curl -fsSL https://deno.land/install.sh | DENO_INSTALL=$output sh -s -- --no-modify-path

find $output -type f ! -perm /+x -exec rm {} \;

cd $stow_dir
stow -v $package
