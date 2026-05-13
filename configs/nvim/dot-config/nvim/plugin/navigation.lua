vim.pack.add({
   "https://github.com/folke/snacks.nvim",
   "https://github.com/nvim-mini/mini.nvim",
})

local utils = require('utils')
local m = utils.map
m({ "n" }, '<leader>ff', function() Snacks.picker.files() end, { silent = true })
m({ "n" }, '<leader><leader>', function() Snacks.picker.buffers() end, { silent = true })
m({ "n" }, '<leader>fh', function() Snacks.picker.help() end, { silent = true })
m({ "n" }, '<leader>fg', function() Snacks.picker.grep() end, { silent = true })
m({ "n" }, '<leader>fd', function() Snacks.picker.diagnostics_buffer() end, { silent = true })
m({ "n" }, '<leader>fD', function() Snacks.picker.diagnostics() end, { silent = true })
m({ "n" }, '<leader>fs', function() Snacks.picker.lsp_symbols() end, { silent = true })
m({ "n" }, "<leader>cd", function()
   local dir_list = utils.get_directories({ '~/Documents/projects', '~/.config' })
   Snacks.picker.select(
      dir_list,
      { prompt = "Change working directory" },
      function(choice)
         if choice then
            vim.cmd("cd " .. choice)
         end
      end)
end, { silent = true })

require("mini.files").setup({
   windows = {preview = true, width_preview = 50}
})
m("n", "<leader>e", function() MiniFiles.open() end)
