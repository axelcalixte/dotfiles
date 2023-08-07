return {
   {'tpope/vim-fugitive',
      keys = {
         { "<leader>gs", vim.cmd.Git  },
      }
   },
   {
      'lewis6991/gitsigns.nvim',
      opts = {
         signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
         },
         on_attach = function(bufnr)
            vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk)
            vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk)
            vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk)
         end,
      },
   },
}
