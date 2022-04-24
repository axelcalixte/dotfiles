require("plugins")
require("options")
require("remaps")

require("packed/comment-nvim")
require("packed/fzf-lua")
require("packed/lspconfig")
require("packed/null-ls")
require("packed/nvim-autopairs")
require("packed/nvim-cmp")
require("packed/theming")
require("packed/treesitter")

--[[function requireFilesFrom(dir)
    local p = io.popen('find "'.."/home/axel/.config/nvim/lua/"..dir..'" -type f')  --Open directory look for files, save data in p. By giving '-type f' as parameter, it returns all files.     
    for file in p:lines() do                         --Loop through all files
        -- print(file:gsub(".lua", ""):gsub("lua/packed/", ""))
        print(file:gsub("/home/axel/.config/nvim/lua/"..dir.."/", ""):gsub(".lua", ""))
    end
end    
requireFilesFrom("packed")]]
