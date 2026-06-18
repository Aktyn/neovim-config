return {
  "mceazy2700/antigravity-cli.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "folke/snacks.nvim", -- Optional: for the "snacks" terminal provider
  },
  opts = {
    -- See Configuration section for options
    terminal = {
      provider = "native",
    },
  },
  keys = {
    { "<leader>a", nil, desc = "AI/Antigravity" },
    { "<leader>ac", "<cmd>Antigravity<cr>", desc = "Toggle Antigravity" },
    { "<leader>ar", "<cmd>AntigravityResume<cr>", desc = "Resume Antigravity" },
    { "<leader>am", "<cmd>AntigravitySelectModel<cr>", desc = "Select Antigravity model" },
    { "<leader>aa", "<cmd>AntigravityAsk<cr>", desc = "Ask Antigravity", mode = { "n", "v" } },
    {
      "<leader>ab",
      function()
        require("antigravity-cli.integrations").add_to_context(vim.api.nvim_buf_get_name(0))
      end,
      desc = "Add current buffer to Antigravity context",
    },
    -- Diff management (when in a (proposed) buffer)
    { "<leader>ay", "<cmd>AntigravityDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>an", "<cmd>AntigravityDiffDeny<cr>", desc = "Deny diff" },
  },
}
