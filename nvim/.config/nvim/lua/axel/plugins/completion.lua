return {
   'hrsh7th/nvim-cmp',
   dependencies = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-nvim-lsp-signature-help', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets' },
   config = function()
      -- nvim-cmp setup
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'

      local kind_icons = {
         Text = "",
         Method = "",
         Function = "",
         Constructor = "",
         Field = "",
         Variable = "",
         Class = "ﴯ",
         Interface = "",
         Module = "",
         Property = "ﰠ",
         Unit = "",
         Value = "",
         Enum = "",
         Keyword = "",
         Snippet = "",
         Color = "",
         File = "",
         Reference = "",
         Folder = "",
         EnumMember = "",
         Constant = "",
         Struct = "",
         Event = "",
         Operator = "",
         TypeParameter = "",
      }

      luasnip.config.setup {}
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup {
         snippet = {
            expand = function(args)
               luasnip.lsp_expand(args.body)
            end,
         },
         mapping = cmp.mapping.preset.insert {
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete {},
                ['<CR>'] = cmp.mapping.confirm {
               behavior = cmp.ConfirmBehavior.Replace,
               select = true,
            },
         },
         sources = {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'buffer',  keyword_length = 4 },
            { name = 'nvim_lsp_signature_help' },
         },
         formatting = {
            format = function(entry, vim_item)
               -- Kind icons
               vim_item.kind = string.format("%s", kind_icons[vim_item.kind]) -- This concatonates the icons with the name of the item kind
               -- Source
               vim_item.menu = ({
                      buffer = "[Buffer]",
                      nvim_lsp = "[LSP]",
                      luasnip = "[LuaSnip]",
                      nvim_lua = "[Lua]",
                      latex_symbols = "[LaTeX]",
                   })[entry.source.name]
               return vim_item
            end,
         },
      }
      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      require("axel.tables.capabilities")
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      -- <c-k> is my expansion key
      -- this will expand the current item or jump to the next item within the snippet.
      vim.keymap.set({ "i", "s" }, "<c-j>", function()
         if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
         end
      end, { silent = true })

      -- <c-j> is my jump backwards key.
      -- this always moves to the previous item within the snippet
      vim.keymap.set({ "i", "s" }, "<c-k>", function()
         if luasnip.jumpable(-1) then
            luasnip.jump(-1)
         end
      end, { silent = true })
   end,
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=3 sts=3 sw=3 et
