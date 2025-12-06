local M = {}

M.list = {
   "savq/paq-nvim",

   -- lsps
   "neovim/nvim-lspconfig",
   "mfussenegger/nvim-jdtls",

   -- treesitter
   { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
   "nvim-treesitter/nvim-treesitter-context",
   "nvim-treesitter/nvim-treesitter-textobjects",

   -- utils
   "tpope/vim-dispatch",
   "nvim-mini/mini.nvim",
   "folke/snacks.nvim",
   "mbbill/undotree",

   -- beauty
   "nvim-lualine/lualine.nvim",
   "miikanissi/modus-themes.nvim",

   -- filetypes
   "habamax/vim-asciidoctor",

   -- git
   "tpope/vim-fugitive",
   "lewis6991/gitsigns.nvim",

   -- ddb
   "tpope/vim-dadbod",
   "kristijanhusak/vim-dadbod-ui",
   "kristijanhusak/vim-dadbod-completion",
}

-- local ok, gitsigns = pcall(require, "gitsigns")
-- if ok then
--    gitsigns.setup(require("packages.configs.gitsigns"))
-- end
--
-- local ok, fzf_lua = pcall(require, "fzf-lua")
-- if ok then
--    local fzf_configs = require("packages.configs.fzf-lua")
--    fzf_lua.setup(fzf_configs.conf)
--    fzf_configs.mappings(fzf_lua)
--    fzf_configs.register(fzf_lua)
-- end
--
-- local ok, auto_session = pcall(require, "auto-session")
-- if ok then
--    local auto_session_configs = require("packages.configs.auto-session")
--    auto_session.setup(auto_session_configs.conf)
--    auto_session_configs.mappings()
-- end

-- The goal is to have as many setup hooks as possible
M.setup = function()

vim.cmd("colorscheme modus")

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

require("gitsigns").setup({
   on_attach = function()
      local map = require("utils").map
      local gitsigns = require "gitsigns"
      map('n', ']g', function()
         if vim.wo.diff then
            vim.cmd.normal({ ']g', bang = true })
         else
            gitsigns.nav_hunk('next')
            gitsigns.preview_hunk_inline()
         end
      end)

      map('n', '[g', function()
         if vim.wo.diff then
            vim.cmd.normal({ '[g', bang = true })
         else
            gitsigns.nav_hunk('prev')
            gitsigns.preview_hunk_inline()
         end
      end)

      map('n', '<leader>gu', gitsigns.reset_hunk)
      map('v', '<leader>gu', function()
         gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end)
      map('n', '<leader>gU', gitsigns.reset_buffer)

      map('n', '<leader>gb', function()
         gitsigns.blame_line({ full = true })
      end)

      map('n', '<leader>gd', gitsigns.diffthis)
   end
})

require("lualine").setup()
require 'nvim-treesitter.configs'.setup({
   highlight = {
      enable = true
   },
   indent = {
      enable = true
   },
})

m("n", "<leader>u", "<cmd>UndotreeToggle<cr>")
require("mini.surround").setup()
require("mini.files").setup({
   windows = {preview = true, width_preview = 50}
})
m("n", "<leader>e", function() MiniFiles.open() end)
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

end

return M
