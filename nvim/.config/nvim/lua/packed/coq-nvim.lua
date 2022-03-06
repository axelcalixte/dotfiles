-- COQ settings
--require("coq").setup({
vim.g.coq_settings = {
	display = {
		icons = {
			mode = "short",
		},
		pum = {
			source_context = { "[", "]" },
			kind_context = { " ", " " },
		},
		preview = {
			border = "double",
			positions = {
				north = 2,
				south = null,
				west = null,
				east = 1,
			},
		},
	},
	clients = {
		tabnine = { enabled = false },
	},
}
-- })
