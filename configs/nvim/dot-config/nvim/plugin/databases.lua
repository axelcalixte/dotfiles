vim.pack.add({
   "https://github.com/tpope/vim-dadbod",
   "https://github.com/kristijanhusak/vim-dadbod-ui",
   -- vim-dadbod-completion in completions.lua
})

vim.keymap.set({"n"}, "<leader>x", "vip<Plug>(DBUI_ExecuteQuery)<cr>")
