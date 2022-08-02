-- Global settings
--vim.g.selenized_variant = "bw" -- or "normal"
vim.o.background = "light"
vim.o.termguicolors = true
vim.o.colorcolumn = "80"

-- Indent_Blankline configuration
require("indent_blankline").setup({
	char = "┊",
	show_trailing_blankline_indent = false,
})

-- Theme customization
require('kanagawa').setup({
    undercurl = true,           -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = true},
    specialReturn = true,       -- special highlight for the return keyword
    specialException = true,    -- special highlight for exception handling keywords
    transparent = false,        -- do not set background color
    dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
    globalStatus = false,       -- adjust window separators highlight for laststatus=3
    colors = {},
    overrides = {},
})

local colors = "selenized"

-- setting the colorscheme
vim.cmd("colorscheme " .. colors)

-- only a small bar separates the splits
vim.cmd("highligh WinSeparator guibg=None") -- if globalstatus = true

-- future option to hide the (:command | messages) lines in 0.8

-- Treesitter configuration
require("nvim-treesitter.configs").setup({
	ensure_installed = { "javascript", "c", "lua", "html", "css", "latex", "python", "java", "norg" },
	highlight = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	indent = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
	},
})

