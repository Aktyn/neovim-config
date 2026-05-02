return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,
  ---@type snacks.Config
  opts = {
    input = { enabled = true },
    picker = { enabled = true },
    indent = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    image = { enabled = true },
    statuscolumn = { enabled = true },
    animate = { enabled = true },
    scroll = { enabled = true },
    words = { enabled = true },
    bigfile = { enabled = true },
  },
}
