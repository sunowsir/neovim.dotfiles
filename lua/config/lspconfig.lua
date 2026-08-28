--
-- File     : lspconfig.lua
-- Author   : sun.wang
-- Mail     : sunowsir@163.com
-- Github   : github.com/sunowsir
-- Creation : 2026-08-28 20:11:15
--

-- lsp检查提示信息 (适配 Neovim 0.10+ / 0.12 语法)
vim.diagnostic.config({
  virtual_text = true,
  update_in_insert = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅙",
      [vim.diagnostic.severity.WARN]  = "",
      [vim.diagnostic.severity.HINT]  = "󰌵",
      [vim.diagnostic.severity.INFO]  = "󰋼",
    },
  },
})

-- 加载lsp
local servers = {
  "ty",
  "bash-language-server",
  "docker-compose-langserver",
  "docker-langserver",
  "lua-language-server",
  "clangd",
  "cmake-language-server",
  "markdown-oxide",
  "matlab-language-server",
  "rust_analyzer",
}

for _, server in ipairs(servers) do
  vim.lsp.enable(server)
end
