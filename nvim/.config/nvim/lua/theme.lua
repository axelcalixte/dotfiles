vim.o.termguicolors = true
vim.cmd("colorscheme kanagawa")

require("colorizer").setup()

require("nvim-web-devicons").setup({
	default = true,
})

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "kanagawa",
		component_separators = { "", "" },
		section_separators = { "", "" },
		disabled_filetypes = {},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})

require("nvim-treesitter.configs").setup({
	ensure_installed = { "javascript", "c", "lua", "html", "css", "latex", "python" },
	highlight = {
		enable = true,
	},
})
