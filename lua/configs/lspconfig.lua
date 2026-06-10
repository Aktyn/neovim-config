require("nvchad.configs.lspconfig").defaults()

-- read :h vim.lsp.config for changing options of lsp servers

vim.diagnostic.config({ virtual_text = false })

local function extend_lsp_config(name, opts)
  local base = vim.lsp.config[name]
  if type(base) ~= "table" then
    return
  end
  vim.lsp.config(name, vim.tbl_deep_extend("force", base, opts))
end

-- QML / Quickshell
-- Use the system Qt qmlls and explicit Qt6 import dir for better stability.
vim.lsp.config("qmlls", {
  cmd = {
    "/usr/lib/qt6/bin/qmlls",
    "--no-cmake-calls",
    "--ignore-settings",
    "-I",
    "/usr/lib/qt6/qml",
  },
  filetypes = { "qml", "qmljs" },
  root_dir = function(bufnr, on_dir)
    local path = vim.api.nvim_buf_get_name(bufnr)
    if path == "" then
      on_dir(vim.fn.getcwd())
      return
    end
    -- Keep workspace small to avoid qmlls startup crashes while indexing large trees.
    on_dir(vim.fs.dirname(path))
  end,
})

extend_lsp_config("ts_ls", {
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

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
local servers =
  { "html", "cssls", "tailwindcss", "pylsp", "ts_ls", "eslint", "jsonls", "yamlls", "postgres_lsp", "bashls", "qmlls" }
vim.lsp.enable(servers)
