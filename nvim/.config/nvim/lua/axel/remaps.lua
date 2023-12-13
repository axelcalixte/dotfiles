-- Set <Space> as leader
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

vim.g.mapleader = " "
vim.g.maplocalleader = ","
--
-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Escape inside terminal buffers
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<C-v><Esc>", "<Esc>")

-- Switch buffers like tabs
vim.keymap.set("n", "<C-PageUp>", ":bprevious<CR>")
vim.keymap.set("n", "<C-PageDown>", ":bnext<CR>")

-- Move a block of line in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Corrects last error with the first dictionnary word in insert mode
vim.keymap.set("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u")

-- Centering buffer view on pageUp pageDown and searches
vim.keymap.set('n', "<C-d>", "<C-d>zz")
vim.keymap.set('n', "<C-u>", "<C-u>zz")
vim.keymap.set('n', "n", "nzzzv")
vim.keymap.set('n', "N", "Nzzzv")

-- Stop overwriting
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Window commands (unneeded with smart-splits plugin)
-- vim.keymap.set({ "n" }, "<C-h>", "<C-w>h")
-- vim.keymap.set({ "n" }, "<C-j>", "<C-w>j")
-- vim.keymap.set({ "n" }, "<C-k>", "<C-w>k")
-- vim.keymap.set({ "n" }, "<C-l>", "<C-w>l")

-- Diagnostics basics
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
