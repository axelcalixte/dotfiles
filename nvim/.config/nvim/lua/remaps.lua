--Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "

-- open netrw
vim.keymap.set("n", "<leader>le", ":30Lexplore<CR>")

-- press escape to go back in normal mode inside terminal buffers
-- practical vim
if vim.fn.has("nvim") then
	vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
	vim.keymap.set("t", "<C-v><Esc>", "<Esc>")
end

-- fzf-lua
vim.keymap.set("n", "<leader>ff", "<cmd>lua require('fzf-lua').files()<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>lua require('fzf-lua').grep()<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>lua require('fzf-lua').buffers()<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>lua require('fzf-lua').help_tags()<cr>")

-- switch buffers like they are tabs
vim.keymap.set("n", "<C-PageUp>", ":bprevious<CR>")
vim.keymap.set("n", "<C-PageDown>", ":bnext<CR>")

-- press escape to go back in normal mode inside terminal buffers
-- practical vim
if vim.fn.has("nvim") then
	vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
	vim.keymap.set("t", "<C-v><Esc>", "<Esc>")
end

--Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
vim.keymap.set("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")

-- Corrects last error with the first dictionnary word in insert mode
vim.keymap.set("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u")
