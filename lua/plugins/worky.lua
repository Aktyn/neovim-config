-- Git worktrees management via Telescope
return {
  "GRVYDEV/worky.nvim",
  lazy = true,
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  cmd = "Worky",
  keys = {
    {
      "<leader>gw",
      function()
        require("worky").pick()
      end,
      desc = "Git Worktrees",
    },
  },
  opts = {},
}
