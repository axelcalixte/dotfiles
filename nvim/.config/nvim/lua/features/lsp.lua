return {
   {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'dev-v3',
      lazy = true,
      config = false,
   },
   {
      'williamboman/mason.nvim',
      cmd = { 'Mason', 'MasonInstall', 'MasonUpdate' },
      lazy = true,
      config = true,
   },
   -- General LSP
   {
      'williamboman/mason-lspconfig.nvim',
      cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
      event = { 'BufReadPre', 'BufNewFile' },
      dependencies = {
         { 'neovim/nvim-lspconfig' },
         { 'hrsh7th/cmp-nvim-lsp' },
         { 'hrsh7th/cmp-nvim-lsp-signature-help' },
      },
      config = function()
         local lsp = require('lsp-zero').preset({})

         lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({ buffer = bufnr })
         end)


         lsp.setup_servers({ 'lua_ls' })
         require('mason-lspconfig').setup({
            ensure_installed = { 'lua_ls', 'jdtls', 'pylsp' },
            handlers = {
               lsp.default_setup,
               lua_ls = function()
                  require 'lspconfig'.lua_ls.setup {
                     settings = {
                        Lua = {
                           diagnostics = {
                              -- Get the language server to recognize the `vim` global
                              globals = { 'vim' },
                           },
                           workspace = {
                              -- Make the server aware of Neovim runtime files
                              library = vim.api.nvim_get_runtime_file("", true),
                           },
                           -- Do not send telemetry data containing a randomized but unique identifier
                           telemetry = {
                              enable = false,
                           },
                        },
                     }
                  }
               end,
               pylsp = function()
                  require('lspconfig').pylsp.setup({
                     settings = {
                        pylsp = {
                           plugins = {
                              ruff = {
                                 enabled = true,
                                 extendSelect = { "I" },
                              },
                              autopep8 = {
                                 enabled = false
                              },
                              yapf = {
                                 enabled = false
                              },
                              black = {
                                 enabled = true
                              },
                              mypy = {
                                 enabled = false
                              }
                           }
                        }
                     }
                  })
               end
            },
         })
      end
   },
   -- Java LSP adapter
   "mfussenegger/nvim-jdtls"
}
