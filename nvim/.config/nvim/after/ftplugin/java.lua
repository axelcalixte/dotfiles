local jdt_root = '/home/axel/.local/dev/jdt-language-server-1.29.0/'

local config = {
   cmd = {
      'java',
      '-Declipse.application=org.eclipse.jdt.ls.core.id1',
      '-Dosgi.bundles.defaultStartLevel=4',
      '-Declipse.product=org.eclipse.jdt.ls.core.product',
      '-Dlog.protocol=true',
      '-Dlog.level=ALL',
      '-Xmx1g',
      '--add-modules=ALL-SYSTEM',
      -- 💀
      -- Add Lombok jar here TODO
      '--add-opens', 'java.base/java.util=ALL-UNNAMED',
      '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
      -- 💀
      '-jar', jdt_root .. 'plugins/org.eclipse.equinox.launcher_1.6.500.v20230717-2134.jar',
      -- 💀
      '-configuration', jdt_root .. 'config_linux/',
      '-data', jdt_root .. 'data-cache/'
   },
   root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),
   settings = {
      java = {
      }
   },
   init_options = {
      bundles = {}
   },
}
require('jdtls').start_or_attach(config)
