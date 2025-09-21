-- Remove Global Default Key mapping
vim.keymap.del("n", "grn")
vim.keymap.del("n", "gra")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "gO")

-- lsp快捷键
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function (args)
        local keymap = vim.keymap
        local lsp = vim.lsp
	    local bufopts = { noremap = true, silent = true }

        keymap.set("n", "gr", lsp.buf.references, bufopts)
        keymap.set("n", "gd", lsp.buf.definition, bufopts)
        keymap.set("n", "<space>rn", lsp.buf.rename, bufopts)
        keymap.set("n", "K", lsp.buf.hover, bufopts)
        keymap.set("n", "<space>f", function()
            vim.lsp.buf.format({ async = true })
        end, bufopts)
    end
})

-- lsp检查提示信息
vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = true,
    signs = {
        active = { {
            name = "DiagnosticSignError",
            text = "󰅙",
            texthl = "DiagnosticSignError"
        }, {
            name = "DiagnosticSignWarn",
            text = "",
            texthl = "DiagnosticSignWarn"
        }, {
            name = "DiagnosticSignHint",
            text = "󰌵",
            texthl = "DiagnosticSignHint"
        }, {
            name = "DiagnosticSignInfo",
            text = "󰋼",
            texthl = "DiagnosticSignInfo"
        } }
    }
})

-- 加载lsp
vim.lsp.enable({ "ty" })
vim.lsp.enable({ "bash-language-server" })
vim.lsp.enable({ "docker-compose-langserver" })
vim.lsp.enable({ "docker-langserver" })
vim.lsp.enable({ "lua-language-server" })
vim.lsp.enable({ "clangd" })
vim.lsp.enable({ "cmake-language-server" })
