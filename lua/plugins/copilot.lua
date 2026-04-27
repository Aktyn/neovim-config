return {
  {
    "zbirenbaum/copilot.lua",
    requires = {
      "copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
    },
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = true },
        nes = {
          enabled = true, -- requires copilot-lsp as a dependency
          auto_trigger = true,
          -- keymap = {
          -- accept_and_goto = false,
          -- accept = false,
          -- dismiss = false,
          -- },
        },
        panel = { enabled = false },
      })
    end,
  },
}
