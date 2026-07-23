return {
  "hedyhli/outline.nvim",
  -- lazy = false,
  event = "VeryLazy",
  config = function()
    -- Example mapping to toggle outline
    vim.keymap.set("n", "<leader>O", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

    require("outline").setup({
      keymaps = {
        up_and_jump = "<up>",
        down_and_jump = "<down>",
      },
      -- symbol_folding = {
      --   auto_unfold = {
      --     only = 2,
      --   },
      -- },
    })
  end,
}
