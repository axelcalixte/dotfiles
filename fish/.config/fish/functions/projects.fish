function projects
    cd (find ~/Documents/projects/ -maxdepth 1 -mindepth 1 | fzf)
end
