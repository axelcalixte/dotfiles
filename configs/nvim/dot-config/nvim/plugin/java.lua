-- vim.pack.add({
--   {
--     src = 'https://github.com/JavaHello/spring-boot.nvim',
--     version = '218c0c26c14d99feca778e4d13f5ec3e8b1b60f0',
--   },
--   'https://github.com/MunifTanjim/nui.nvim',
--   'https://github.com/mfussenegger/nvim-dap',
--
--   'https://github.com/nvim-java/nvim-java',
-- })
--
-- require('java').setup({
--   -- JDTLS configuration
--   checks = {
--      nvim_jdtls_conflict = true,
--   },
--   jdtls = {
--     version = '1.60.0',
--   },
-- })
-- vim.lsp.enable('jdtls')

vim.pack.add({'https://github.com/idelice/nvim-jls'})
vim.pack.add({"https://github.com/mfussenegger/nvim-dap"})

local dap = require("dap")

dap.adapters.jls = {
  type = "executable",
  command = "jls-debug-adapter.sh",  -- must be on PATH (mason install handles this)
}

dap.configurations.java = {
  {
    type = "jls",
    request = "attach",
    name = "Debug (Attach) - Remote (JLS)",
    hostName = "127.0.0.1",
    port = 5005,
    -- Required: absolute path(s) to your Java source roots.
    -- Defaults to src/main/java relative to cwd; set SOURCE_ROOT env var to override.
    sourceRoots = function()
      local root = os.getenv("SOURCE_ROOT")
      if root and root ~= "" then return { root } end
      return { vim.fn.getcwd() .. "/src/main/java" }
    end,
  },
}
