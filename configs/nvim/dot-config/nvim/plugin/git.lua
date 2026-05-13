vim.pack.add({
   "https://github.com/tpope/vim-fugitive",
   "https://github.com/lewis6991/gitsigns.nvim",
})

require("gitsigns").setup({
   on_attach = function()
      local map = require("utils").map
      local gitsigns = require "gitsigns"
      map('n', ']g', function()
         if vim.wo.diff then
            vim.cmd.normal({ ']g', bang = true })
         else
            gitsigns.nav_hunk('next')
            gitsigns.preview_hunk()
         end
      end)

      map('n', '[g', function()
         if vim.wo.diff then
            vim.cmd.normal({ '[g', bang = true })
         else
            gitsigns.nav_hunk('prev')
            gitsigns.preview_hunk()
         end
      end)

      map('n', '<leader>gu', gitsigns.reset_hunk)
      map('v', '<leader>gu', function()
         gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end)
      map('n', '<leader>gU', gitsigns.reset_buffer)

      map('n', '<leader>gb', function()
         gitsigns.blame_line({ full = true })
      end)

      map('n', '<leader>gd', gitsigns.diffthis)
   end
})


