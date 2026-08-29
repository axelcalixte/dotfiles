vim.pack.add({"https://github.com/folke/snacks.nvim"})

local utils = require("utils")

local snacks = require("snacks")
snacks.setup({
   picker = {
      layout = {
         preset = "ivy_split"
      }
   }
})

local picker = snacks.picker
vim.keymap.set("n", "<leader><leader>", function() picker.smart() end)
vim.keymap.set("n", "<leader>fb", function() picker.buffers() end)
vim.keymap.set("n", "<leader>fg", function() picker.grep() end)
vim.keymap.set("n", "<leader>fk", function() picker.keymaps() end)
vim.keymap.set("n", "<leader>ff", function()
   if vim.fs.root(0, ".git") == nil then
      picker.files()
   else
      picker.git_files()
   end
end)
vim.keymap.set("n", "<leader>cd", function()
   picker.projects({
      dev = {"~/Projects"},
      patterns = {".git", "pom.xml", "package.json"},
      max_depth = 4,
   })
end)

vim.keymap.set("n", "gO", function() picker.lsp_symbols() end)
vim.keymap.set("n", "grr", function() picker.lsp_references() end)
vim.keymap.set("n", "<c-w>D", function() picker.diagnostics() end)
