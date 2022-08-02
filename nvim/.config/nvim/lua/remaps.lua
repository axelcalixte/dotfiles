--Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "

-- open netrw
vim.keymap.set("n", "<leader>le", ":25Lexplore<CR>")

-- press escape to go back in normal mode inside terminal buffers
-- practical vim
if vim.fn.has("nvim") then
	vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
	vim.keymap.set("t", "<C-v><Esc>", "<Esc>")
end

-- switch buffers like they are tabs
vim.keymap.set("n", "<C-PageUp>", ":bprevious<CR>")
vim.keymap.set("n", "<C-PageDown>", ":bnext<CR>")

-- press escape to go back in normal mode inside terminal buffers
-- practical vim
if vim.fn.has("nvim") then
	vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
	vim.keymap.set("t", "<C-v><Esc>", "<Esc>")
end

-- Move a block of line in visual mode
-- Thanks ThePrimeagen
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Corrects last error with the first dictionnary word in insert mode
vim.keymap.set("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u")
