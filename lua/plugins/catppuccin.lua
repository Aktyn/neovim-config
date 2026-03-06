return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    flavour = "mocha",
    priority = 1000,
    lazy = false,
    opts = {
      flavour = "mocha",
      -- transparent_background = true,
      term_colors = true,
      custom_highlights = function(colors)
        return {
          -- Normal = { bg = colors.bg },
          Comment = { style = { "italic" } },
        }
      end,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        notify = true,
        mini = {
          enabled = true,
          -- indentscope_color = "#ff5555",
        },
      },
    },
  },
}
