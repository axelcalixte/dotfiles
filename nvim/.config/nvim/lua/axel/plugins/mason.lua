local servers = require("axel.tables.servers")

return {
    'neovim/nvim-lspconfig',
    dependencies = {
         'williamboman/mason.nvim',
        {
            'williamboman/mason-lspconfig.nvim',
            { 'j-hui/fidget.nvim', opts = {} },
            { 'folke/neodev.nvim', opts = {} }
        },
    }
}
