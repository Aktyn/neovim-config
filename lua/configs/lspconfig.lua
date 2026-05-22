require("nvchad.configs.lspconfig").defaults()

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
local servers =
  { "html", "cssls", "tailwindcss", "pylsp", "ts_ls", "eslint", "jsonls", "yamlls", "postgres_lsp", "bashls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

vim.diagnostic.config({ virtual_text = false })

vim.lsp.config("ts_ls", {
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
  },
})
vim.lsp.enable("ts_ls")
