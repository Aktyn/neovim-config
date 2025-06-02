return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
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
      },

      source_selector = {
        winbar = true,
        -- statusline = false,
        truncation_character = "|",
      },

      filesystem = {
        follow_current_file = {
          enabled = false,
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

      git_status = {
        -- window = {
        --   position = "right",
        -- },
      },
    })
    vim.keymap.set("n", "<leader>T", "<Cmd>Neotree reveal buffers<CR>")
  end,
}
