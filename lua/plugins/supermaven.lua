return {
  "supermaven-inc/supermaven-nvim",
  event = "VeryLazy",
  enabled = false,
  config = function()
    require("supermaven-nvim").setup({})
  end,
}
