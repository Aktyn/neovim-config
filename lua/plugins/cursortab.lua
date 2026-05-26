return {
  {
    "cursortab/cursortab.nvim",
    dependencies = { "zbirenbaum/copilot.lua" },
    lazy = false,
    build = "cd server && go build",
    config = function()
      -- Ensure copilot_ls is enabled for cursortab to use it
      if vim.lsp.enable then
        vim.lsp.enable("copilot_ls")
      end

      require("cursortab").setup({
        provider = {
          type = "copilot",
        },
        -- provider = {
        --   type = "sweep",
        --   model = "maternion/sweep-next-edit-1.5B",
        --   url = "localhost:11434"
        -- },
        behavior = {
          cursor_prediction = {
            enabled = true,
            auto_advance = true,
          },
        },
        keymaps = {
          -- We handle these via cmp mappings to avoid conflict
          accept = false,
          partial_accept = false,
        },
      })
    end,
  },
}

