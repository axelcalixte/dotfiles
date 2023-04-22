local servers = require("axel.tables.servers")

return {
   {
      'neovim/nvim-lspconfig',
      dependencies = {
         { 'williamboman/mason.nvim', opts = {} },
         {
            'williamboman/mason-lspconfig.nvim',
            opts = {
               ensure_installed = vim.tbl_keys(servers)
            }
         },
         { 'j-hui/fidget.nvim',       opts = {} },
         { 'folke/neodev.nvim',       opts = {} }
      },
   },
   {
      'jose-elias-alvarez/null-ls.nvim',
      dependencies = {
         { 'williamboman/mason.nvim', opts = {} },
         {
            'jay-babu/mason-null-ls.nvim',
            opts = {
               automatic_setup = true,
               handlers = {}
            }
         }
      }
   }
}
