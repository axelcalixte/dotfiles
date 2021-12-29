return require("packer").startup(function()
	use("wbthomason/packer.nvim")
	--use("arcticicestudio/nord-vim")
	use({
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			vim.g.rose_pine_variant = "base"
			vim.g.rose_pine_disable_italics = true
			vim.cmd("colorscheme rose-pine")
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use("neovim/nvim-lspconfig")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	use("windwp/nvim-autopairs")

	--use({"mfussenegger/nvim-jdtls", ft = { "java" }})


    use { 'ibhagwan/fzf-lua',
  -- optional for icon support
  requires = { 'kyazdani42/nvim-web-devicons' }
}
	-- use({
	-- 	"nvim-telescope/telescope.nvim",
	-- 	requires = {
	-- 		{ "nvim-lua/plenary.nvim" },
	-- 		{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
	-- 	},
	-- })
	use({ "ms-jpq/coq_nvim", branch = "coq" }) -- main one
	use({ "ms-jpq/coq.artifacts", branch = "artifacts" }) -- 9000+ Snippets

	use({ "jose-elias-alvarez/null-ls.nvim", requires = {
		"nvim-lua/plenary.nvim",
	} })

	--[[ use({
		"luukvbaal/stabilize.nvim",
		config = function()
			require("stabilize").setup()
		end,
	}) ]]

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
end)
