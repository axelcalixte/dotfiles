"---ColorScheme
	let g:codedark_conservative = 0 " enables the 'more colors' option of VSCode
	let g:lightline = {
		  \ 'colorscheme': 'codedark',
		  \ }
	colorscheme codedark

"--- Netrw
	let g:netrw_preview=1
	let g:netrw_liststyle= 3
	let g:netrw_banner=0
	let g:netrw_winsize=20
	set hidden "don't know why i need it for for <A-e> netrw
	nnoremap <C-b> :Lexplore<CR>

"--- My own
	set background=dark
	set shiftwidth=4 softtabstop=4 tabstop=4 smarttab
	set number relativenumber
	set noshowmode "to not show modes with lightline
	set smartindent
	set foldmethod=indent
	set path+=**
	set showcmd

    " buffer menu"
        set wildchar=<Tab> wildmenu wildmode=list

    " moving blocks of text
        vnoremap J :m '>+1<CR>gv=gv 
        vnoremap K :m '<-2<CR>gv=gv

	" switching between buffers
	"	noremap <C-6> <C-Tab>
		map <C-i><C> <C-6>
	
	" Firefox Tab-Like Switching but buffers and maybe splits are better
	" Tab navigation like Firefox.
		nnoremap <C-S-tab> :tabprevious<CR>
		nnoremap <C-tab>   :tabnext<CR>
		nnoremap <C-t>     :tabnew<CR>
		inoremap <C-S-tab> <Esc>:tabprevious<CR>i
		inoremap <C-tab>   <Esc>:tabnext<CR>i
		inoremap <C-t>     <Esc>:tabnew<CR>	

		" only in normal modes because these mappings already exist in insert
		" or visual mode
		nnoremap <C-Insert> :tabnew<CR> 
		nnoremap <C-Delete> :tabclose<CR>


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
