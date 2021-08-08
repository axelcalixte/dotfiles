lua require('plugins')
lua require('theme')
lua require('lsp')
lua require('nav')


"" set -> vim.o
"" let -> vim.g
lua vim.g.mapleader = " "

lua vim.o.tabstop = 4
lua vim.o.shiftwidth = 4
lua vim.o.expandtab = true
"set tabstop=4 shiftwidth=4 expandtab
lua vim.o.number = true
lua vim.o.relativenumber = true
"set number relativenumber
"lua vim.o.noshowmode = true
"set noshowmode "to not show modes with lualine
"vim.o.smartindent = true
"vim.o.autoindent = true
"set smartindent autoindent
"vim.o.path += **
"set path+=**
set showcmd
set mouse=a
set completeopt=menuone,noselect
set colorcolumn=80

let g:netrw_preview=1
let g:netrw_liststyle= 3
let g:netrw_banner=0
let g:netrw_winsize=20
nnoremap <leader>le :Lexplore<CR>

"---From ModernVim Book
    " you can undo even after saving and resuming the file
    set undofile
    if !has('nvim')
	    set undodir=~/.local/share/nvim/undo
    endif
    " no swap file then
    set noswapfile  

" press escape to go back in normal mode inside terminal buffers
    if has('nvim')
	tnoremap <Esc> <C-\><C-n>
	tnoremap <C-v><Esc> <Esc>
    endif

" Telescope 4 default remaps
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
