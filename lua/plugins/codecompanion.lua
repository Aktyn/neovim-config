return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/codecompanion-history.nvim",
    -- "ravitemer/mcphub.nvim" -- ?
  },
  event = "VeryLazy",
  version = "^19.0.0", -- Mind breaking changes when updating
  opts = {
    interactions = {
      chat = {
        adapter = "openrouter",
      },
      inline = {
        adapter = "openrouter",
      },
      -- cli = {
      --   agent = "gemini_cli",
      --   agents = {
      --     gemini_cli = {
      --       cmd = "agy",
      --       args = {
      --         "--dangerously-skip-permissions",
      --       },
      --       description = "Gemini CLI",
      --       provider = "terminal",
      --     },
      --   },
      -- },
    },
    -- adapters = {
    -- http = {
    --   openrouter = function()
    --     return require("codecompanion.adapters").extend("openrouter", {
    --       env = {
    --         api_key = "OPENROUTER_API_KEY",
    --       },
    --     })
    --   end,
    -- },
    -- },
    adapters = {
      openrouter = function()
        return require("codecompanion.adapters").extend("openai_compatible", {
          env = {
            url = "https://openrouter.ai/api",
            api_key = "OPENROUTER_API_KEY", -- Or use a command like "cmd:echo $OPENROUTER_KEY"
            chat_url = "/v1/chat/completions",
          },
          schema = {
            model = {
              -- default = "openai/gpt-4o-mini", -- Set your preferred default model
              default = "openrouter/owl-alpha", -- Set your preferred default model
              choices = {
                "openrouter/owl-alpha",
              --   -- "anthropic/claude-3.7-sonnet",
              --   -- "google/gemini-2.0-flash-001",
              --   -- "openai/gpt-4o-mini",
              --   -- Add more model slugs from OpenRouter as needed
              },
            },
          },
        })
      end,
    },
  },
}
