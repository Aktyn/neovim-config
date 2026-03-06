return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
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

      git_status = {},
    })

    -- Autocmd to reveal neo-tree buffers on startup
    vim.api.nvim_create_autocmd("VimEnter", {
      group = vim.api.nvim_create_augroup("NeoTreeVimEnter", { clear = true }),
      callback = function()
        -- Only open neo-tree if no files were passed as arguments and it's not already open
        if vim.fn.argc() == 0 then
          local manager = require("neo-tree.sources.manager")
          -- Something is wrong with this line
          if manager and manager.is_opened and manager.is_opened() then
            require("neo-tree.command").reveal("buffers")
          end
        end
      end,
    })
    vim.keymap.set("n", "<leader>T", function()
      vim.cmd("Neotree buffers reveal")
    end, { desc = "Neo-tree Reveal Buffers" })
  end,
}
