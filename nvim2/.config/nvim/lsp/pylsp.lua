-- uv tool install python-lsp-server or with pipx
-- activate the env and pip install pylsp-mypy python-lsp-black python-lsp-ruff mypy
return {
   on_attach = function(client, bufnr)
      require("utils").enable_completion(client, bufnr)
   end,
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
