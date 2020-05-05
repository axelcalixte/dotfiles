if exists('g:vscode')
"vscode config
    nnoremap <silent> <C-w>gd :<C-u>call VSCodeNotify('editor.action.revealDefinitionAside')<CR>
    nnoremap <silent> ? :<C-u>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>
    xmap gc  <Plug>VSCodeCommentary
    nmap gc  <Plug>VSCodeCommentary
    omap gc  <Plug>VSCodeCommentary
    nmap gcc <Plug>VSCodeCommentaryLine
else
"start of vim config
    "---Plugin Manager
        set runtimepath+=/home/axel/.cache/dein/repos/github.com/Shougo/dein.vim
        if dein#load_state('/home/axel/.cache/dein')
        call dein#begin('/home/axel/.cache/dein')
        call dein#add('/home/axel/.cache/dein/repos/github.com/Shougo/dein.vim')
        call dein#add('tpope/vim-sensible')
        call dein#add('morhetz/gruvbox')
        call dein#add('dense-analysis/ale')
        call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})
        call dein#add('junegunn/fzf')

        call dein#end()
        call dein#save_state()
        endif

    "---Coloscheme
        set termguicolors     " enable true colors support
        colorscheme gruvbox

    "--fzf
        nnoremap <c-p> :FZF<cr>

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
        nmap rn <Plug>(coc-rename)
    "Use <C-l> for trigger snippet expand.
        imap <C-l> <Plug>(coc-snippets-expand)
    "Use <C-j> for jump to next placeholder, it's default of coc.nvim
        let g:coc_snippet_next = '<c-j>'
    "Use <C-k> for jump to previous placeholder, it's default of coc.nvim
        let g:coc_snippet_prev = '<c-k>'
    " Remap keys for gotos
        nmap <silent> gd <Plug>(coc-definition)
        nmap <silent> gy <Plug>(coc-type-definition)
        nmap <silent> gi <Plug>(coc-implementation)
        nmap <silent> gr <Plug>(coc-references)
    " Remap for format selected region
        xmap <Leader>f  <Plug>(coc-format-selected)
        nmap <Leader>f  <Plug>(coc-format-selected)

        augroup mygroup
            autocmd!
        "Setup formatexpr specified filetypes
            autocmd FileType c,json setl formatexpr=CocAction('format-selected')
        " Update signature help on jump placeholder
            autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
        augroup end

    "Use `:Format` to format current buffer
        command! -nargs=0 Format :call CocAction('format')

"---ALE show errors in files
    "Mappings in the style of unimpaired-next
        nmap <silent> [W <Plug>(ale_first)
        nmap <silent> [w <Plug>(ale_previous)
        nmap <silent> ]w <Plug>(ale_next)
        nmap <silent> ]W <Plug>(ale_last)

"--- Netrw
        let g:netrw_liststyle= 3
        let g:netrw_banner=0
        let g:netrw_winsize=25
        set hidden "don't know why i need it for for <C-b> netrw
        nnoremap <C-b> :Lexplore<cr>

"--- My own
        set showcmd
        set shiftwidth=4 softtabstop=4 tabstop=4 expandtab smarttab
        set number
        set smartindent
        set foldmethod=indent
        set path+=**
        set incsearch
        set colorcolumn=80  

    "use system clipboard !
        set clipboard+=unnamedplus 

    " To work with the debugger
        packadd termdebug 
        let g:termdebug_wide=1 "debugger window on the left
        nnoremap <F5> :Termdebug<cr> 

    " buffer menu"
        set wildchar=<Tab> wildmenu wildmode=list

    " navigating threw windows
        nnoremap <Leader>h :wincmd h<cr>
        nnoremap <Leader>l :wincmd l<cr>
        nnoremap <Leader>k :wincmd k<cr>
        nnoremap <Leader>j :wincmd j<cr>

    " commenting C code
        nnoremap <Leader>cc :normal I//<space><cr>
        vnoremap <Leader>cc :normal I//<space><cr> 
        nnoremap <Leader>co :normal Ixx<space><cr>
        vnoremap <Leader>co :normal Ixx<space><cr> 

    " moving blocks of text
        vnoremap J :m '>+1<cr>gv=gv 
        vnoremap K :m '<-2<cr>gv=gv

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
        set errorformat=%+A\ %#%f\ %#(%l\\\,%c):\ %m,%C%mq
"end of vim config
endif
