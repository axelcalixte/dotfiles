vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
   vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
   })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
   { "echasnovski/mini.surround",  version = "*", opts = {} },
   {
      "echasnovski/mini.hipatterns",
      version = "*",
      config = function()
         local hipatterns = require "mini.hipatterns"
         hipatterns.setup {
            highlighters = {
               -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
               fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
               hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
               todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
               note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

               -- Highlight hex color strings (`#rrggbb`) using that color
               hex_color = hipatterns.gen_highlighter.hex_color(),
            },
         }
      end,
   },
   { "echasnovski/mini.comment",   version = "*", opts = {} },
   { 'echasnovski/mini.bracketed', version = '*', opts = {} },
   -- History of buffer changes in a tree view
   {
      'mbbill/undotree',
      keys = {
         { "<leader>u", vim.cmd.UndotreeToggle, desc = "UndoTree" },
      },
   },
   { import = 'features' },
}, { lazy = true })
