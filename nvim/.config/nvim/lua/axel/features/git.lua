return {
   {
      'tpope/vim-fugitive',
      keys = {
         { "<leader>gs", vim.cmd.Git },
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
            vim.keymap.set('n', '<leader>gh', require('gitsigns').preview_hunk,
            { buffer = bufnr, desc = 'Preview git hunk' })

            -- don't override the built-in and fugitive keymaps
            local gs = package.loaded.gitsigns
            vim.keymap.set({ 'n', 'v' }, ']g', function()
               if vim.wo.diff then
                  return ']g'
               end
               vim.schedule(function()
                  gs.next_hunk()
               end)
               return '<Ignore>'
            end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
            vim.keymap.set({ 'n', 'v' }, '[g', function()
               if vim.wo.diff then
                  return '[g'
               end
               vim.schedule(function()
                  gs.prev_hunk()
               end)
               return '<Ignore>'
            end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
         end
      }
   }
}
