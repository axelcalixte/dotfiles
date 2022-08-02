return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'rebelot/kanagawa.nvim'
    use { 'loganswartz/selenized.nvim',
        requires = {
            'rktjmp/lush.nvim'
        }
    }
    use 'lukas-reineke/indent-blankline.nvim'

    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    use 'machakann/vim-sandwich'
    use {'ibhagwan/fzf-lua', requires = {'kyazdani42/nvim-web-devicons'}}
    use 'numToStr/Comment.nvim'
    use {'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' }}
    use 'ludovicchabant/vim-gutentags'

    use 'jose-elias-alvarez/null-ls.nvim'
    use 'neovim/nvim-lspconfig'
    use 'mfussenegger/nvim-jdtls'
    use {'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path' }}
    use {'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' }}
    use 'rafamadriz/friendly-snippets'

    use 'mfussenegger/nvim-dap'
    use 'theHamsta/nvim-dap-virtual-text'

    use { 'lervag/vimtex', opt = true }
end)
