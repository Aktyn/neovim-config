-- Visual diff tool for Git and file comparisons
return {
  "CoreyKaylor/diffbandit.nvim",
  event = "VeryLazy",
  config = function()
    require("diffbandit").setup()
  end,
}
