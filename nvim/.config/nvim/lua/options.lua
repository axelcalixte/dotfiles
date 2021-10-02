-- set -> vim.o
-- let -> vim.g
--vim.g.mapleader = "<Space>"
vim.g.mapleader = " "

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.showmode = false
vim.o.smartindent = true
vim.o.autoindent = true
vim.cmd("set path+=**")
vim.o.showcmd = true
-- vim.o.mouse = a
vim.opt.completeopt = { "menuone", "noselect" }
vim.o.colorcolumn = "80"

--vim.o.netrw_preview = 1
-- vim.o.netrw_liststyle = 3
vim.g.netrw_banner = false
-- vim.o.netrw_winsize = 20

--From ModernVim Book
-- you can undo even after saving and resuming the file
vim.o.undofile = true
if vim.fn.has("nvim") == 0 then
	vim.o.undodir = "~/.local/share/nvim/undo"
end

-- no swap file then
vim.o.swapfile = false

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250
vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})]])
