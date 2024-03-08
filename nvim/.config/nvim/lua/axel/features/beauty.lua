return {
   {
      -- Highlight, edit, and navigate code
      "nvim-treesitter/nvim-treesitter",
      dependencies = {
         "nvim-treesitter/nvim-treesitter-textobjects",
      },
      build = ":TSUpdate",
      config = function()
         require("nvim-treesitter.configs").setup({
            -- Add languages to be installed here that you want installed for treesitter
            ensure_installed = { "lua", "vimdoc", "python", "html", "css", "javascript", "typescript" },
            -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = {
               enable = true,
               keymaps = {
                  init_selection = "<c-space>",
                  node_incremental = "<c-space>",
                  scope_incremental = "<c-s>",
                  node_decremental = "<M-space>",
               },
            },
            textobjects = {
               select = {
                  enable = true,
                  lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                  keymaps = {
                     -- You can use the capture groups defined in textobjects.scm
                     ["aa"] = "@parameter.outer",
                     ["ia"] = "@parameter.inner",
                     ["af"] = "@function.outer",
                     ["if"] = "@function.inner",
                     ["ac"] = "@class.outer",
                     ["ic"] = "@class.inner",
                  },
               },
               move = {
                  enable = true,
                  set_jumps = true, -- whether to set jumps in the jumplist
                  goto_next_start = {
                     ["]m"] = "@function.outer",
                     ["]]"] = "@class.outer",
                  },
                  goto_next_end = {
                     ["]M"] = "@function.outer",
                     ["]["] = "@class.outer",
                  },
                  goto_previous_start = {
                     ["[m"] = "@function.outer",
                     ["[["] = "@class.outer",
                  },
                  goto_previous_end = {
                     ["[M"] = "@function.outer",
                     ["[]"] = "@class.outer",
                  },
               },
               swap = {
                  enable = true,
                  swap_next = {
                     ["<leader>a"] = "@parameter.inner",
                  },
                  swap_previous = {
                     ["<leader>A"] = "@parameter.inner",
                  },
               },
            },
         })
      end,
   },
   {
      "miikanissi/modus-themes.nvim",
      lazy = false,
      priority = 1000,
      config = function()
         require("modus-themes").setup({
            variant = "default", -- tilted for a slight tone change
            transparent = true,
         })
         vim.cmd("colorscheme modus")
      end
   },
   {
      -- Set lualine as statusline
      "nvim-lualine/lualine.nvim",
      -- See `:help lualine.txt`
      opts = {
         options = {
            icons_enabled = true,
            theme = "auto",
            component_separators = "|",
            section_separators = "",
         },
      },
   },
   {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      opts = {
         indent = { char = "▏" }
      }
   },
   {
      "echasnovski/mini.hipatterns",
      version = "*",
      config = function()
         local hipatterns = require("mini.hipatterns")
         hipatterns.setup({
            highlighters = {
               -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
               fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
               hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
               todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
               note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
               -- Highlight hex color strings (`#rrggbb`) using that color
               hex_color = hipatterns.gen_highlighter.hex_color(),
            },
         })
      end,
   },
}
