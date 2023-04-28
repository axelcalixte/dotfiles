local mason_root
local configuration
local workspace_dir
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local general_on_attach = require("axel.tables.on_attach")

-- if vim.fn.has('win32') then
--    mason_root = "C:\\Users\\acalixte\\AppData\\Local\\nvim-data\\mason"
--    configuration = mason_root .. "/packages/jdtls/config_win"
--    workspace_dir = "C:\\Users\\acalixte\\AppData\\Local\\jdtls-workspace"
-- else
mason_root = "/home/axel/.local/share/nvim/mason"
configuration = mason_root .. "/packages/jdtls/config_linux"
workspace_dir = "/home/axel/.local/share/jdtls"
-- end

local config = {
   cmd = {
      'java', -- or '/path/to/java17_or_newer/bin/java'
      -- depends on if `java` is in your $PATH env variable and if it points to the right version.
      '-Declipse.application=org.eclipse.jdt.ls.core.id1',
      '-Dosgi.bundles.defaultStartLevel=4',
      '-Declipse.product=org.eclipse.jdt.ls.core.product',
      '-Dlog.protocol=true',
      '-Dlog.level=ALL',
      '-Xmx1g',
      '--add-modules=ALL-SYSTEM',
      '--add-opens', 'java.base/java.util=ALL-UNNAMED',
      '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

      '-jar', mason_root .. '/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
      '-configuration', mason_root .. configuration,

      '-data', workspace_dir .. project_name
   },
   -- 💀
   -- This is the default if not provided, you can remove it. Or adjust as needed.
   -- One dedicated LSP server & client will be started per unique root_dir
   root_dir = require('jdtls.setup').find_root({ ".git", "mvnw", "gradlew" }),
   -- Here you can configure eclipse.jdt.ls specific settings
   -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
   -- for a list of options
   settings = {
      java = {
      }
   },
   on_attach = function()
      general_on_attach()
      require("jdtls").setup_dap({ hotcodereplace = "auto" })
   end,
   -- Language server `initializationOptions`
   -- You need to extend the `bundles` with paths to jar files
   -- if you want to use additional eclipse.jdt.ls plugins.
   --
   -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
   --
   -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
   init_options = {
      bundles = {
         vim.fn.glob(
         mason_root .. "/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-0.45.0.jar", true),
         vim.split(vim.fn.glob(mason_root .. "/packages/java-test/extension/server/*.jar", true), "\n")
      }
   },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
