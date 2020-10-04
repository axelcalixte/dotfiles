set packpath^=~/.config/nvim
packadd minpac

call minpac#init()

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})

" Add other plugins here.
call minpac#add('tpope/vim-sensible')
"call minpac#add('neoclide/coc.nvim', {'branch': 'release'})
call minpac#add('junegunn/fzf', {'do': { -> fzf#install() } } )
call minpac#add('junegunn/fzf.vim')
call minpac#add('vimwiki/vimwiki')
call minpac#add('ayu-theme/ayu-vim')
call minpac#add('itchyny/lightline.vim')

" other config files
source ~/.config/nvim/conf/basic.vim
"source ~/.config/nvim/conf/debugging.vim
"source ~/.config/nvim/conf/coc.vim
"source ~/.config/nvim/conf/snippets.vim
