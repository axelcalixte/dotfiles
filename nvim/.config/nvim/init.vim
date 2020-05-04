call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-scripts/c.vim'
Plug 'morhetz/gruvbox'
"Showing erros plugin
Plug 'dense-analysis/ale'
"Compiler plugins
"Plug 'tpope/vim-dispatch'
"Plug 'radenling/vim-dispatch-neovim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
let mapleader = ","
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
nnoremap <leader>h :wincmd h<cr>
nnoremap <leader> :wincmd l<cr>
nnoremap <leader> :wincmd u<cr>
nnoremap <leader> :wincmd d<cr>
" Netrw
nnoremap <C-b> :Lexplore<cr>
let g:netrw_liststyle= 3
let g:netrw_banner=0
let g:netrw_winsize=20
let g:netrw_altv=0
" For plugins
" CoC settings
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd FileType json syntax match Comment +\/\/.\+$+
" use tabs instead of c-p and c-n
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" confirm with enter
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
" Remap for rename current word
nmap <F2> <Plug>(coc-rename)
" coc-snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
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
