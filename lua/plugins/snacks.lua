local M = {}

-- 基础配置
M[1] = "folke/snacks.nvim"
M.priority = 1000
M.lazy = false

-- opts 配置
M.opts = {}
M.opts.bigfile = { enabled = true }
M.opts.dashboard = { enabled = true }
M.opts.explorer = { enabled = true }
M.opts.indent = { enabled = true }
M.opts.input = { enabled = true }
M.opts.notifier = { enabled = true }
M.opts.picker = { prompt = "  " }
M.opts.quickfile = { enabled = true }
M.opts.statuscolumn = { enabled = true }

-- keys 配置
M.keys = {
    {
        "<leader>fb",
        function() Snacks.picker.buffers() end,
        desc = "Buffers"
    },
    {
        "<leader>ff",
        function() Snacks.picker.files() end,
        desc = "Find Files"
    },
    {
        "<leader>fg",
        function() Snacks.picker.grep() end,
        desc = "Grep"
    },
    {
        "<leader>fe",
        function() Snacks.explorer() end,
        desc = "File Explorer"
    }
}

return M

