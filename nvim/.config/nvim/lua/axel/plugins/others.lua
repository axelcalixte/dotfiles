return {
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',

    -- better surround
    'machakann/vim-sandwich',

    -- Useful plugin to show you pending keybinds.
    { 'folke/which-key.nvim',  opts = {} },

    -- History of buffer changes in a tree view
    {
        'mbbill/undotree',
        keys = {
            { "<leader>ut", vim.cmd.UndotreeToggle, desc = "UndoTree" },
        },
    },
    -- Easy comments
    { 'numToStr/Comment.nvim', opts = {} },

    -- Small autopairs
    { 'echasnovski/mini.pairs', version = '*', config = function() require('mini.pairs').setup() end},

    -- Better marks navigation
    {
        'ThePrimeagen/harpoon',
        dependencies = 'nvim-lua/plenary.nvim',
        keys = {
            'gh',
            'gH',
        },
        config = function()
            require('harpoon').setup({
                global_settings = {
                    mark_branch = true,
                },
            })
            local function toggle_move()
                if vim.v.count > 0 then
                    -- require('harpoon.ui').nav_file(vim.v.count) -- doesn't work ?
                    return '<cmd>lua require("harpoon.ui").nav_file(vim.v.count) <CR>'
                else
                    require('harpoon.mark').toggle_file()
                end
            end
            vim.keymap.set('n', 'gh', toggle_move, { expr = true })
            vim.keymap.set('n', '<C-PageUp>', require('harpoon.ui').nav_next)
            vim.keymap.set('n', '<C-PageDown>', require('harpoon.ui').nav_prev)
            vim.keymap.set('n', 'gH', require('harpoon.ui').toggle_quick_menu)
        end,
    },
}
