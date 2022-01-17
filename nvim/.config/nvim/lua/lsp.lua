-----------------------------------
--           COQ setup           --
-----------------------------------
vim.g.coq_settings = { ["auto_start"] = "shut-up" }

local coq = require("coq")

vim.g.coq_settings = {
	display = {
		icons = {
			mode = "short",
		},
		pum = {
			source_context = { "[", "]" },
		},
		preview = {
			border = "rounded",
			positions = {
				north = 3,
				south = 2,
				west = 1,
				east = 4,
			},
		},
	},
}

-----------------------------------
--        nvim-autopairs         --
-----------------------------------
local remap = vim.api.nvim_set_keymap
local npairs = require("nvim-autopairs")

npairs.setup({
	map_cr = true, --  map <CR> on insert mode
	map_complete = true, -- it will auto insert `(` after select function or method item
	enable_check_bracket_line = false, -- don't add pairs if a closing pair is already present on the line
	map_bs = false,
})

-- skip it, if you use another global object
_G.MUtils = {}

MUtils.CR = function()
	if vim.fn.pumvisible() ~= 0 then
		if vim.fn.complete_info({ "selected" }).selected ~= -1 then
			return npairs.esc("<c-y>")
		else
			return npairs.esc("<c-e>") .. npairs.autopairs_cr()
		end
	else
		return npairs.autopairs_cr()
	end
end
remap("i", "<cr>", "v:lua.MUtils.CR()", { expr = true, noremap = true })

MUtils.BS = function()
	if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ "mode" }).mode == "eval" then
		return npairs.esc("<c-e>") .. npairs.autopairs_bs()
	else
		return npairs.autopairs_bs()
	end
end
remap("i", "<bs>", "v:lua.MUtils.BS()", { expr = true, noremap = true })

npairs.setup({})

-----------------------------------
--         telescope             --
-----------------------------------
require("fzf-lua").setup({
    lsp = {
        -- make lsp requests synchronous so they work with null-ls
        async_or_timeout = 3000,
    },
})

-----------------------------------
--     Language Servers          --
-----------------------------------
local system_name = "Linux"
-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = "/home/axel/.local/share/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server"

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("lspconfig").sumneko_lua.setup(coq.lsp_ensure_capabilities({
	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
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
}))
-- if vim.fn.has("nvim-0.5") then
-- 	vim.cmd([[
--     augroup lsp
--     au!
--     au FileType java lua require('jdtls').start_or_attach({cmd = {'jdtls.sh'}})
--     augroup end
--   ]])
-- end
--
-- -- find_root looks for parent directories relative to the current buffer containing one of the given arguments.
-- vim.cmd(
-- 	[[ autocmd FileType java lua require('jdtls').start_or_attach({ cmd = {'jdtls.sh', '/home/axel/.config/jdtls-workspace' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')}, root_dir = require('jdtls.setup').find_root({'gradle.build', 'pom.xml'}) }) ]]
-- )

-----------------------------------
--     lspconfig and null-ls     --
-----------------------------------

local nvim_lsp = require("lspconfig")
local null_ls = require("null-ls")

vim.cmd([[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]])
vim.cmd([[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = true,
})

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

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- formatting on save
	if client.resolved_capabilities.document_formatting then
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	end

	-- adding borders to lsp hover windows
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })

	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	--Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.trim_whitespace,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.shellcheck,
		null_ls.builtins.formatting.prettierd.with({
			filetypes = { "html", "json", "yaml", "markdown", "javascript", "typescript" },
		}),
        null_ls.builtins.diagnostics.chktex,
	},
})

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "tsserver", "ccls", "bashls", "html", "cssls", "jedi_language_server" }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup(coq.lsp_ensure_capabilities({
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 500,
		},
	}))
end
