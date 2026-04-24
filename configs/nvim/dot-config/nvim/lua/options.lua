if vim.fn.executable "rg" then
    vim.o.grepprg = "rg --vimgrep --smart-case"
end

vim.o.shell = "fish"

vim.o.number = true
vim.o.relativenumber = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.undofile = true
vim.o.swapfile = false
vim.o.scrolloff = 3
vim.o.signcolumn = "yes"
vim.o.cmdheight = 0
vim.o.laststatus = 3
vim.o.splitright = true
vim.o.splitbelow = true


vim.o.tabstop = 4
vim.o.shiftwidth = 0
vim.o.expandtab = true

vim.opt.path:append {"./**"}
vim.opt.path:remove {"./**/node_modules/**"}

vim.opt.completeopt:append {"menuone", "noselect", "popup", "preview"}
