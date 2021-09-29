vim.o.termguicolors = true
vim.cmd('colorscheme nord')
-- vim.g.rose_pine_variant = 'base'
-- vim.g.rose_pine_disable_italics = false
-- vim.g.rose_pine_disable_background = false
-- vim.cmd('colorscheme rose-pine')

require'nvim-web-devicons'.setup {
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}

require'lualine'.setup {
	options = {
		icons_enabled = true,
		theme = 'rose-pine',
		component_separators = {'', ''},
		section_separators = {'', ''},
		disabled_filetypes = {}
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch'},
		lualine_c = {'filename'},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	extensions = {}
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "c", "lua", "java" },
  highlight = {
    enable = true,              -- false will disable the whole extension
  }
}