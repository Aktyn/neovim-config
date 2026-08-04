return {
  "kylechui/nvim-surround",
  event = "VeryLazy",
  priority = 200,
  -- Disable visual mode mappings (S, gS) to let cutlass handle S for change without yank
  -- Use ys/yss/yS/ySS in normal mode for surrounding instead
  init = function()
    vim.g.nvim_surround_no_visual_mappings = true
  end,
  -- Optional: See `:h nvim-surround.configuration` and `:h nvim-surround.setup` for details
  -- config = function()
  --   require("nvim-surround").setup({
  --     -- Put your configuration here
  --   })
  -- end,
}
