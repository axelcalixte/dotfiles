if !exists('g:vscode')

set packpath^=~/.config/nvim
packadd minpac

call minpac#init()

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})

" Add other plugins here.
call minpac#add('tpope/vim-sensible')
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')
call minpac#add('vimwiki/vimwiki')
call minpac#add('dbeniamine/todo.txt-vim')
call minpac#add('jiangmiao/auto-pairs')
" just neovim lua goodness
call minpac#add('norcalli/nvim-colorizer.lua')
" LSP + neovim goodness
call minpac#add('neovim/nvim-lspconfig')
call minpac#add('nvim-lua/completion-nvim')
call minpac#add('nvim-lua/diagnostic-nvim')
call minpac#add('hrsh7th/vim-vsnip')
call minpac#add('hrsh7th/vim-vsnip-integ')
call minpac#add('mfussenegger/nvim-jdtls')
" Theming
call minpac#add('ayu-theme/ayu-vim')
call minpac#add('itchyny/lightline.vim')

" other config files
source ~/.config/nvim/conf/basic.vim
source ~/.config/nvim/conf/debugging.vim
source ~/.config/nvim/conf/lsp.vim

endif
