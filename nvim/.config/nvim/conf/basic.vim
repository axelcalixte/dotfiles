"---ColorScheme & Bar
	"set termguicolors
	let g:lightline = {
	\ 'colorscheme': 'ayu_mirage',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'gitbranch': 'FugitiveHead'
	\ },
	\ }
	let ayucolor="mirage"
	colorscheme ayu

"--- Netrw
    let g:netrw_preview=1
    let g:netrw_liststyle= 3
    let g:netrw_banner=0
    let g:netrw_winsize=20
    set hidden "don't know why i need it for for <A-e> netrw
    nnoremap <leader>n :Lexplore<CR>

"--- My own
    set tabstop=4 shiftwidth=4 expandtab
    set number relativenumber
    set noshowmode "to not show modes with lightline
    set smartindent autoindent
    set foldmethod=indent
    set path+=**
    set showcmd
    set mouse=a
    set wildchar=<Tab> wildmenu wildmode=list

    let mapleader=','

    " FZF
    nnoremap <c-p> :Files<CR>
    "nnoremap <c-b> :Buffers<CR>

    " switching between 2 buffers
    nnoremap <Space><Space> :b#<CR>

    " nohlsearch remap
    nnoremap <leader>noh :nohlsearch<CR>

    " vimwiki	
    let g:vimwiki_list = [{'path': '~/sync/notes', 'syntax': 'markdown', 'ext': '.md'}]

"---From ModernVim Book
    " you can undo even after saving and resuming the file
    set undofile
    if !has('nvim')
	    set undodir=~/.local/share/vim/undo
    endif
    " no swap file then
    set noswapfile  

" press escape to go back in normal mode inside terminal buffers
    if has('nvim')
	tnoremap <Esc> <C-\><C-n>
	tnoremap <C-v><Esc> <Esc>
    endif
