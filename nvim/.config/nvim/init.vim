set packpath^=~/.config/nvim
packadd minpac

call minpac#init()

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})

" Add other plugins here.
call minpac#add('tpope/vim-sensible')
call minpac#add('neoclide/coc.nvim', {'branch': 'release'})
call minpac#add('dense-analysis/ale')
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')
call minpac#add('vimwiki/vimwiki')
call minpac#add('tomasiser/vim-code-dark')
call minpac#add('itchyny/lightline.vim')

let g:vimwiki_list = [{'path': '~/docs/vimwiki', 'syntax': 'markdown', 'ext': '.wiki'}]
nnoremap <c-p> :FZF<CR>

"---ColorScheme
	let g:codedark_conservative = 0 " enables the 'more colors' option of VSCode
	let g:lightline = {
		  \ 'colorscheme': 'codedark',
		  \ }
	colorscheme codedark

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
	set hidden "don't know why i need it for for <A-e> netrw
	nnoremap <A-e> :Lexplore<CR>

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

"--- other config files related to coc
source ~/.config/nvim/conf/debug.vim
source ~/.config/nvim/conf/coc.vim
source ~/.config/nvim/conf/git.vim
source ~/.config/nvim/conf/snippets.vim

