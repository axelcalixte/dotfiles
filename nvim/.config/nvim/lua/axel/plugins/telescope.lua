return {
    {
        'nvim-telescope/telescope.nvim',
        version = '*',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            {
                '<leader>?',
                "<cmd>Telescope oldfiles<cr>",
                desc =
                '[?] Find recently opened files'
            },
            {
                '<leader><space>',
                "<cmd>Telescope buffers<cr>",
                desc =
                '[ ] Find existing buffers'
            },
            {
                '<leader>sf',
                "<cmd>Telescope find_files<cr>",
                desc =
                '[S]earch [F]iles'
            },
            {
                '<leader>sh',
                "<cmd>Telescope help_tags<cr>",
                desc =
                '[S]earch [H]elp'
            },
            {
                '<leader>sw',
                "<cmd>Telescope grep_string<cr>",
                desc =
                '[S]earch current [W]ord'
            },
            {
                '<leader>sg',
                "<cmd>Telescope live_grep<cr>",
                desc =
                '[S]earch by [G]rep'
            },
            {
                '<leader>sd',
                "<cmd>Telescope diagnostics<cr>",
                desc =
                '[S]earch [D]iagnostics'
            }
        },
        config = function()
            require("telescope").setup {
                defaults = {
                    sorting_strategy = "ascending",
                    layout_strategy = "bottom_pane",
                    layout_config = {
                        height = 25,
                    },
                    border = true,
                    borderchars = {
                        prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
                        results = { " " },
                        preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                    },
                    mappings = {
                        i = {
                            ['<C-u>'] = false,
                            ['<C-d>'] = false,
                            ['<C-y>'] = require('telescope.actions.layout').toggle_preview
                        },
                    },
                    preview = {
                        hide_on_startup = false,
                    },
                },
            }
            pcall(require('telescope').load_extension, 'fzf')
        end,
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
            return vim.fn.executable 'make' == 1
        end,
    },

}
