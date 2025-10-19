--
-- File     : vista.vim.lua
-- Author   : sun.wang
-- Mail     : sunowsir@163.com
-- Github   : github.com/sunowsir
-- Creation : 2025-10-19 18:03:50
--

return {{
    "liuchengxu/vista.vim",
    config = function()

        -- 设置各级缩进显示样式（仅对kind渲染器有效，tree渲染器无效）
        -- 示例紧凑样式: ["▸ ", ""]
        vim.g.vista_icon_indent = {"╰─▸ ", "├─▸ "}

        -- 默认使用的执行器（未指定时自动调用）
        -- 可通过`:echo g:vista#executives`查看所有可用执行器
        vim.g.vista_default_executive = 'ctags'

        -- 为特定文件类型指定执行器（覆盖默认值）
        vim.g.vista_executive_for = {
          c      = 'vim_lsp',
          cpp    = 'vim_lsp',
          python = 'vim_lsp',
        }

        -- 声明生成ctags的自定义命令（文件路径会自动追加到命令末尾）
        -- 示例Haskell配置：
        vim.g.vista_ctags_cmd = {
            c       = 'ctags --fields=+niazSK --extra=+q --c++-kinds=+pxI --c-kinds=+px --c++-kinds=+l --c-kinds=+l',
            cpp     = 'ctags --fields=+niazSK --extra=+q --c++-kinds=+pxI --c-kinds=+px --c++-kinds=+l --c-kinds=+l',
            python  = 'ctags --python-kinds=-i'
        }

        -- 启用fzf预览窗口配置
        -- 参数会传递给fzf#vim#with_preview()
        vim.g.vista_fzf_preview = {'right:50%'}

        -- define common options
        local opts = {
            noremap = true,      -- non-recursive
            silent = true,       -- do not show message
        }
        vim.keymap.set('n', '<leader>tl', ':Vista<cr>', opts)

    end
}}
