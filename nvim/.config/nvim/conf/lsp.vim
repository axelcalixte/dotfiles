lua <<EOF
vim.cmd('packadd nvim-lspconfig')
vim.cmd('packadd completion-nvim')
vim.cmd('packadd nvim-colorizer.lua')
vim.cmd('packadd diagnostic-nvim')

-- function to use completion-nvim and diagnostic-nvim together
local on_attach_vim = function(client)
  require'completion'.on_attach(client)
  require'diagnostic'.on_attach(client)
end

require'nvim_lsp'.jdtls.setup{
        on_attach_vim,
        init_options = {
                workspace = "/home/axel/.config/jdtls-workspace"
        }
}

require'nvim_lsp'.bashls.setup{
    on_attach_vim
}

require'nvim_lsp'.texlab.setup{
    on_attach_vim
}

require'nvim_lsp'.sumneko_lua.setup{
    on_attach_vim
}

EOF

" Keybinds from :h lsp
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

" keybinds for jdtls stuff
nnoremap <A-CR> <Cmd>lua require('jdtls').code_action()<CR>
vnoremap <A-CR> <Esc><Cmd>lua require('jdtls').code_action(true)<CR>
nnoremap <leader>r <Cmd>lua require('jdtls').code_action(false, 'refactor')<CR>

nnoremap <A-o> <Cmd>lua require'jdtls'.organize_imports()<CR>
nnoremap crv <Cmd>lua require('jdtls').extract_variable()<CR>
vnoremap crv <Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>
vnoremap crm <Esc><Cmd>lua require('jdtls').extract_method(true)<CR>

"" nvim-completion
autocmd BufEnter * lua require'completion'.on_attach()
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set shortmess+=c
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_enable_snippet = 'vim-vsnip'

""" nvim colorizer.lua
set termguicolors
lua require'colorizer'.setup()
