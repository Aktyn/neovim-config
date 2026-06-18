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
      desc = "Code actions preview",
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
      desc = "Organize imports",
    },
    {
      "<leader>cf",
      function()
        vim.lsp.buf.code_action({
          apply = true,
          context = { only = { "source.fixAll" }, diagnostics = {} },
        })
      end,
      mode = { "n", "v" },
      desc = "Fix all",
    },
    {
      "<leader>cq",
      function()
        vim.lsp.buf.code_action({
          apply = true,
          context = { only = { "quickfix" }, diagnostics = {} },
        })
      end,
      mode = { "n", "v" },
      desc = "Quickfix",
    },
  },
  config = function()
    require("actions-preview").setup({
      backend = { "telescope", "snacks", "nui" },
      telescope = vim.tbl_extend("force", require("telescope.themes").get_dropdown(), {
        make_value = nil,
        make_make_display = nil,
      }),
      snacks = {
        layout = { preset = "default" },
      },
    })
  end,
}
