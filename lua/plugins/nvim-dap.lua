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
  end,
}

