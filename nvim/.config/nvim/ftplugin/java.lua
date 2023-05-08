local general_on_attach = require("axel.tables.on_attach")
local config = {
	cmd = {'/home/axel/.local/share/nvim/mason/bin/jdtls'},
	on_attach = function()
		general_on_attach()
	end,
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
}
require("jdtls").start_or_attach(config)
