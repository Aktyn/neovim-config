return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require("configs.conform"),
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      require("configs.lspconfig")
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      compilers = { "clang" },
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "typescript", "tsx", "javascript"
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        mappings = {
          i = { -- Insert mode mappings
            ["<C-Up>"] = require("telescope.actions").cycle_history_prev,
            ["<C-Down>"] = require("telescope.actions").cycle_history_next,
          },
          n = { -- Normal mode mappings
            ["<C-Up>"] = require("telescope.actions").cycle_history_prev,
            ["<C-Down>"] = require("telescope.actions").cycle_history_next,
          },
        },
      },
      extensions = {
        recent_files = {
          only_cwd = true,
        },
      },
    },
  }
}
