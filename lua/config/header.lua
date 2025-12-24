-- ----------------------------------------------------------------------
-- File     : header.lua
-- Author   : sun.wang
-- Mail     : sunowsir@163.com
-- Github   : github.com/sunowsir
-- Creation : 2025-09-29 23:00:25
-- ----------------------------------------------------------------------

local M = {}

local generate_cpp_header_guard = function(opts)
    -- 转换文件名成为适合宏定义的格式
    -- local guard_name = string.upper(M.filename : gsub("[^%w]", "_") : gsub("(.)", function(c)
    --     return c == "." and "_" or c
    -- end)) .. "_H"

    local guard_name = opts.filename
        :gsub("[^%w]", "_")
        :upper() .. "_H"

    table.insert(opts.header, '#ifndef ' .. guard_name)
    table.insert(opts.header, '#define ' .. guard_name)
    table.insert(opts.header, '')
    table.insert(opts.header, '#endif')

end

local general_generate_header = function(opts)
    opts.header = {}

    if opts.filetype == nil then
        return
    end

    if M.before_head ~= nil then
        local before_head = M.before_head[M.filetype]
        for idx, value in ipairs(before_head) do
            opts.header[idx] = value
        end
    end

    if opts.comment and opts.comment[opts.filetype] then
        local comment_symbols = opts.comment[opts.filetype]
        table.insert(opts.header, comment_symbols[1])
        table.insert(opts.header, comment_symbols[2] .. 'File     : ' .. opts.filename)
        table.insert(opts.header, comment_symbols[2] .. 'Author   : ' .. opts.author)
        table.insert(opts.header, comment_symbols[2] .. 'Mail     : ' .. opts.mail)
        table.insert(opts.header, comment_symbols[2] .. 'Github   : ' .. opts.github)
        table.insert(opts.header, comment_symbols[2] .. 'Creation : ' .. opts.datetime)
        table.insert(opts.header, comment_symbols[3])
        table.insert(opts.header, '')
    end

    -- 如果是头文件且是C/C++，添加保护宏
    if opts.filename:match("%.h$") and (opts.filetype == 'c' or opts.filetype == 'cpp') then
        generate_cpp_header_guard(opts)
    end

    if opts.after_head == nil then
        return
    end

    local after_head = opts.after_head[opts.filetype]
    for idx, value in ipairs(after_head) do
        opts.header[idx] = value
    end
end

local neovim_buf_set = function(opts)
    if opts.header == nil then
        return
    end
    vim.api.nvim_buf_set_lines(0, 0, 0, false, opts.header)
    vim.api.nvim_command('normal G') -- 光标移至文件末尾
end

M.generate = function(opts)
    opts.filetype = vim.bo.filetype or ''
    opts.filename = vim.fn.expand('%:t') or ''
    opts.datetime = os.date('%Y-%m-%d %H:%M:%S') or ''

    -- 添加更多文件类型支持，通过setup参数传入comment表，key为文件类型，value为包含三个注释符的表
    -- opts.comment['c'] = {'/*', '*', '*/'}
    -- require("header").setup(opts)
    general_generate_header(opts)
    neovim_buf_set(opts)
end

M.setup = function(opts)
    opts = opts or {}

    opts.author  = opts.author or ''
    opts.mail    = opts.mail   or ''
    opts.github  = opts.github or ''

    local auto_cmd_callback = function()
        M.generate(opts)
    end

    local auto_cmd = {
        pattern = '*',
        callback = auto_cmd_callback
    }

    -- 注册自动命令
    vim.api.nvim_create_autocmd('BufNewFile', auto_cmd)
end

return M

