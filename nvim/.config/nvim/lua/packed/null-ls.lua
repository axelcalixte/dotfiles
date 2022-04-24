-- null-ls
-- Provides formatting, diagnostics and more (alternative to lspconfig or complements it)
local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua, -- formatter for lua files
		null_ls.builtins.formatting.eslint_d,
		null_ls.builtins.formatting.prettierd.with({
			filetypes = {
				"html",
				"json",
				"yaml",
				"markdown",
				--				"javascript",
				--				"typescript",
				"css",
				--				"javascriptreact",
				--				"typescriptreact",
			},
		}),
		--null_ls.builtins.formatting.clang_format,
		null_ls.builtins.diagnostics.shellcheck, -- diagnostics for shellscripts
		-- null_ls.builtins.diagnostics.chktex, -- diagnostics for latex
		null_ls.builtins.completion.spell.with({
			filetypes = {
				"md",
				--"tex",
			},
		}), -- dictionnary word of spellang setting
		--null_ls.builtins.code_actions.gitsigns, -- null-ls integration with gitsigns plugin
	},
	on_attach = function(client) end,
})
