#!/usr/bin/env fish
# Dependencies curl, tar, stow, find

set -l package jj-vcs
set -l url (curl -L https://api.github.com/repos/jj-vcs/jj/releases/latest | string match -r "https.*x86_64.*linux.*\.gz")

set -l stow_dir $HOME/.local/stow
set -l output $stow_dir/$package

rm -rf $output
mkdir -pv $output/bin
curl -fL "$url" | tar -xzf - -C $output

find $output -type f ! -perm /+x -exec rm {} \;
mv $output/jj $output/bin/jj

cd $stow_dir
stow -v $package
