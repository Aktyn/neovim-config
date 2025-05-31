--require("catppuccin").load("mocha")

return {
  { "catppuccin/nvim", name = "catppuccin", flavour = "mocha", priority = 1000 },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
      catppuccin = {
        flavour = "mocha",
      },
    },
  },
}
