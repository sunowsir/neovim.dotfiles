local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    'connorholyday/vim-snazzy',
    'vim-airline/vim-airline',

    -- 使用下划线展示光标处在的单词以及其他处的该单词
    'itchyny/vim-cursorword',

    -- 方便的查看与跳转git推送、合并等操作产生的的冲突
    'rhysd/conflict-marker.vim',

    -- 展示当前编辑的文件的增加、减少、更改
    'mhinz/vim-signify',

    -- 快速更改包含标记，例如快速的将一对双引号改为单引号
    'tpope/vim-surround',

    -- 括号匹配
    'Raimondi/delimitMate',

    -- vim-gutentags，标签管理插件
    'ludovicchabant/vim-gutentags',

    -- lsp 管理器
    { "mason-org/mason.nvim", opts = {} },

    -- 自动补全插件
    {
        "saghen/blink.cmp",
        -- optional: provides snippets for the snippet source
        dependencies = { "rafamadriz/friendly-snippets" },

        -- Use a release tag to download pre-built binaries
        version = "*",
        -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
        -- build = 'cargo build --release',
        -- If you use Nix, you can build from source using the latest nightly rust with:
        -- build = 'nix run .#build-plugin',

        opts = {
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
            -- 'super-tab' for mappings similar to VSCode (tab to accept)
            -- 'enter' for enter to accept
            -- 'none' for no mappings
            --
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            --
            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = {
                -- Each keymap may be a list of commands and/or functions
                preset = "enter",
                -- Select completions
                ["<Up>"] = { "select_prev", "fallback" },
                ["<Down>"] = { "select_next", "fallback" },
                ["<Tab>"] = { "select_next", "fallback" },
                ["<S-Tab>"] = { "select_prev", "fallback" },
                -- Scroll documentation
                ["<C-b>"] = { "scroll_documentation_up", "fallback" },
                ["<C-f>"] = { "scroll_documentation_down", "fallback" },
                -- Show/hide signature
                ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
            },

            appearance = {
                -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = "mono",
            },

            sources = {
                -- `lsp`, `buffer`, `snippets`, `path`, and `omni` are built-in
                -- so you don't need to define them in `sources.providers`
                default = { "lsp", "path", "snippets", "buffer" },

                -- Sources are configured via the sources.providers table
            },

            -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
            -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
            -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
            --
            -- See the fuzzy documentation for more information
            fuzzy = { implementation = "prefer_rust_with_warning" },
            completion = {
                -- The keyword should only match against the text before
                keyword = { range = "prefix" },
                menu = {
                    -- Use treesitter to highlight the label text for the given list of sources
                    draw = {
                        treesitter = { "lsp" },
                    },
                },
                -- Show completions after typing a trigger character, defined by the source
                trigger = { show_on_trigger_character = true },
                documentation = {
                    -- Show documentation automatically
                    auto_show = true,
                },
            },

            -- Signature help when tying
            signature = { enabled = true },
        },
        opts_extend = { "sources.default" },
    }

})

-- vim-airline 配置
vim.g.airline_extensions_ale_enabled = 0 -- 禁用 ALE 扩展
vim.g.airline_powerline_fonts = 1 -- 启用 powerline 字体支持
vim.g.airline_extensions_tabline_enabled = 1 -- 启用 tabline 功能
vim.g.airline_extensions_tabline_buffer_nr_show = 1 -- 显示 buffer 编号

-- Buffer 快捷键设置
vim.keymap.set("n", "<LEADER>h", "<CR>", {noremap = true})
vim.keymap.set("n", "<LEADER>l", "<CR>", {noremap = true})
vim.keymap.set("n", "<LEADER>d", "<CR>", {noremap = true})

-- snazzy 主题配置
vim.g.SnazzyTransparent = 1 -- 启用透明背景
vim.cmd("colorscheme snazzy") -- 设置主题


-- vim-signify
vim.g.signify_sign_change_delete = '-'


-- vim-gutentags

-- 工程根目录识别标志
vim.g.gutentags_project_root = {'.root', '.svn', '.git', '.project'}

-- 标签文件名
vim.g.gutentags_ctags_tagfile = '.tags'

-- 缓存目录设置
cache_dir = vim.fn.expand('~/.cache/tags')
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
  vim.fn.getcwd().."/include/tags",  -- include目录下的tags
  vim.fn.getcwd().."/src/tags"       -- src目录下的tags
}

-- 自动切换工作目录到当前文件所在目录
vim.opt.autochdir = true


