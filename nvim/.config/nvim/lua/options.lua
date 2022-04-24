-- set -> vim.o
-- let -> vim.g

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

-- setting to 0 makes it default to value of tabstop
vim.o.shiftwidth = 0
-- use tabs and spaces
vim.o.tabstop = 4
vim.o.expandtab = true

-- try to use the file's settings for indenting
vim.o.autoindent = true

-- enable folding through indentation
vim.o.foldenable = true
vim.o.foldmethod = "indent"
vim.o.foldnestmax = 1

--Set colorscheme
vim.o.termguicolors = true
vim.o.background = "dark"
vim.cmd([[colorscheme kanagawa]])

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menu,noselect,preview"

-- rajouter if filetype = txt,tex,md
vim.wo.spell = true
vim.o.spelllang = "fr,en_us"

--Map blankline
-- vim.g.indent_blankline_char = "┊"
-- vim.g.indent_blankline_filetype_exclude = { "help", "packer" }
-- vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
-- vim.g.indent_blankline_show_trailing_blankline_indent = false

-- Highlight on yank
vim.cmd([[
	augroup YankHighlight
	autocmd!
	autocmd TextYankPost * silent! lua vim.highlight.on_yank()
	augroup end
	]])

-- Compiling cfait on write while the program is simple
-- next will be :make
vim.cmd([[
  augroup cfait
    autocmd!
    autocmd BufWritePost cfait.c !clang -g ~/docs/projects/cfait/cfait.c -o ~/docs/projects/cfait/cfait
  augroup end
]])

-- vimtex
-- vim.g.tex_flavor = "latex"
-- vim.g.vimtex_compiler_progname = "/home/axeL/.local/bin/nvr"
-- vim.g.vimtex_view_method = "zathura"
-- vim.g.vimtex_quickfix_mode = 0
-- vim.o.conceallevel = 1
-- vim.g.tex_conceal = "abdmg"
