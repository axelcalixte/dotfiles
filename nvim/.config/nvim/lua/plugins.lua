return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use 'Shatur/neovim-ayu'
    use 'arcticicestudio/nord-vim'
	use {
		'hoob3rt/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}
	use 'neovim/nvim-lspconfig'
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	use 'hrsh7th/nvim-compe'
	use 'L3MON4D3/LuaSnip'
	use 'rafamadriz/friendly-snippets'

	use 'windwp/nvim-autopairs'

	use {
  		'nvim-telescope/telescope.nvim',
  		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	}

end)
