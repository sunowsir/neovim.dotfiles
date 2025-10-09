return {{
    "rcarriga/nvim-notify",
    lazy = true,
    event = "VeryLazy",
    config = function()
        vim.notify = require("notify")
        vim.notify.setup({
            background_colour = "#000000",
            timeout = 3000
        })
    end
}}
