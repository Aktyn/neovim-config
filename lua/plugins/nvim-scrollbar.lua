return {
  "petertriho/nvim-scrollbar",
  event = "BufReadPost",
  dependencies = {
    "kevinhwang91/nvim-hlslens",
    "lewis6991/gitsigns.nvim",
  },
  config = function()
    require("hlslens").setup()
    require("scrollbar.handlers.search").setup()
    require("scrollbar.handlers.gitsigns").setup()

    require("scrollbar").setup({
      show = true,
      show_in_active_only = true,
      hide_if_all_visible = true,
      throttle_ms = 33,
      handlers = {
        cursor = true,
        diagnostic = true,
        gitsigns = true, -- Requires gitsigns
        handle = true,
        search = true, -- Requires hlslens
        ale = false, -- Requires ALE
      },
    })
  end,
}
