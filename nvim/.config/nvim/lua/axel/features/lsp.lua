return {
   -- General LSP
   {
      "neovim/nvim-lspconfig",
      cmd = { "LspInfo", "LspInstall", "LspStart" },
      event = { "BufReadPre", "BufNewFile" },
      config = function()
         local lspconfig = require('lspconfig')
         local capabilities = vim.lsp.protocol.make_client_capabilities()
         capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
         capabilities.textDocument.completion.completionItem.snippetSupport = true

         lspconfig.lua_ls.setup {
            on_init = function(client)
               local path = client.workspace_folders[1].name
               if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                  client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                     Lua = {
                        runtime = {
                           version = 'LuaJIT'
                        },
                        workspace = {
                           checkThirdParty = false,
                           library = {
                              vim.env.VIMRUNTIME
                           }
                        }
                     }
                  })
                  client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
               end
               return true
            end
         }

         lspconfig.pylsp.setup {
            capabilities = capabilities,
            settings = {
               pylsp = {
                  plugins = {
                     ruff = {
                        enabled = true,
                        extendSelect = { "I" },
                     },
                     autopep8 = {
                        enabled = false
                     },
                     yapf = {
                        enabled = false
                     },
                     black = {
                        enabled = true
                     },
                     mypy = {
                        enabled = false
                     }
                  }
               }
            }
         }

         lspconfig.tsserver.setup {
            capabilities = capabilities,
         }

         local default_probe_dir = "/home/axel/.local/share/npm/lib/node_modules"
         local cmd = { "ngserver", "--stdio", "--tsProbeLocations", default_probe_dir, "--ngProbeLocations",
            default_probe_dir }
         lspconfig.angularls.setup {
            cmd = cmd,
            on_new_config = function(new_config, new_root_dir)
               new_config.cmd = cmd
            end,
            capabilities = capabilities,
         }

         -- lspconfig.tailwindcss.setup {
         --    --TODO: add specific cmp config
         --    capabilities = capabilities
         -- }

         lspconfig.html.setup {
            capabilities = capabilities,
            filetypes = { "html", "astro" }
         }

         lspconfig.cssls.setup {
            capabilities = capabilities,
            filetypes = { "css", "astro" }
         }

         lspconfig.astro.setup {
            capabilities = capabilities,
         }
      end,
   },
   -- Java LSP adapter
   "mfussenegger/nvim-jdtls",
}
