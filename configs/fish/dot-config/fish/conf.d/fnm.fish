#!/usr/bin/env fish

if not set -q FNM_MULTISHELL_PATH
    type -q fnm; and fnm env | source
end
