return {
    -- snazzy 主题
    require("plugins_config.vim-snazzy"),

    -- lualine状态栏
    require("plugins_config.lualine"),

    -- 使用下划线展示光标处在的单词以及其他处的该单词
    require("plugins_config.vim-cursorword"),

    -- 方便的查看与跳转git推送、合并等操作产生的的冲突
    require("plugins_config.conflict-marker"),

    -- 展示当前编辑的文件的增加、减少、更改
    require("plugins_config.vim-signify"),

    -- 快速更改包含标记，例如快速的将一对双引号改为单引号
    require("plugins_config.vim-surround"),

    -- 括号匹配
    require("plugins_config.delimitMate"),

    -- vim-gutentags，标签管理插件
    require("plugins_config.vim-gutentags"),

    -- blink 自动补全插件
    require("plugins_config.blink"),

    -- lsp 管理器
    require("plugins_config.mason"),

    -- 文件管理器
    require("plugins_config.neo-tree"),

    -- gitignore
    require("plugins_config.vim-gitignore"),

    -- bufline 
    require("plugins_config.bufferline")

}
