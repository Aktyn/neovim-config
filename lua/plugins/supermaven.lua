return {
  "supermaven-inc/supermaven-nvim",
  event = "VeryLazy",
  enabled = true,
  config = function()
    require("supermaven-nvim").setup({})
  end,
}
