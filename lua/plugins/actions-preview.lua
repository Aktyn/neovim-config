return {
  "aznhe21/actions-preview.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {
      "<leader>ca",
      function()
        require("actions-preview").code_actions()
      end,
      mode = { "n", "v" },
      desc = "Code Actions Preview",
    },
    {
      "<leader>co",
      function()
        vim.lsp.buf.code_action({
          apply = true,
          context = { only = { "source.organizeImports" }, diagnostics = {} },
        })
      end,
      mode = { "n", "v" },
      desc = "Organize Imports",
    },
  },
  config = function()
    require("actions-preview").setup({
      backend = { "telescope", "nui" },
      telescope = require("telescope.themes").get_dropdown({
        winblend = 10,
        border = true,
        previewer = true,
      }),
    })
  end,
}
