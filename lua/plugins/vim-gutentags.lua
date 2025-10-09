return {{
    "ludovicchabant/vim-gutentags",
    config = function()
        -- 工程根目录识别标志
        vim.g.gutentags_project_root = {'.root', '.svn', '.git', '.project'}
        -- 标签文件名
        vim.g.gutentags_ctags_tagfile = '.tags'
        -- 缓存目录设置
        local cache_dir = vim.fn.expand('~/.cache/tags')
        vim.g.gutentags_cache_dir = vim.fn.expand('~/.cache/tags')
        -- 自动创建缓存目录
        if vim.fn.isdirectory(cache_dir) == 0 then
            vim.fn.mkdir(cache_dir, 'p')
        end
        -- ctags 额外参数
        vim.g.gutentags_ctags_extra_args = {
            '--fields=+niazSK',
            '--extra=+q',
            '--c++-kinds=+pxI',
            '--c-kinds=+px',
            '--c++-kinds=+l',
            '--c-kinds=+l',
        }
        -- 设置tags文件搜索路径
        vim.opt.tags = {
            "tags",                  -- 当前目录下的tags文件
            vim.fn.getcwd() .. "/include/tags",  -- include目录下的tags
            vim.fn.getcwd() .. "/src/tags"       -- src目录下的tags
        }
        -- 自动切换工作目录到当前文件所在目录
        vim.opt.autochdir = true
    end
}}
