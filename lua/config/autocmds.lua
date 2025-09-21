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


-- 复制时高亮显示复制区域，防止出错
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("UserHighlightYank", { clear = true }),
    callback = function()
        vim.hl.on_yank({ higroup = "Visual" })
    end,
})

