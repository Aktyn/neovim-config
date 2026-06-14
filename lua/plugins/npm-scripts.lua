return {
  "maxolasersquad/npm-scripts.nvim",
  cmd = { "Npm" },
  event = "VeryLazy",
  config = function()
    require("npm")
    -- Optional: Add your key mapping here
    vim.api.nvim_set_keymap("n", "<leader>npm", ":Npm ", { noremap = true, silent = false })
  end,
}
