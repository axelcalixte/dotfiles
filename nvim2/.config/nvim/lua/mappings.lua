local map = require('utils').map

-- Set <Space> as leader
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

vim.g.mapleader = " "
vim.g.maplocalleader = ","

map({ "n" }, "<leader>/", ":grep ")
map({ "n" }, "<leader>b", ":b ")

map({ "n" }, "<leader>x", "<cmd>.lua<cr>")

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Escape inside terminal buffers
map("t", "<Esc>", "<C-\\><C-n>")
map("t", "<C-v><Esc>", "<Esc>")

-- Move a block of line in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Corrects last error with the first dictionnary word in insert mode
map("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u")

-- Centering buffer view on pageUp pageDown and searches
map('n', "<C-d>", "<C-d>zz")
map('n', "<C-u>", "<C-u>zz")
map('n', "n", "nzzzv")
map('n', "N", "Nzzzv")

-- Stop overwriting
map("x", "<leader>p", [["_dP]])

map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

map({ "n", "v" }, "<leader>d", [["_d]])
