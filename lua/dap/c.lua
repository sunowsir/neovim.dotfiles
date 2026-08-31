--
-- File     : c.lua
-- Author   : sun.wang
-- Mail     : sunowsir@163.com
-- Github   : github.com/sunowsir
-- Creation : 2025-12-24 15:05:21
--

local dap = require("dap")

dap.adapters.cppdbg = {
    id = "cppdbg",
    type = 'executable',
    -- [[ download from https://github.com/microsoft/vscode-cpptools/releases ]]
    command = "/home/sun/.local/share/nvim/dap/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
}

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,

        cwd = "${workspaceFolder}",
        stopAtEntry = true,
    },
}
dap.configurations.c = dap.configurations.cpp
