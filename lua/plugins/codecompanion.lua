return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/codecompanion-history.nvim",
    -- "ravitemer/mcphub.nvim" -- ?
  },
  event = "VeryLazy",
  version = "^19.0.0", -- Watch out for breaking changes when updating
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
    tools = {
      opts = {
        auto_approve = true, -- Enable auto-approval by default
      },
    },
    adapters = {
      http = {
        openrouter = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = "https://openrouter.ai/api",
              api_key = "OPENROUTER_API_KEY", -- Or use a command like "cmd:echo $OPENROUTER_KEY"
              chat_url = "/v1/chat/completions",
            },
            schema = {
              model = {
                default = "nvidia/nemotron-3-ultra-550b-a55b:free", -- Set your preferred default model
                choices = {
                  "nvidia/nemotron-3-ultra-550b-a55b:free",
                  "nvidia/nemotron-3-ultra-550b-a55b",
                  "nvidia/nemotron-3-super-120b-a12b",
                  "nvidia/nemotron-3-nano-30b-a3b",
                },
              },
            },
          })
        end,
      },
    },
    extensions = {
      history = {
        enabled = true, -- defaults to true
        opts = {
          dir_to_save = vim.fn.stdpath("cache") .. "/codecompanion_chats.json",
        },
      },
    },
  },
}
