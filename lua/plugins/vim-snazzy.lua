-- snazzy 主题配置
return {{
    "connorholyday/vim-snazzy",

    config = function()
        -- 启用透明背景
        vim.g.SnazzyTransparent = 1

        -- 设置主题
        vim.cmd("colorscheme snazzy")
    end
}}



