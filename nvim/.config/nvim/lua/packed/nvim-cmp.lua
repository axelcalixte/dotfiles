-- luasnip setup
local luasnip = require("luasnip")

local kind_icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

-- nvim-cmp setup
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		--[[ ["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }), ]]
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "buffer", keyword_length = 4 },
	},
	formatting = {
		format = function(entry, vim_item)
			-- Kind icons
			-- vim_item.kind = string.format("%s  %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind]) -- This concatonates the icons with the name of the item kind
			-- Source
			vim_item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				latex_symbols = "[LaTeX]",
			})[entry.source.name]
			return vim_item
		end,
	},
	experimental = {
		native_menu = false,
		ghost_text = false,
	},
})

-- <c-k> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.
vim.keymap.set({ "i", "s" }, "<c-j>", function()
	if luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	end
end, { silent = true })

-- <c-j> is my jump backwards key.
-- this always moves to the previous item within the snippet
vim.keymap.set({ "i", "s" }, "<c-k>", function()
	if luasnip.jumpable(-1) then
		luasnip.jump(-1)
	end
end, { silent = true })

require("luasnip.loaders.from_vscode").lazy_load()
