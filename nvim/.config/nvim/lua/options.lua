-- set -> vim.o
-- let -> vim.g

vim.g.mapleader = " "

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

vim.cmd([[let g:tex_flavor='latex']])
vim.cmd([[let g:vimtex_compiler_progname= '/home/axel/.local/bin/nvr']])
vim.cmd([[let g:vimtex_view_method='zathura']])
vim.cmd([[let g:vimtex_quickfix_mode=0]])
vim.cmd([[set conceallevel=1]])
vim.cmd([[let g:tex_conceal='abdmg']])

vim.cmd([[setlocal spell]])
vim.cmd([[set spelllang=fr,en_us]])
vim.cmd([[inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u]])
