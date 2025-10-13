return {{
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    init = function()
        require("bufferline").setup({
            options = { numbers = "ordinal" },
        })
    end,
    keys = {
      { "<LEADER>1", "<CMD>BufferLineGoToBuffer 1<CR>" },
      { "<LEADER>2", "<CMD>BufferLineGoToBuffer 2<CR>" },
      { "<LEADER>3", "<CMD>BufferLineGoToBuffer 3<CR>" },
      { "<LEADER>4", "<CMD>BufferLineGoToBuffer 4<CR>" },
      { "<LEADER>5", "<CMD>BufferLineGoToBuffer 5<CR>" },
      { "<LEADER>6", "<CMD>BufferLineGoToBuffer 6<CR>" },
      { "<LEADER>7", "<CMD>BufferLineGoToBuffer 7<CR>" },
      { "<LEADER>8", "<CMD>BufferLineGoToBuffer 8<CR>" },
      { "<LEADER>9", "<CMD>BufferLineGoToBuffer 9<CR>" },
      { "<LEADER>h", "<CMD>BufferLineCyclePrev<CR>" },
      { "<LEADER>l", "<CMD>BufferLineCycleNext<CR>" },
      { "<LEADER>d", "<CMD>bdelete<CR>" },
    },
}}
