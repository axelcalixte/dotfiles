vim.api.nvim_set_keymap('n', '<leader>le',  ':Lexplore<CR>', { noremap = true, silent = true })

-- press escape to go back in normal mode inside terminal buffers
if vim.fn.has('nvim') then
    vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('t', '<C-v><Esc>', '<Esc>', { noremap = true, silent = true })
end

-- fzf-lua
vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd>lua require('fzf-lua').files()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', "<cmd>lua require('fzf-lua').grep()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', "<cmd>lua require('fzf-lua').buffers()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', "<cmd>lua require('fzf-lua').help_tags()<cr>", { noremap = true, silent = true })

-- nvim-jdtls
-- `code_action` is a superset of vim.lsp.buf.code_action and you'll be able to
-- use this mapping also with other language servers
vim.api.nvim_set_keymap('n', '<A-CR>', "Cmd>lua require('jdtls').code_action()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-CR>', "Esc><Cmd>lua require('jdtls').code_action(true)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', "Cmd>lua require('jdtls').code_action(false, 'refactor')<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-o>', "Cmd>lua require'jdtls'.organize_imports()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'crv', "Cmd>lua require('jdtls').extract_variable()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'crv', "Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'crc', "Cmd>lua require('jdtls').extract_constant()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'crc', "Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'crm', "Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", { noremap = true, silent = true })
