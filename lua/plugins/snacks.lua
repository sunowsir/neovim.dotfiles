return {
    -- 基础配置
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    -- opts 配置
    opts = {
        bigfile      = { enabled = true },
        dashboard    = { enabled = true },
        explorer     = { enabled = true },
        indent       = { enabled = false },
        input        = { enabled = true },
        notifier     = { enabled = true },
        picker       = { prompt  = "  " },
        quickfile    = { enabled = true },
        statuscolumn = { enabled = true },
    },

    -- keys 配置
    keys = {
        {
            "<leader>fb",
            function() require("snacks").picker.buffers() end,
            desc = "Buffers"
        },
        {
            "<leader>ff",
            function() require("snacks").picker.files() end,
            desc = "Find Files"
        },
        {
            "<leader>fg",
            function() require("snacks").picker.grep() end,
            desc = "Grep"
        },
        {
            "<leader>fe",
            function() require("snacks").explorer() end,
            desc = "File Explorer"
        }
    },

    config = function()
        local set_bg_callback = function()
            vim.api.nvim_set_hl(0, "SnacksPicker",
                { bg = "none", nocombine = true })

            vim.api.nvim_set_hl(0, "SnacksPickerBorder",
                { fg = "#316c71", bg = "none", nocombine = true })
        end

        -- set gb is none
        vim.api.nvim_create_autocmd("ColorScheme", {
            pattern = "*",
            callback = set_bg_callback
        })
    end
}
