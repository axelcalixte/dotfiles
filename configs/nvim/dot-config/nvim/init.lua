require "options"
require "mappings"
require "commands"
require "lsp"
require "packages"

vim.pack.add({
   {
      src = "https://github.com/saghen/blink.cmp",
      version = vim.version.range("v1.x"),
   },
   "https://github.com/rafamadriz/friendly-snippets"
})

require('blink.cmp').setup({
   keymap = {
      preset = 'default',
   },
   appearance = {
      nerd_font_variant = 'mono',
   },
   completion = {
      documentation = { auto_show = false, auto_show_delay_ms = 500 },
   },
   sources = {
      min_keyword_length = 3,
      default = { 'lsp', 'path', 'snippets', 'buffer' },
   },
   -- snippets = { preset = 'luasnip' }, -- if I want to add my own mappings
   fuzzy = { implementation = 'lua' }, -- TODO: switch to rust fuzzy matcher when v2.x becomes stable
   signature = { enabled = true },
})
