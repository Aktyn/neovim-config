require("nvchad.configs.lspconfig").defaults()

-- Global LSP client flags for all servers
vim.lsp.config("*", {
  flags = {
    allow_incremental_sync = true,
    debounce_text_changes = 300,
  },
})

-- read :h vim.lsp.config for changing options of LSP servers

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

local js_ts_inlay_hints_options = {
  includeInlayParameterNameHints = "literals",
  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
  includeInlayFunctionParameterTypeHints = true,
  includeInlayVariableTypeHints = true,
  includeInlayVariableTypeHintsWhenTypeMatchesName = false,
  includeInlayPropertyDeclarationTypeHints = true,
  includeInlayFunctionLikeReturnTypeHints = true,
  includeInlayEnumMemberValueHints = false,
}
extend_lsp_config("ts_ls", {
  settings = {
    typescript = {
      inlayHints = js_ts_inlay_hints_options,
    },
    javascript = {
      inlayHints = js_ts_inlay_hints_options,
    },
  },
})

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
local servers = {
  "html",
  "cssls",
  "tailwindcss",
  "pylsp",
  "ts_ls",
  "eslint",
  "jsonls",
  "yamlls",
  "postgres_lsp",
  "bashls",
  "qmlls",
  "markdown_oxide",
  "clangd",
  "cmake",
  "taplo",
}
extend_lsp_config("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "--fallback-style=llvm",
  },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
})

extend_lsp_config("cmake", {
  cmd = { "cmake-language-server" },
  filetypes = { "cmake" },
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    on_dir(vim.fs.dirname(vim.fs.find({ "CMakeLists.txt", "build" }, { upward = true, path = fname })[1] or fname))
  end,
})

vim.lsp.enable(servers)

-- bacon-ls: live cargo/clippy diagnostics on every keystroke.
-- rust-analyzer cannot run cargo check on unsaved buffers, so we let
-- bacon-ls own the cargo diagnostics and keep rust-analyzer for completion,
-- hover, go-to-definition, and its own (lighter) incremental diagnostics.
vim.lsp.config("bacon-ls", {
  cmd = { "bacon-ls" },
  filetypes = { "rust" },
  init_options = {
    cargo = { updateOnInsert = true },
  },
  settings = {
    bacon_ls = {
      backend = "cargo",
      cargo = {
        command = "clippy",
        updateOnInsertDebounceMillis = 500,
      },
    },
  },
})
vim.lsp.enable("bacon-ls")

-- LSP progress indicator (spinner + percentage in the message area)
require("configs.lsp-progress")
