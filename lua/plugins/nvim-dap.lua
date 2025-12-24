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
    require("dapui").setup()

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

  end,
}

