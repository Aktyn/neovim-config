return {
  -- Dim the unused variables and functions using lsp and treesitter.
  "narutoxy/dim.lua",
  event = "BufRead",
  dependencies = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
  config = true,
}
