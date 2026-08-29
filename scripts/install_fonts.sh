#!/usr/bin/env bash
# Installs CommitMono and NerdFontsSymbols fonts

fonts_dir="${HOME}/.local/share/fonts"
if [ -d "$fonts_dir" ]; then
	rm -rf "$fonts_dir"
fi
mkdir -pv "$fonts_dir"

base_tmp="$(pwd)"
cd "$fonts_dir" || { echo "not able to create fonts dir"; return 1; }

curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/NerdFontsSymbolsOnly.zip
curl -LO https://github.com/eigilnikolajsen/commit-mono/releases/download/v1.143/CommitMono-1.143.zip

unzip -o NerdFontsSymbolsOnly.zip
unzip -o CommitMono-1.143.zip

# Move font files from subdirectories to fonts_dir
find . -name "*.ttf" -o -name "*.otf" -o -name "*.woff2" | while read -r fontfile; do
mv "$fontfile" "$fonts_dir/" 2>/dev/null || true
done

# Clean up empty directories and archives
rm -rf "$fonts_dir"/CommitMono-1.143
rm -f ./*.zip ./*.tar.xz

cd "$base_tmp" || { echo "couldn't return to base dir when installing fonts"; return 1; }

fc-cache -fv

gsettings set org.gnome.desktop.interface monospace-font-name "CommitMono 11"
