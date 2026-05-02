require("nvchad.configs.lspconfig").defaults()

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
local servers = { "html", "cssls", "tailwindcss", "ts_ls", "eslint", "jsonls", "yamlls", "postgres_lsp", "bashls", "copilot" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

vim.diagnostic.config({ virtual_text = false })
