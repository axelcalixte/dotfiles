--[[ Comment.nvim ]]
require("Comment").setup()

--[[ fzf-lua ]]
require("fzf-lua").setup({
	lsp = {
		-- make lsp requests synchronous so they work with null-ls
		async_or_timeout = 3000,
	},
})

vim.keymap.set("n", "<leader><leader>", "<cmd>lua require('fzf-lua').builtin()<cr>")
vim.keymap.set("n", "<leader>ff", "<cmd>lua require('fzf-lua').files()<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>lua require('fzf-lua').grep()<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>lua require('fzf-lua').buffers()<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>lua require('fzf-lua').help_tags()<cr>")

--[[ Gitsigns ]]
require("gitsigns").setup({
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		-- Actions
		map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
		map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
		map("n", "<leader>hS", gs.stage_buffer)
		map("n", "<leader>hu", gs.undo_stage_hunk)
		map("n", "<leader>hR", gs.reset_buffer)
		map("n", "<leader>hp", gs.preview_hunk)
		map("n", "<leader>hb", function()
			gs.blame_line({ full = true })
		end)
		map("n", "<leader>tb", gs.toggle_current_line_blame)
		map("n", "<leader>hd", gs.diffthis)
		map("n", "<leader>hD", function()
			gs.diffthis("~")
		end)
		map("n", "<leader>td", gs.toggle_deleted)

		-- Text object
		map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
	end,
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	},
})

