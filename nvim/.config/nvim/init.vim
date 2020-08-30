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
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('vimwiki/vimwiki')
call minpac#add('arcticicestudio/nord-vim')
call minpac#add('itchyny/lightline.vim')
call minpac#add('rrethy/vim-hexokinase', { 'do': 'make hexokinase' })

let g:vimwiki_list = [{'path': '~/docs/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
let g:Hexokinase_highlighters = [ 'virtual' ]
let g:Hexokinase_optInPatterns = [
\     'full_hex',
\     'triple_hex',
\     'rgb',
\     'rgba',
\     'hsl',
\     'hsla',
\     'colour_names'
\ ]

"--- other config files 
source ~/.config/nvim/conf/basic.vim
source ~/.config/nvim/conf/debugging.vim
source ~/.config/nvim/conf/coc.vim
source ~/.config/nvim/conf/git.vim
source ~/.config/nvim/conf/snippets.vim
