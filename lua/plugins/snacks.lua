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
    image = {
      enabled = true,
      doc = {
        inline = true, --false
--         float = true,
        max_width = 40,
        max_height = 40,
      },
    },
    statuscolumn = { enabled = true },
    animate = { enabled = true },
    scroll = { enabled = true },
    words = { enabled = true },
    bigfile = { enabled = true },
    git = { enabled = true },
  },
  keys = {
    {
      "<leader>gb", -- Your preferred keymap
      function()
        Snacks.git.blame_line()
      end,
      desc = "Git Blame Line",
    },
  },
}
