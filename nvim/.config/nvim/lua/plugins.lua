return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use 'arcticicestudio/nord-vim'
	use {
		'hoob3rt/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}
	use 'neovim/nvim-lspconfig'
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	use 'windwp/nvim-autopairs'

	use 'mfussenegger/nvim-jdtls'

	use { 'ibhagwan/fzf-lua',
	requires = {
		'vijaymarupudi/nvim-fzf',
		'kyazdani42/nvim-web-devicons' } -- optional for icons
	}

	use { 'ms-jpq/coq_nvim', branch = 'coq'} -- main one
	use { 'ms-jpq/coq.artifacts', branch= 'artifacts'} -- 9000+ Snippets

end)
