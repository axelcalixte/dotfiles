--Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "

-- open netrw
vim.api.nvim_set_keymap("n", "<leader>le", ":Lexplore<CR>", { noremap = true, silent = true })

-- press escape to go back in normal mode inside terminal buffers
-- practical vim
if vim.fn.has("nvim") then
	vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("t", "<C-v><Esc>", "<Esc>", { noremap = true, silent = true })
end

-- fzf-lua
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>lua require('fzf-lua').files()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>lua require('fzf-lua').grep()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>fb",
	"<cmd>lua require('fzf-lua').buffers()<cr>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>fh",
	"<cmd>lua require('fzf-lua').help_tags()<cr>",
	{ noremap = true, silent = true }
)

-- switch buffers like they are tabs
vim.api.nvim_set_keymap("n", "<C-PageUp>", ":bprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-PageDown>", ":bnext<CR>", { noremap = true, silent = true })

-- press escape to go back in normal mode inside terminal buffers
-- practical vim
if vim.fn.has("nvim") then
	vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("t", "<C-v><Esc>", "<Esc>", { noremap = true, silent = true })
end

--Remap for dealing with word wrap
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Diagnostic keymaps
vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", { noremap = true, silent = true })

-- Corrects last error with the first dictionnary word in insert mode
vim.api.nvim_set_keymap("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u", { noremap = true, silent = true })
