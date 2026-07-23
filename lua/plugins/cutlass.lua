return {
  "gbprod/cutlass.nvim",
  dependencies = { "kylechui/nvim-surround" },
  event = "VeryLazy",
  priority = 50,
  opts = {
    cut_key = "x", -- Optional: map 'x' to actual cut (yank + delete)
    override_del = true, -- Make <Del> key also use black hole
    exclude = {}, -- Keys to exclude from overriding
    registers = {
      select = "_",
      delete = "_",
      change = "_",
    },
  },
}
