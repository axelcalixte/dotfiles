return require("packer").startup(function()
	use({"wbthomason/packer.nvim"})
	use({"arcticicestudio/nord-vim"})
	use({ "rose-pine/neovim" })
	use({ "catppuccin/nvim", as = "catpuccin" })
    use({ "rebelot/kanagawa.nvim" })

	use({ "norcalli/nvim-colorizer.lua" })

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use("neovim/nvim-lspconfig")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	use("windwp/nvim-autopairs")

	--use({"mfussenegger/nvim-jdtls", ft = { "java" }})

	use({
		"ibhagwan/fzf-lua",
		requires = { "kyazdani42/nvim-web-devicons" },
	})

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

	use("lervag/vimtex")
end)
