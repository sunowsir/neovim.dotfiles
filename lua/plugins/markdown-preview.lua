--
-- File     : markdown-preview.lua
-- Author   : sun.wang
-- Mail     : sunowsir@163.com
-- Github   : github.com/sunowsir
-- Creation : 2025-10-12 20:12:00
--

return {{
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
}}
