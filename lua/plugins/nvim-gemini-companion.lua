return {
  "gutsavgupta/nvim-gemini-companion",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  config = function()
    require("gemini").setup({
      cmds = { "gemini" },
    })
  end,
  keys = {
    { "<leader>ag", "<cmd>GeminiToggle<cr>", desc = "Toggle Gemini sidebar" },
    { "<leader>ac", "<cmd>GeminiSwitchToCli<cr>", desc = "Spawn or switch to AI session" },
    { "<leader>aS", "<cmd>GeminiSend<cr>", mode = { "x" }, desc = "Send selection to Gemini" },
  },
}
