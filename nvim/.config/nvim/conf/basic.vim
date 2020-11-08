"---ColorScheme & Bar
	"set termguicolors
	let g:lightline = {
	\ 'colorscheme': 'nord',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'gitbranch': 'FugitiveHead'
	\ },
	\ }
	colorscheme nord

"--- General Settings
    set tabstop=2 shiftwidth=2 expandtab
    set number relativenumber
    set noshowmode "to not show modes with lightline
    set smartindent autoindent
    set path+=**
    set showcmd
    set mouse=a
    set wildchar=<Tab> wildmenu wildmode=list

    let mapleader=" "

    " FZF
    nnoremap <leader>p :Files<CR>
    nnoremap <leader>b :Buffers<CR>
    nnoremap <leader><leader> :b#<CR>
    nnoremap <leader>g :GFiles<CR>
    nnoremap <leader>r :Rg

    " nohlsearch remap
    nnoremap <leader>noh :nohlsearch<CR>

"--- Netrw
    let g:netrw_preview=1
    let g:netrw_liststyle= 3
    let g:netrw_banner=0
    let g:netrw_winsize=20
    nnoremap <leader>le :Lexplore<CR>

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
