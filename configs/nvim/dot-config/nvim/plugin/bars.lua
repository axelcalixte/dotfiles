vim.o.cmdheight = 0
vim.o.showtabline = 2
vim.o.signcolumn = "yes"

--[[
   the statusline is global to all tabs, windows and buffers, it should show information that doesn't change depending on which buffers I can see
   the tabline should show the working directory
   the winbar should show the buffername and be activated only on focus, the + indicating if it needs to be saved should be visible as well
   the statuscolumn is already customized by many features or plugins (gitsigns, diagnostics, breakpoints...)
--]]

vim.pack.add({"https://github.com/rebelot/heirline.nvim"})

local WorkDir = {
    init = function(self)
        local cwd = vim.fn.getcwd(0)
        self.cwd = vim.fn.fnamemodify(cwd, ":~")
    end,
    hl = { fg = "blue", bold = true },

    flexible = 1,

    {
        -- evaluates to the full-lenth path
        provider = function(self)
            local trail = self.cwd:sub(-1) == "/" and "" or "/"
            return self.cwd .. trail .." "
        end,
    },
    {
        -- evaluates to the shortened path
        provider = function(self)
            local cwd = vim.fn.pathshorten(self.cwd)
            local trail = self.cwd:sub(-1) == "/" and "" or "/"
            return cwd .. trail .. " "
        end,
    },
    {
        -- evaluates to "", hiding the component
        provider = "",
    }
}

require("heirline").setup({
    -- statusline = {...},
    -- winbar = {...},
    tabline = WorkDir,
    -- statuscolumn = {...},
})

