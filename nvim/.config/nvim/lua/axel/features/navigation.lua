return {
   -- Finding stuff
   {
      "ibhagwan/fzf-lua",
      -- optional for icon support
      dependencies = { "nvim-tree/nvim-web-devicons" },
      keys = {
         { '<leader>ff',       '<cmd>FzfLua git_files<cr>' },
         { '<leader><leader>', '<cmd>FzfLua buffers<cr>' },
         { '<leader>fh',       '<cmd>FzfLua help_tags<cr>' },
         { '<leader>fw',       '<cmd>FzfLua grep<cr>' },
         { '<leader>fg',       '<cmd>FzfLua live_grep<cr>' },
         { '<leader>fd',       '<cmd>FzfLua diagnostics_document<cr>' },
         { '<leader>fD',       '<cmd>FzfLua diagnostics_workspace<cr>' },
      }
   },
   {
      "echasnovski/mini.files",
      version = "*",
      config = function()
         require('mini.files').setup({
            windows = { preview = true }
         })
         vim.keymap.set('n', '-', '<cmd>lua MiniFiles.open()<cr>')
      end
   }, -- Navigation
   {
      "mrjones2014/smart-splits.nvim",
      opts = {
         ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" },
         ignored_buftypes = { "nofile" },
      },
      keys = {
         { '<C-h>', '<cmd>SmartCursorMoveLeft<cr>' },
         { '<C-j>', '<cmd>SmartCursorMoveDown<cr>' },
         { '<C-k>', '<cmd>SmartCursorMoveUp<cr>' },
         { '<C-l>', '<cmd>SmartCursorMoveRight<cr>' },
      }
   },
}
