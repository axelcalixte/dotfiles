-- null-ls
-- Provides formatting, diagnostics and more (alternative to lspconfig or complements it)
local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettierd.with({
			filetypes = { "html", "json", "yaml", "markdown", "javascript", "typescript", "css" },
		}),
		null_ls.builtins.formatting.stylua, -- formatter for lua files
		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.diagnostics.shellcheck, -- diagnostics for shellscripts
		null_ls.builtins.diagnostics.chktex, -- diagnostics for latex
		null_ls.builtins.completion.spell, -- dictionnary word of spellang setting
		null_ls.builtins.code_actions.gitsigns, -- null-ls integration with gitsigns plugin
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
							augroup LspFormatting
	autocmd! * <buffer>
	autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
	augroup END
	]])
		end
	end,
})
