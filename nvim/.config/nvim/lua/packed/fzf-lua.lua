-- fzf-lua
require("fzf-lua").setup({
	lsp = {
		-- make lsp requests synchronous so they work with null-ls
		async_or_timeout = 3000,
	},
})

