function toggle-theme
    set current (dconf read /org/gnome/desktop/interface/color-scheme)
    switch $current
        case "'default'"
            dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
            sed -i s/adwaita-light/adwaita-dark/ ~/.config/helix/config.toml
        case "'prefer-dark'"
            dconf write /org/gnome/desktop/interface/color-scheme "'default'"
            sed -i s/adwaita-dark/adwaita-light/ ~/.config/helix/config.toml
    end
end
