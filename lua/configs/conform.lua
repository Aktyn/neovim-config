local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "eslint", "prettier" },
    typescript = { "eslint", "prettier" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },
  default_format_opts = {
    lsp_format = "prefer", -- Use LSP formatter if available
  },
  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
