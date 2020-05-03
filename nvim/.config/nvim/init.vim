call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-scripts/c.vim'
Plug 'gabrielelana/vim-markdown'
Plug 'junegunn/fzf'
Plug 'ayu-theme/ayu-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'dense-analysis/ale'
Plug 'radenling/vim-dispatch-neovim.git'
call plug#end()

"From Vim-Sensible by Tpope and Do 90% of what plugins do with just Vim
filetype plugin on
set number relativenumber
set foldmethod=indent

set shiftwidth=4 tabstop=4 expandtab smarttab
set complete-=i

set incsearch
set autoread

set laststatus=2
set ruler
set wildmenu
set path+=**

" My own
set showcmd
set hidden "don't know what is, used for <C-b> netrw
set termguicolors     " enable true colors support
colorscheme gruvbox
"use system clipboard !
set clipboard+=unnamedplus 
" To work with the debugger
packadd termdebug 
let g:termdebug_wide=1 "debugger window on the left
nnoremap <F5> :Termdebug<cr> 
" buffer menu"
set wildchar=<Tab> wildmenu wildmode=list
" navigating threw windows
nnoremap <Left> <C-w>r
nnoremap <Right> <C-w>l
nnoremap <Up> <C-w>u
nnoremap <Down> <C-w>d
" Netrw
nnoremap <C-b> :Lexplore<cr>
let g:netrw_liststyle= 3
let g:netrw_banner=0
let g:netrw_winsize=20
let g:netrw_altv=0
" For plugins
let g:markdown_enable_spell_checking = 0
let ayucolor="mirage" 

" From ModernVim Book
" you can undo even after saving and resuming the file
set undofile
if !has('nvim')
    set undodir=~/.local/share/nvim/undo
endif
" press escape to go back in normal mode inside terminal buffers
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
    tnoremap <C-v><Esc> <Esc>
endif

"ALE show errors in files
" Mappings in the style of unimpaired-next
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

"run :make and then :copen to keep the list of errors
set makeprg=gcc\ -g\ -o\ %<\ %
set errorformat=%+A\ %#%f\ %#(%l\\\,%c):\ %m,%C%m

" coc.nvim
" implement cif

