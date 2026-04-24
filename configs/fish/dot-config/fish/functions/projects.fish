function projects
    set -l project (
        find ~/Documents/projects \
            -maxdepth 4 \
            -type d \
            ! -path '*/node_modules/*' \
            ! -path '*/dist/*' \
            ! -path '*/venv/*' \
            ! -path '*/target/*' \
            ! -path '*/.*/*' | fzf
    )

    test -n "$project"; and cd "$project"
end
