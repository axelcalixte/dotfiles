vim.pack.add({
   "https://github.com/neovim/nvim-lspconfig",
   "https://github.com/rgroli/other.nvim",
   "https://codeberg.org/mfussenegger/nvim-lint"
})

vim.lsp.enable({"angularls", "cssls", "vtsls"})

require("lint").linters_by_ft = {
     typescript = {'eslint'},
     scss = {'eslint'},
     css = {'eslint'},
     html = {'eslint'},
}
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

require("other-nvim").setup({
       mappings = {
          "angular"
       },
       rememberBuffers = false
})
vim.keymap.set("n", "<leader>o", "<cmd>:Other<CR>")
