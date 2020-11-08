set packpath^=~/.config/nvim
packadd minpac

call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})

" general use related plugins
call minpac#add('tpope/vim-sensible')
call minpac#add('vimwiki/vimwiki')
call minpac#add('dbeniamine/todo.txt-vim')
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')
" language server plugins
call minpac#add('neovim/nvim-lspconfig')
call minpac#add('nvim-lua/completion-nvim')
call minpac#add('nvim-lua/diagnostic-nvim')
call minpac#add('hrsh7th/vim-vsnip')
call minpac#add('hrsh7th/vim-vsnip-integ')
" Theming & Bling
call minpac#add('arcticicestudio/nord-vim')
call minpac#add('itchyny/lightline.vim')
call minpac#add('norcalli/nvim-colorizer.lua')

" other config files
source ~/.config/nvim/conf/basic.vim
source ~/.config/nvim/conf/debugging.vim
source ~/.config/nvim/conf/lsp.vim
