-- 如下为通用功能快捷键，插件相关功能在各个插件模块中配置

-- 空格键作为Leader键
vim.g.mapleader = " "

-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-----------------
-- Normal mode --
-----------------


-- 将大写的j和k映射为5行5行的跳，为了快速阅览
vim.keymap.set('n', 'J', '5j', opts)
vim.keymap.set('n', 'K', '5k', opts)

-- 保存
vim.keymap.set('n', '<C-j>', ':w<CR>', opts)

-- 退出
vim.keymap.set('n', 'Q', ':q<CR>', opts)

-- 打开文件消除之前搜索产生的高亮
vim.keymap.set('n', '<LEADER><CR>', ':nohlsearch<CR>', opts)

-- 普通模式下将系统剪切板内容粘贴到当前光标后
vim.keymap.set('n', 'P', '"+p', opts)

-- 修改分屏大小
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- 将s设置为无用按键
vim.keymap.set('n', 's', '<nop>', opts)

-- 删除原有快捷键
vim.keymap.del('n', 'grn')
vim.keymap.del('n', 'gra')
vim.keymap.del('n', 'grr')
vim.keymap.del('n', 'gri')
vim.keymap.del('n', 'gO')

-- lsp快捷键

-- 查看定义
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

-- 查询引用
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

-- 文档显示
vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)

-- 重命名
vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)

-- 下一个错误
vim.keymap.set('n', 'gp', vim.diagnostic.goto_prev, opts)

-- 上一个错误
vim.keymap.set('n', 'gn', vim.diagnostic.goto_next, opts)


-----------------
-- Visual mode --
-----------------


-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)
vim.keymap.set('v', 'Y', '"+y', opts)
vim.keymap.set('v', '<C-j>', '<ESC>', opts)


-----------------
-- Insert mode --
-----------------


-- 插入模式下: 退出插入模式
vim.keymap.set('i', '<C-j>', '<ESC>')

