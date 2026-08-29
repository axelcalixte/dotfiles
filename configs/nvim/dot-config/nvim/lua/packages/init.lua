vim.pack.add({
      -- lsps
      "https://github.com/mfussenegger/nvim-jdtls",
      -- "https://github.com/nvim-treesitter/nvim-treesitter",

      -- utils
      "https://github.com/tpope/vim-dispatch",

      -- beauty
      "https://github.com/nvim-lualine/lualine.nvim",
      "https://github.com/miikanissi/modus-themes.nvim",

      -- filetypes
      "https://github.com/habamax/vim-asciidoctor",
   })


vim.cmd("colorscheme modus")

local utils = require('utils')
local m = utils.map

require("lualine").setup()

m("n", "<leader>u", "<cmd>UndotreeToggle<cr>")
require("mini.surround").setup()
require("mini.trailspace").setup({
   even_in_insert_mode = true
})

local hipatterns = require('mini.hipatterns')
hipatterns.setup({
   highlighters = {
      fixme     = { pattern = 'FIXME', group = 'MiniHipatternsFixme' },
      hack      = { pattern = 'HACK', group = 'MiniHipatternsHack' },
      todo      = { pattern = 'TODO', group = 'MiniHipatternsTodo' },
      note      = { pattern = 'NOTE', group = 'MiniHipatternsNote' },
      hex_color = hipatterns.gen_highlighter.hex_color(),
   }
})
