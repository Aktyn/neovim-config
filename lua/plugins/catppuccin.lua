return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    flavour = "mocha",
    priority = 1000,
    config = function()
      require("catppuccin").load("mocha")
      vim.cmd.colorscheme = "catppuccin"
    end,
  },
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
