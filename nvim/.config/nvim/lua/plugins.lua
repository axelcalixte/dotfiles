-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
-- thanks to Allaman on Github
function get_config(name)
	return string.format('require("packed/%s")', name)
end

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- Package manager
	use({ "numToStr/Comment.nvim", config = get_config("comment-nvim") }) -- "gc" to comment visual regions/lines
	use("ludovicchabant/vim-gutentags") -- Automatic tags management
	-- UI to select things (files, grep results, open buffers...)
	use({ "ibhagwan/fzf-lua", requires = { "kyazdani42/nvim-web-devicons" }, config = get_config("fzf-lua") })
	use({ "rebelot/kanagawa.nvim", config = get_config("colorscheme") })
	use({ "nvim-lualine/lualine.nvim", config = get_config("lualine") }) -- Fancier statusline
	-- Add indentation guides even on blank lines
	use("lukas-reineke/indent-blankline.nvim")
	-- surround text objects
	use("machakann/vim-sandwich")
	-- Add git related info in the signs columns and popups
	use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" }, config = get_config("gitsigns") })
	-- Highlight, edit, and navigate code using a fast incremental parsing library
	use({ "nvim-treesitter/nvim-treesitter", config = get_config("treesitter") })
	-- Additional textobjects for treesitter
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use({ "neovim/nvim-lspconfig", config = get_config("lspconfig") }) -- Collection of configurations for built-in LSP client
	use({ "ms-jpq/coq_nvim", branch = "coq", run = ":COQnow", config = get_config("coq-nvim") }) -- main one
	use({ "ms-jpq/coq.artifacts", branch = "artifacts" }) -- 9000+ Snippets
	use({ "lervag/vimtex", ft = "tex" }) --, config = get_config("vimtex"))
	use({ "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" }, config = get_config("null-ls") })
	-- Trying plugins
	use({ "j-hui/fidget.nvim", config = get_config("fidget-nvim") })
	use({
		"nvim-neorg/neorg",
		requires = "nvim-lua/plenary.nvim",
	})
end)

vim.cmd([[
	augroup Packer
		autocmd!
		autocmd BufWritePost init.lua PackerCompile
	augroup end
]])
