return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    opts = {},
    config = function()
      require("tiny-inline-diagnostic").setup({

        options = {
          enable_on_insert = true, -- important
          enable_on_select = true,

          multilines = {
            enabled = true,
          },
          show_source = {
            enabled = true,
          },
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = { diagnostics = { virtual_text = false } },
  },
}
