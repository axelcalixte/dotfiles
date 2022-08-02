--Set highlight on search
vim.o.hlsearch = false

--Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

--Enable mouse mode
vim.o.mouse = "a"

-- break indent allows wrapped lines to continue visually, it preserves horizontal blocks of text
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Disable swap files
vim.opt.swapfile = false

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

-- use tabs and spaces
vim.o.tabstop = 4
vim.o.expandtab = true
-- setting to 0 makes it default to value of tabstop
vim.o.shiftwidth = 0

-- try to use the file's settings for indenting
vim.o.autoindent = true

-- enable folding through indentation
vim.o.foldenable = true
vim.o.foldmethod = "indent"
vim.o.foldnestmax = 1

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menu,noselect,preview"

local spell_ft = { "markdown", "plaintex", "text" }
for _, ft in pairs(spell_ft) do
  if vim.bo.filetype == ft then
    vim.wo.spell = true
    vim.o.spelllang = "fr,en_us"
  end
end

-- Highlight on yank
vim.cmd([[
	augroup YankHighlight
	autocmd!
	autocmd TextYankPost * silent! lua vim.highlight.on_yank()
	augroup end
	]])
