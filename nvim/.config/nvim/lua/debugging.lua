local dap = require("dap")
dap.adapters.python = {
    type = "executable",
    command = "/home/axel/.local/virtualenvs/debugpy/bin/python",
    args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
    {
        -- The first three options are required by nvim-dap
        type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = "launch",
        name = "Launch file",

        -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

        program = "${file}", -- This configuration will launch the current file if used.
        pythonPath = function()
            -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
            -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
            -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
                return cwd .. "/venv/bin/python"
            elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
                return cwd .. "/.venv/bin/python"
            else
                return "/usr/bin/python"
            end
        end,
    },
}

dap.adapters.node2 = {
    type = "executable",
    command = "node",
    args = { os.getenv("HOME") .. "/.local/share/vscode-node-debug2/out/src/nodeDebug.js" },
}

dap.configurations.javascript = {
    {
        name = "Launch",
        type = "node2",
        request = "launch",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        console = "integratedTerminal",
    },
    {
        -- For this to work you need to make sure the node process is started with the `--inspect` flag.
        name = "Attach to process",
        type = "node2",
        request = "attach",
        processId = require("dap.utils").pick_process,
    },
}

--[[ This shall not be set thanks to jdtls.setup_dap
dap.adapters.java = {} ]]

require("nvim-dap-virtual-text").setup({
    virt_text_win_col = 80,
})

-- Debug Adapter Protocol
vim.keymap.set("n", "<Leader>ds", "<Cmd>lua require'dap'.continue()<CR>") -- s to start debugging
vim.keymap.set("n", "<Leader>dsl", "<Cmd>lua require'dap'.run_last()<CR>") -- run the last debug adapter/config
vim.keymap.set("n", "<Leader>dn", "<Cmd>lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<Leader>dN", "<Cmd>lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<Leader>do", "<Cmd>lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<Leader>de", "<Cmd>lua require'dap'.terminate()<CR>") -- e to end debugging
vim.keymap.set("n", "<Leader>db", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<Leader>dr", "<Cmd>lua require'dap'.repl.toggle()<CR>")
vim.keymap.set("n", "<Leader>dc", "<Cmd>lua require'dap'.run_to_cursor()<CR>")
