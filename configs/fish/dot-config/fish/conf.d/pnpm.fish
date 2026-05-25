#!/usr/bin/env fish

set -gx PNPM_HOME "$XDG_DATA_HOME/pnpm"

fish_add_path --path $PNPM_HOME/bin
