"---ColorScheme & Bar
	"set termguicolors
	"let g:lightline = {
      \ 'colorscheme': 'ayu_dark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
	"let ayucolor="dark"
	"colorscheme ayu

"--- Netrw
	let g:netrw_preview=1
	let g:netrw_liststyle= 3
	let g:netrw_banner=0
	let g:netrw_winsize=20
	set hidden "don't know why i need it for for <A-e> netrw
	nnoremap <C-b> :Lexplore<CR>

"--- My own
	"set background=dark
	set shiftwidth=4 softtabstop=4 tabstop=4 smarttab
	set number relativenumber
	"set noshowmode "to not show modes with lightline
	set smartindent
	set foldmethod=indent
	set path+=**
	set showcmd
	set mouse=a

	let mapleader=','

	" FZF
		nnoremap <c-p> :FZF<CR>
		let g:fzf_layout = { 'window' : { 'width': 0.8, 'height': 0.8 } }

	" buffer menu"
        set wildchar=<Tab> wildmenu wildmode=list

    " moving blocks of text
        vnoremap J :m '>+1<CR>gv=gv
        vnoremap K :m '<-2<CR>gv=gv

	" switching between buffers
		nnoremap <Space>b :Buffers<CR>
		nnoremap <Space><Space> :b#<CR>

	" vimwikio	
		let g:vimwiki_list = [{'path': '~/docs/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]

"---From ModernVim Book
	" you can undo even after saving and resuming the file
	set undofile
	if !has('nvim')
		set undodir=~/.local/share/vim/undo
	endif

" press escape to go back in normal mode inside terminal buffers
	if has('nvim')
		tnoremap <Esc> <C-\><C-n>
		tnoremap <C-v><Esc> <Esc>
	endif
