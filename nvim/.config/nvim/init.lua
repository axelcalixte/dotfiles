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
local servers = require('axel.tables.servers')
local capabilities = require('axel.tables.capabilities')
local on_attach = require('axel.tables.on_attach')


require('mason-lspconfig').setup_handlers {
   function(server_name)
      require('lspconfig')[server_name].setup {
         capabilities = capabilities,
         on_attach = on_attach,
         settings = servers[server_name],
      }
   end,
}
