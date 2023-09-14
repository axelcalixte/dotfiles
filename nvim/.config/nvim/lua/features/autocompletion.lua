return {
   {
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      dependencies = {
         { 'hrsh7th/cmp-path' },
         { 'L3MON4D3/LuaSnip' },
         { 'saadparwaiz1/cmp_luasnip' },
         { 'rafamadriz/friendly-snippets' },
      },
      config = function()
         local lsp_zero = require('lsp-zero')
         lsp_zero.extend_cmp()

         local cmp = require('cmp')
         local cmp_action = lsp_zero.cmp_action()

         require("luasnip.loaders.from_vscode").lazy_load()

         cmp.setup({
            formatting = lsp_zero.cmp_format(),
            mapping = {
               ['<CR>'] = cmp.mapping.confirm({ select = false }),
               ['<C-p>'] = cmp.mapping(function()
                  if cmp.visible() then
                     cmp.select_prev_item()
                  else
                     cmp.complete()
                  end
               end),
               ['<C-n>'] = cmp.mapping(function()
                  if cmp.visible() then
                     cmp.select_next_item()
                  else
                     cmp.complete()
                  end
               end),
               ['<C-u>'] = cmp.mapping.scroll_docs(-4),
               ['<C-d>'] = cmp.mapping.scroll_docs(4),
               ['<C-j>'] = cmp_action.luasnip_jump_forward(),
               ['<C-k>'] = cmp_action.luasnip_jump_backward(),
            },
            sources = {
               { name = 'nvim_lsp' },
               { name = 'luasnip' },
               { name = 'path' },
               { name = 'nvim_lsp_signature_help' },
            }
         })
      end
   },
}
