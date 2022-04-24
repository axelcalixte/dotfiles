--Set colorscheme
require("kanagawa").setup({ --those are the defaults
	undercurl = true, -- enable undercurls
	commentStyle = "italic",
	functionStyle = "NONE",
	keywordStyle = "italic",
	statementStyle = "bold",
	typeStyle = "NONE",
	variablebuiltinStyle = "italic",
	specialReturn = true, -- special highlight for the return keyword
	specialException = true, -- special highlight for exception handling keywords
	transparent = true, -- do not set background color
	dimInactive = true, -- dim inactive window `:h hl-NormalNC`
	colors = {},
	overrides = {},
})

--Set statusbar
require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "kanagawa",
		component_separators = "|",
		section_separators = "",
	},
})
