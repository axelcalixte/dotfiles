"---Plugin Manager
    set runtimepath+=/home/axel/.cache/dein/repos/github.com/Shougo/dein.vim
    if dein#load_state('/home/axel/.cache/dein')
        call dein#begin('/home/axel/.cache/dein')
        call dein#add('/home/axel/.cache/dein/repos/github.com/Shougo/dein.vim')
        call dein#add('tpope/vim-sensible')
        call dein#add('morhetz/gruvbox')
        call dein#add('dense-analysis/ale')
        call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})

        call dein#end()
        call dein#save_state()
    endif

"---Coloscheme
    set termguicolors     " enable true colors support
    colorscheme gruvbox

"---CoC settings
    autocmd CursorHold * silent call CocActionAsync('highlight')
    autocmd FileType json syntax match Comment +\/\/.\+$+
    "use tabs instead of c-p and c-n
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    "confirm with enter
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
    autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
    "Remap for rename current word
    nmap <F2> <Plug>(coc-rename)
    "Use <C-l> for trigger snippet expand.
    imap <C-l> <Plug>(coc-snippets-expand)
    "Use <C-j> for jump to next placeholder, it's default of coc.nvim
    let g:coc_snippet_next = '<c-j>'
    "Use <C-k> for jump to previous placeholder, it's default of coc.nvim
    let g:coc_snippet_prev = '<c-k>'

"---ALE show errors in files
    "Mappings in the style of unimpaired-next
    nmap <silent> [W <Plug>(ale_first)
    nmap <silent> [w <Plug>(ale_previous)
    nmap <silent> ]w <Plug>(ale_next)
    nmap <silent> ]W <Plug>(ale_last)

"---From Do 90% of what plugins do with just Vim
    set number relativenumber
    set foldmethod=indent
    set shiftwidth=4 tabstop=4 expandtab smarttab
    set path+=**

"--- Netrw
    nnoremap <C-b> :Lexplore<cr>
    let g:netrw_liststyle= 3
    let g:netrw_banner=0
    let g:netrw_winsize=20
    let g:netrw_altv=0

"--- My own
    let mapleader = ","
    set showcmd
    set hidden "don't know why i need it for for <C-b> netrw
    
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
    
    " commenting C code
    nnoremap <leader>cc :normal I//<space><cr>
    vnoremap <leader>cc :normal I//<space><cr> 
    nnoremap <leader>co :normal Ixx<space><cr>
    vnoremap <leader>co :normal Ixx<space><cr> 

"---From ModernVim Book
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

"---run :make and then :copen to keep the list of errors
    set makeprg=gcc\ -g\ -o\ %<\ %
    set errorformat=%+A\ %#%f\ %#(%l\\\,%c):\ %m,%C%m
