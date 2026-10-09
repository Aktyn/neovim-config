-- Show context of code blocks using Treesitter
return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "VeryLazy",
  opts = {
    enable = true,
    mode = "topline",
    max_lines = 0,
  },
}
