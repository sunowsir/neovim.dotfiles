-- dap 
return {
    "mfussenegger/nvim-dap",
    dependencies = {
        -- Optional: a nice UI for debugging
        "rcarriga/nvim-dap-ui",
        -- Optional: an easy way to install debuggers via Mason
        "jay-babu/mason-nvim-dap.nvim",
        -- Optional: displays variable values inline
        "theHamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup({})

        -- define common options
        local opts = {
            noremap = true,      -- non-recursive
            silent = true,       -- do not show message
        }

        vim.keymap.set({"i", "n", "v"}, "<F5>", "<cmd>lua require'dap'.continue()<CR>", opts)
        vim.keymap.set({"i", "n", "v"}, "<F10>", "<cmd>lua require'dap'.step_over()<CR>", opts)
        vim.keymap.set({"i", "n", "v"}, "<F11>", "<cmd>lua require'dap'.step_into()<CR>", opts)
        vim.keymap.set({"i", "n", "v"}, "<F12>", "<cmd>lua require'dap'.step_over()<CR>", opts)
        vim.keymap.set({"i", "n", "v"}, "<F9>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)

        local dap_breakpoint_color = {
            breakpoint = {
                ctermbg=0,
                fg='#993939',
                bg='#31353f',
            },
            logpoing = {
                ctermbg=0,
                fg='#61afef',
                bg='#31353f',
            },
            stopped = {
                ctermbg=0,
                fg='#98c379',
                bg='#31353f'
            },
        }
        
        vim.api.nvim_set_hl(0, 'DapBreakpoint', dap_breakpoint_color.breakpoint)
        vim.api.nvim_set_hl(0, 'DapLogPoint', dap_breakpoint_color.logpoing)
        vim.api.nvim_set_hl(0, 'DapStopped', dap_breakpoint_color.stopped)
        
        local dap_breakpoint = {
            error = {
                text = "",
                texthl = "DapBreakpoint",
                linehl = "DapBreakpoint",
                numhl = "DapBreakpoint",
            },
            condition = {
                text = 'ﳁ',
                texthl = 'DapBreakpoint',
                linehl = 'DapBreakpoint',
                numhl = 'DapBreakpoint',
            },
            rejected = {
                text = "",
                texthl = "DapBreakpint",
                linehl = "DapBreakpoint",
                numhl = "DapBreakpoint",
            },
            logpoint = {
                text = '',
                texthl = 'DapLogPoint',
                linehl = 'DapLogPoint',
                numhl = 'DapLogPoint',
            },
            stopped = {
                text = '',
                texthl = 'DapStopped',
                linehl = 'DapStopped',
                numhl = 'DapStopped',
            },
        }

        vim.fn.sign_define('DapBreakpoint', dap_breakpoint.error)
        vim.fn.sign_define('DapBreakpointCondition', dap_breakpoint.condition)
        vim.fn.sign_define('DapBreakpointRejected', dap_breakpoint.rejected)
        vim.fn.sign_define('DapLogPoint', dap_breakpoint.logpoint)
        vim.fn.sign_define('DapStopped', dap_breakpoint.stopped)

        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open({})
        end

        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close({})
        end

        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close({})
        end

        require("nvim-dap-virtual-text").setup({
            enabled = true,
            enable_commands = true,
            highlight_changed_variables = true,
            highlight_new_as_changed = false,
            show_stop_reason = true,
            commented = false,
            only_first_definition = true,
            all_references = false,
            filter_references_pattern = '<module',
            virt_text_pos = 'eol',
            all_frames = false,
            virt_lines = false,
            virt_text_win_col = nil
        })
    end,
}

