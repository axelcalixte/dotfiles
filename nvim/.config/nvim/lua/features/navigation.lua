return {
   -- Finding stuff
   {
      "ibhagwan/fzf-lua",
      -- optional for icon support
      dependencies = { "nvim-tree/nvim-web-devicons" },
      keys = {
         { '<leader>sf',       '<cmd>FzfLua git_files<cr>' },
         { '<leader><leader>', '<cmd>FzfLua buffers<cr>' },
         { '<leader>sF',       '<cmd> FzfLua files<cr>' },
         { '<leader>sh',       '<cmd>FzfLua help_tags<cr>' },
         { '<leader>sw',       '<cmd>FzfLua grep<cr>' },
         { '<leader>sg',       '<cmd>FzfLua live_grep<cr>' },
         { '<leader>sd',       '<cmd>FzfLua diagnostics_document<cr>' },
         { '<leader>sD',       '<cmd>FzfLua diagnostics_workspace<cr>' },
      }
   },
   -- {
   --    "stevearc/oil.nvim",
   --    opts = {},
   -- }
   {
      "echasnovski/mini.files",
      version = "*",
      config = function()
         require('mini.files').setup({
            windows = { preview = true }
         })
         vim.keymap.set('n', '-', '<cmd>lua MiniFiles.open()<cr>')
      end
   },
   -- Navigation
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
