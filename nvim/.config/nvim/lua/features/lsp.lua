return {
   {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      lazy = true,
      config = false,
      init = function()
         -- Disable automatic setup, we are doing it manually
         vim.g.lsp_zero_extend_cmp = 0
         vim.g.lsp_zero_extend_lspconfig = 0
      end,
   },
   {
      'williamboman/mason.nvim',
      lazy = false,
      config = true,
   },
   {
      'stevearc/conform.nvim',
      opts = {
         formatters_by_ft = {
            lua = { "stylua" },
            html = { "prettierd" },
            css = { "prettierd" },
            javascriptreact = { "prettierd" },
            javascript = { "prettierd" },
            typescriptreact = { "prettierd" },
            typescript = { "prettierd" },
         },
         format_on_save = {
            timeout_ms = 500,
            lsp_fallback = "true",
         },
      },
   },
   -- General LSP
   {
      'neovim/nvim-lspconfig',
      cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
      event = { 'BufReadPre', 'BufNewFile' },
      dependencies = {
         { 'williamboman/mason-lspconfig.nvim' },
         { 'hrsh7th/cmp-nvim-lsp' },
         { 'hrsh7th/cmp-nvim-lsp-signature-help' },
      },
      config = function()
         local lsp_zero = require('lsp-zero')
         lsp_zero.extend_lspconfig()

         lsp_zero.on_attach(function(client, bufnr)
            lsp_zero.default_keymaps({ buffer = bufnr })
         end)


         require('mason-lspconfig').setup({
            ensure_installed = { 'lua_ls' },
            handlers = {
               lsp_zero.default_setup,
               lua_ls = function()
                  local lua_opts = lsp_zero.nvim_lua_ls()
                  require 'lspconfig'.lua_ls.setup(lua_opts)
               end,
               pylsp = function()
                  require('lspconfig').pylsp.setup({
                     settings = {
                        pylsp = {
                           -- pylsp plugins are installed manually in its pipx env
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
