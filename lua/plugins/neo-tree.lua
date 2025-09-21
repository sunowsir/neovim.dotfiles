return {{
    "nvim-neo-tree/neo-tree.nvim", 
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    config = function()
        local opts = {
            noremap = true,      -- non-recursive
            silent = true,       -- do not show message
        }

        vim.keymap.set('n', '<C-t>', ':Neotree<CR>', opts)
    end
}}
