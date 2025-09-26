
local function generate_header()
    local filetype = vim.bo.filetype
    local filename = vim.fn.expand('%:t')
    local datetime = os.date('%Y-%m-%d %H:%M:%S')
    local author = "sun.wang"
    local mail = "sunsir@163.com"
    local github = "github.com/sunowsir"

    -- C/C++/Java头文件模板
    if filetype == 'c' or filetype == 'cpp' or filetype == 'java' then
        local header = {
          '/*',
          ' * File     : '..filename,
          ' * Author   : '..author,
          ' * Mail     : '..mail,
          ' * Github   : '..github,
          ' * Creation : '..datetime,
          ' */',
          ''
        }
        vim.api.nvim_buf_set_lines(0, 0, 0, false, header)

    -- Shell脚本模板
    elseif filetype == 'sh' then
        local shebang = '#!/bin/bash'
        local header = {
          '#########################################################################',
          '# File Name: '..filename,
          '# Author: '..author,
          '# Mail: '..mail,
          '# Github: '..github,
          '# Created Time: '..datetime,
          '#########################################################################',
          shebang,
          ''
        }
        vim.api.nvim_buf_set_lines(0, 0, 0, false, header)

    -- 添加更多文件类型支持...
    end
    vim.api.nvim_command('normal G') -- 光标移至文件末尾
end

-- 注册自动命令
vim.api.nvim_create_autocmd('BufNewFile', {
    pattern = '*',
    callback = generate_header
})

