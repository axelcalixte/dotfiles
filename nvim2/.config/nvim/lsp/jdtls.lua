local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = "~/.cache/jdtls" .. project_name
local lombok_path = ""

return {
   on_attach = function(client, bufnr)
      require("utils").enable_completion(client, bufnr)
   end,
   settings = {
      java = {},
   },
   cmd = {
      "jdtls",
      "-data", workspace_dir,
      "-javaagent:" .. lombok_path,
   },
   -- init_options = {
   --    bundles = {}
   -- }
}
