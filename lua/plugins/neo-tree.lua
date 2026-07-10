return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },

  priority = 150, -- Set a higher priority to load before neo-tree
  lazy = false,
  config = function()
    require("neo-tree").setup({
      window = {
        position = "right",
        width = 50,
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        mappings = {
          ["<Tab>"] = "next_source",
          ["<S-Tab>"] = "prev_source",
        },
      },

      source_selector = {
        winbar = true,
        truncation_character = "|",
      },

      filesystem = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },

      buffers = {
        show_unloaded = true,
      },

      git_status = {},
    })
    vim.keymap.set("n", "<leader>T", function()
      vim.cmd("Neotree buffers reveal")
    end, { desc = "Neo-tree Reveal Buffers" })
  end,
}
