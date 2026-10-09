-- OpenCode AI assistant integration
return {
  "sudo-tee/opencode.nvim",
  event = "VeryLazy",
  dependencies = {
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        anti_conceal = { enabled = false },
        file_types = { "markdown", "opencode_output" },
      },
      ft = { "markdown", "Avante", "copilot-chat", "opencode_output" },
    },
    -- Optional, for file mentions and commands completion, pick only one
    -- "saghen/blink.cmp",
    "hrsh7th/nvim-cmp",

    -- Optional, for file mentions picker, pick only one
    -- "folke/snacks.nvim",
    "nvim-telescope/telescope.nvim",
    -- 'ibhagwan/fzf-lua',
    -- 'nvim_mini/mini.nvim',
  },
  config = function()
    require("opencode").setup({
      keymap_prefix = "<leader>a",
      opencode_executable = "/home/aktyn/.opencode/bin/opencode",
      keymap = {
        editor = {
          ["<leader>oa"] = { "open_input" },
        },
        input_window = {
          ["<C-s>"] = { "submit_input_prompt", mode = { "n", "i" } },
        },
      },
    })
  end,
}
