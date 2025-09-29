-- ----------------------------------------------------------------------
-- File     : header.lua
-- Author   : sun.wang
-- Mail     : sunowsir@163.com
-- Github   : github.com/sunowsir
-- Creation : 2025-09-29 23:00:25
-- ----------------------------------------------------------------------


local M = {}

local generate_same_c_header = function()
    local header = {
      '/*',
      ' * File     : ' .. M.filename,
      ' * Author   : ' .. M.author,
      ' * Mail     : ' .. M.mail,
      ' * Github   : ' .. M.github,
      ' * Creation : ' .. M.datetime,
      ' */',
      ''
    }
    return header
end

local generate_sh_header = function()
    local shell = '#!/bin/bash'
    local header = {
      shell,
      '#########################################################################',
      '# File Name:    ' .. M.filename,
      '# Author:       ' .. M.author,
      '# Mail:         ' .. M.mail,
      '# Github:       ' .. M.github,
      '# Created Time: ' .. M.datetime,
      '#########################################################################',
      ''
    }
    return header
end

local generate_lua_header = function()
    local header = {
        '-- ----------------------------------------------------------------------',
        '-- File     : ' .. M.filename,
        '-- Author   : ' .. M.author,
        '-- Mail     : ' .. M.mail,
        '-- Github   : ' .. M.github,
        '-- Creation : ' .. M.datetime,
        '-- ----------------------------------------------------------------------',
        ''
    }
    return header
end

M.generate = function()
    M.filetype = vim.bo.filetype or ""
    M.filename = vim.fn.expand('%:t') or ""
    M.datetime = os.date('%Y-%m-%d %H:%M:%S') or ""

    local header = {}

    -- C/C++/Java头文件模板
    if M.filetype == 'c' or M.filetype == 'cpp' or M.filetype == 'java' then
        header = generate_same_c_header()

    -- Shell脚本模板
    elseif M.filetype == 'sh' then
        header = generate_sh_header()

    -- lua 模板
    elseif M.filetype == 'lua' then
       header = generate_lua_header()

    -- 添加更多文件类型支持...
    end

    vim.api.nvim_buf_set_lines(0, 0, 0, false, header)
    vim.api.nvim_command('normal G') -- 光标移至文件末尾
end

M.setup = function(opts)
    opts = opts or {}

    M.author   = opts.author or ""
    M.mail     = opts.mail   or ""
    M.github   = opts.github or ""

    -- 注册自动命令
    vim.api.nvim_create_autocmd('BufNewFile', {
        pattern = '*',
        callback = M.generate
    })
end

return M
