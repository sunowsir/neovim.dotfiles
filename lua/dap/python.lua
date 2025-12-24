--
-- File     : python.lua
-- Author   : sun.wang
-- Mail     : sunowsir@163.com
-- Github   : github.com/sunowsir
-- Creation : 2025-12-23 16:40:20
--

local dap = require('dap')
dap.adapters.python = {
    type = 'executable';
    command = '/usr/bin/python';
    args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
    {
        type = "python";
        request = "launch";
        name = "launch file";
        program = "${file}";
        pythonPath = function ()
            return "/usr/bin/python"
        end
    },
}
