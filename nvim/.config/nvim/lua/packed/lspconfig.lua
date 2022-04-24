-- LSP settings
local lspconfig = require("lspconfig")

vim.cmd([[autocmd ColorScheme * highlight NormalFloat guibg=#1F1F28]])
vim.cmd([[autocmd ColorScheme * highlight FloatBorder guifg=#DCD7BA guibg=#1F1F28]])

local border = {
	{ "🭽", "FloatBorder" },
	{ "▔", "FloatBorder" },
	{ "🭾", "FloatBorder" },
	{ "▕", "FloatBorder" },
	{ "🭿", "FloatBorder" },
	{ "▁", "FloatBorder" },
	{ "🭼", "FloatBorder" },
	{ "▏", "FloatBorder" },
}

vim.diagnostic.config({
	virtual_text = {
		source = "if_many", -- Or "always"
	},
	float = {
		source = "always", -- Or "if_many"
	},
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = false,
})

local on_attach = function(_, bufnr)
	-- adding borders to lsp hover windows
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })

	local opts = { buffer = bufnr }
	vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.keymap.set("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	vim.keymap.set("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	vim.keymap.set("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	vim.keymap.set("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.keymap.set("n", "<leader>so", [[<cmd>lua require('fzf-lua').lsp_document_symbols()<CR>]], opts)
	vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting, {})
end

-- local coq = require("coq")
-- nvim-cmp supports additional completion capabilities
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- enable the following language servers
local servers = { "bashls", "cssls", "pylsp", "clangd" }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup(--[[coq.lsp_ensure_capabilities(]]
		{
			on_attach = on_attach,
			capabilities = capabilities,
			handlers = handlers,
			flags = {
				debounce_text_changes = 150,
			},
		}
	) --)
end

-- do something like this when you don't want the language server formatting
-- but prefer null-ls taking care of it
local servers_null_ls_formatting = { "tsserver", "html" }
for _, lspf in ipairs(servers_null_ls_formatting) do
	lspconfig[lspf].setup(--[[coq.lsp_ensure_capabilities(]]
		{
			on_attach = function(client)
				on_attach(client, bufnr) -- call the on_attach callback with all the lsp config
				client.resolved_capabilities.document_formatting = false
				client.resolved_capabilities.document_range_formatting = false
			end,
			capabilites = capabilities,
			handlers = handlers,
		}
	) --)
end
-- Example custom server
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

--[[ lspconfig.sumneko_lua.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}) ]]
