vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
   vim.fn.system {
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      lazypath,
   }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
   { import = 'axel.plugins' },
}, {})


-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'
local servers = require('axel.tables.servers')
local capabilities = require('axel.tables.capabilities')
local on_attach = require('axel.tables.on_attach')

-- Setup mason so it can manage external tooling
require('mason').setup()

mason_lspconfig.setup {
   ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
   function(server_name)
      require('lspconfig')[server_name].setup {
         capabilities = capabilities,
         on_attach = on_attach,
         settings = servers[server_name],
      }
   end,
}
