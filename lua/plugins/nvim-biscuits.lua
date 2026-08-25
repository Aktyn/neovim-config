return {
  "code-biscuits/nvim-biscuits",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  priority = 1,
  event = "VeryLazy",
  config = function()
    require("nvim-biscuits").setup({
      toggle_keybind = "<leader>db", -- Disable/enable biscuits
      show_on_start = true, -- Enable by default
      cursor_line_only = true
    })

    -- highlight BiscuitColor ctermfg=cyan
    vim.api.nvim_set_hl(0, "BiscuitColor", { fg = "#303030" })
  end,
}
