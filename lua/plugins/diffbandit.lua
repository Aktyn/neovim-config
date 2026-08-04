return {
  "CoreyKaylor/diffbandit.nvim",
  event = "VeryLazy",
  config = function()
    require("diffbandit").setup()
  end,
}
