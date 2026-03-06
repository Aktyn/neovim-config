return {
  "leonardcser/cursortab.nvim",
  version = "*", -- Use latest tagged version for more stability
  lazy = false, -- The server is already lazy loaded
  build = "cd server && go build",
  config = function()
    require("cursortab").setup({
      enabled = false,
      log_level = "trace",
      keymaps = {
        accept = false,
      },

      -- provider = {
      --   type = "inline", -- Provider: "inline", "fim", "sweep", "sweepapi", "zeta", "copilot", or "mercuryapi"
      --   url = "http://localhost:11434", -- URL of the provider server
      --   -- api_key_env = "", -- Env var name for API key (e.g., "OPENAI_API_KEY")
      --   model = "qwen3-coder-next:cloud", -- Model name
      --   -- temperature = 0.0, -- Sampling temperature
      --   -- max_tokens = 512, -- Max tokens to generate
      --   -- top_k = 50, -- Top-k sampling
      --   completion_timeout = 5000, -- Timeout in ms for completion requests
      --   -- max_diff_history_tokens = 512, -- Max tokens for diff history (0 = no limit)
      --   -- completion_path = "/v1/completions", -- API endpoint path
      --   privacy_mode = true, -- Don't send telemetry to provider
      -- },
      provider = {
        type = "copilot",
        completion_timeout = 5000, -- Timeout in ms for completion requests
      },

      -- blink = {
      -- enabled = false, -- Enable blink source
      -- ghost_text = true, -- Show native ghost text alongside blink menu
      -- },
    })
  end,
}
