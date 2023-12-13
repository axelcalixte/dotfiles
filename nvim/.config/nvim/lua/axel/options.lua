-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

--Disable swap files
vim.opt.swapfile = false

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect,preview'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Enable folding through indentation
vim.o.foldenable = true
vim.o.foldmethod = "indent"
vim.o.foldnestmax = 1

vim.opt.path = "./**"

vim.o.scrolloff = 3

--vim.opt.formatoptions:remove({ 'c', 'r', 'o' }) weird that this doesn't work
vim.cmd [[autocmd FileType * set formatoptions-=cro]]
