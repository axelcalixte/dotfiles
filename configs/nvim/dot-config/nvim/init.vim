set number relativenumber
set cursorline
set smartcase ignorecase
set bg=light
set path+=./**
set laststatus=3
set noswapfile
set undofile
set shiftwidth=0
set tabstop=4
set expandtab

if exists("g:neovide")
  set guifont=CommitMono:h13
  set linespace=12
  inoremap <c-s-v> <c-o>"+p<c-o>==<c-o>$
  vnoremap <c-s-c> "+Y
endif


nnoremap <space> <Nop>
let mapleader = " "
let maplocalleader = ","

nnoremap <leader>pl <cmd>lua vim.pack.update(nil, { offline = true })<cr>

" dealing with word wrap
lua vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
lua vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

" Escape inside terminal buffers
lua vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
lua vim.keymap.set("t", "<C-v><Esc>", "<Esc>")

" Move a block of line in visual mode
lua vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
lua vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

lua vim.keymap.set("n", "<leader>u", function() if vim.fn.exists(':Undotree') == 0 then vim.cmd("packadd nvim.undotree") end vim.cmd("Undotree") end)

"lua << EOF
"vim.keymap.set("n", "<leader>q", function()
"        if vim.fn.exists(':Cfilter') == 0 then
"                vim.cmd("packadd cfilter")
"        end
"        for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
"                if vim.fn.buflisted(bufnr) == 1 then
"                        listed[#listed+1] = bufnr
"                end
"        end
"
"        vim.cmd("copen")
"end)
"
"EOF

