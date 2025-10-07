-- ----------------------------------------------------------------------
-- File     : header.lua
-- Author   : sun.wang
-- Mail     : sunowsir@163.com
-- Github   : github.com/sunowsir
-- Creation : 2025-09-29 23:00:25
-- ----------------------------------------------------------------------

local M = {}

local generate_cpp_header_guard = function()
    -- 转换文件名成为适合宏定义的格式
    local guard_name = string.upper(M.filename : gsub("[^%w]", "_") : gsub("(.)", function(c)
        return c == "." and "_" or c
    end)) .. "_H"

    return {
        '#ifndef ' .. guard_name,
        '#define ' .. guard_name,
        '',
        '#endif'
    }
end

local general_generate_header = function(comment_symbols)
    local header = {
        comment_symbols[1],
        comment_symbols[2] .. 'File     : ' .. M.filename,
        comment_symbols[2] .. 'Author   : ' .. M.author,
        comment_symbols[2] .. 'Mail     : ' .. M.mail,
        comment_symbols[2] .. 'Github   : ' .. M.github,
        comment_symbols[2] .. 'Creation : ' .. M.datetime,
        comment_symbols[3],
        ''
    }

    -- 如果是头文件且是C/C++，添加保护宏
    if M.filename:match("%.h$") and (M.filetype == 'c' or M.filetype == 'cpp') then
        local guard = generate_cpp_header_guard()
        for _, line in ipairs(guard) do
            table.insert(header, line)
        end
    end

    return header
end

local neovim_buf_set = function(header)
    vim.api.nvim_buf_set_lines(0, 0, 0, false, header)
    vim.api.nvim_command('normal G') -- 光标移至文件末尾
end

M.generate = function()
    M.filetype = vim.bo.filetype or ''
    M.filename = vim.fn.expand('%:t') or ''
    M.datetime = os.date('%Y-%m-%d %H:%M:%S') or ''

    local comment_symbols = {}

    -- C/C++/Java头文件模板
    if M.filetype == 'c' or M.filetype == 'cpp' or M.filetype == 'java' then
        comment_symbols = {'/*', ' * ', '*/'}

    -- Shell脚本模板
    elseif M.filetype == 'sh' then
        comment_symbols = {'#', '# ', '#'}

    -- lua 模板
    elseif M.filetype == 'lua' then
        comment_symbols = {'--', '-- ', '--'}

    -- 添加更多文件类型支持...
    end

    neovim_buf_set(general_generate_header(comment_symbols) or '')
end

M.setup = function(opts)
    opts = opts or {}

    M.author   = opts.author or ''
    M.mail     = opts.mail   or ''
    M.github   = opts.github or ''

    -- 注册自动命令
    vim.api.nvim_create_autocmd('BufNewFile', {
        pattern = '*',
        callback = M.generate
    })
end

return M

