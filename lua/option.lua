-- 空格键作为Leader键
vim.g.mapleader = " "

-- 高亮
vim.opt.syntax = "enable"

-- 搜索词高亮
vim.opt.hlsearch = true

-- 搜索词输入同步高亮
vim.opt.incsearch = true

-- 搜索词忽略大小写
vim.opt.ignorecase = true

-- 智能大小写
vim.opt.smartcase = true

-- 行号
vim.opt.number = true

-- 相对行号
vim.opt.relativenumber = true

-- 光标线
vim.opt.cursorline = true

-- " 换行显示 -- 使得字不会超出屏幕显示
vim.opt.wrap = true

-- " 状态栏显示命令
vim.opt.showcmd = true

-- " tab 联想补全
vim.opt.wildmenu = true

-- 文件识别
vim.opt.filetype = "enable"

-- 为特定文件类型载入相关缩进文件
vim.opt.filetype.indent = "enable"

-- 载入文件类型插件
vim.opt.filetype.plugin = "enable"

-- 编码设置为utf-8
vim.opt.encoding = "utf-8"

-- 设置菜单语言为中文, 编码为utf-8
vim.opt.langmenu = "zh_CN.UTF-8"

-- 设置提示语言为中文, 编码为utf-8
-- vim.opt.language.message = "zh_CN.UTF-8"
vim.cmd('language message zh_CN.UTF-8')

-- 设置文件默认编码
vim.opt.fileencodings="utf8,ucs-bom,gbk,cp936,gb2312,gb18030"

-- 防止特殊符号无法正常显示
vim.opt.ambiwidth = "double"

-- 根据文件中其他位置的缩进空格个数来决定一个tab是多少个空
vim.opt.smarttab = true

-- 每一行都和前一行的缩进量相同
vim.opt.smartindent = true

-- 自动缩进－当敲入回车，自动加入tab，若新行没有任何内容，tab自动删除
vim.opt.autoindent = true

-- 按照Ｃ语言语法进行自动缩进
vim.opt.cindent = true

-- 特殊缩进设置 :case括号、C++类权限关键字是否缩进
vim.cinoptions = "l1,g0"


-- 输入tab时自动转化为空格
vim.opt.expandtab = true 

-- 编辑时一个TAB字符占多少个空格的位置。
vim.opt.tabstop = 4 

-- 使用每层缩进的空格数。
vim.opt.shiftwidth = 4 

-- 敲入tab时实际占有的列数
vim.opt.softtabstop = 4 

-- 行尾空格显示
-- set list
-- set listchars=tab:▸\ ,trail:▫

-- 光标移动到buffer的顶部和底部时保持若干行行距离  
vim.opt.scrolloff = 5

-- 总是显示状态栏
vim.opt.laststatus = 2

-- 自动切换当前目录
vim.opt.autochdir = true

-- 设置当文件被改动时自动载入
vim.opt.autoread = true

--自动保存
vim.opt.autowrite = true

-- 禁用备份文件
vim.opt.backup = false
vim.opt.writebackup = false

-- 禁用交换文件
vim.opt.swapfile = false

-- 禁用撤销历史文件
vim.opt.undofile = false

-- 禁用viminfo文件（Neovim中对应shada）
vim.opt.shada = ""

-- 在处理未保存或只读文件的时候，弹出确认
vim.opt.confirm = true

-- 禁用错误提示音和视觉提示
vim.opt.errorbells = false
vim.opt.visualbell = false

-- 可选：完全禁用所有铃声（包括警告等）
vim.opt.belloff = "all"

-- 使回格键（backspace）正常处理indent, eol, start等
-- 使回格键可以删除缩进、跨行和起始位置
vim.opt.backspace = "indent,eol,start"


-- 允许backspace和光标键跨越行边界
vim.opt.whichwrap = vim.opt.whichwrap:append("<,>,h,l")

-- 高亮显示匹配的括号
vim.opt.showmatch = true

-- 匹配括号高亮的时间（单位是十分之一秒）
vim.opt.matchtime = 1

-- 智能补全
vim.opt.completeopt = { 'longest', 'menu', 'menuone', 'noselect' }

-- 用缩进表示折叠
vim.opt.foldmethod = "indent"

-- 打开文件后默认展开所有折叠
vim.opt.foldlevel = 99

-- 不在单词中间断行。
-- 设置了这个选项后，如果一行文字非常长，无法在一行内显示完的话，
-- 它会在单词与单词间的空白处断开，尽量不会把一个单词分成两截放在两个不同的行里。
vim.opt.lbr = true

-- 打开断行模块对亚洲语言支持。
-- m 表示允许在两个汉字之间断行，即使汉字之间没有出现空格。
-- B 表示将两行合并为一行的时候，汉字与汉字之间不要补空格。
-- 该命令支持的更多的选项请参看用户手册。
vim.opt.formatoptions = vim.opt.formatoptions + "mB"

-- 显示括号配对情况。
-- 打开这个选项后，当输入后括号(包括小括号、中括号、大括号) 的时候，
-- 光标会跳回前括号片刻，然后跳回来，以此显示括号的配对情况。
vim.opt.sm = true

-- 指定在选择文本时，光标所在位置也属于被选中的范围。
-- 如果指定 selection=exclusive 的话，可能会出现某些文本无法被选中的情况。
vim.opt.selection = "inclusive"

-- 当右键单击窗口的时候，弹出快捷菜单。
vim.opt.mousemodel = "popup"

-- set tw = n : 设置光标超过n列的时候折行，
-- 当n = 0 时代表永不折行。
vim.opt.tw = 0

-- 启用不可见字符显示
vim.opt.list = true

-- 配置制表符显示为竖线+空格（需转义竖线）
vim.opt.listchars = {
  tab = "¦ ",  -- 制表符显示（4个空格宽度）
  -- trail = "•",    -- 行尾空格
  extends = "›",  -- 被隐藏的右侧文本
  precedes = "‹"  -- 被隐藏的左侧文本
}

-- 可选：设置高亮颜色
vim.cmd("highlight SpecialKey ctermfg=8 guifg=#555555")

-- 关闭vim的独立剪切板，使用系统剪切板
-- set clipboard+=unnamed
-- vim.opt.clipboard = 'unnamedplus' -- use system clipboard

-- 启用viminfo/shada功能（包含标记位置记录）
-- 记录最多1000个文件的标记位置
vim.opt.shada = "'1000,f1,<500"

-- 自动跳转到上次编辑时的光标位置
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)

        if mark[1] <= 0 or mark[1] > lcount then
            return 
        end

        local ok, err = pcall(vim.api.nvim_win_set_cursor, 0, mark)
        if ok then 
            return 
        end

        vim.notify("光标定位失败: mark = " .. mark[1] .. ", lcount = " .. lcount ", " .. err, vim.log.levels.WARN)
    end,
})

-- 配置大括号自动分行
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"*"},
    callback = function()
        vim.keymap.set("i", "<CR>", function()
            local line = vim.api.nvim_get_current_line()
            local col = vim.api.nvim_win_get_cursor(0)[2] + 1
            local char_before = line:sub(col-1, col-1)
            local char_after = line:sub(col, col)

            if char_before == "{" and char_after == "}" then
                -- 获取当前缩进
                local indent = line:match("^%s*")
                -- 执行分三行操作
                return "<CR>" .. indent .. "    <CR>" .. indent .. "<Up><End>"
            else
                return "<CR>"
            end
        end, {buffer = true, expr = true})
    end
})




