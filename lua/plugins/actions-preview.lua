-- Preview code actions from LSP
--
-- Code-action keybindings for import/fix cleanup.
-- The LSP "source.*" action kinds are server-specific, so we resolve them
-- per buffer based on the attached language server. This keeps the bindings
-- working across TypeScript, JavaScript, Rust, Python, Go, etc.
--
-- Mapping of server -> { remove_unused, add_missing, fix_all }
local action_kinds = {
  -- TypeScript / JavaScript (typescript-language-server, tsserver)
  tsserver = {
    remove_unused = "source.removeUnused.ts",
    add_missing = "source.addMissingImports.ts",
    fix_all = "source.fixAll.ts",
  },
  -- ESLint (eslint-language-server)
  eslint = {
    remove_unused = "source.removeUnusedImports.eslint",
    add_missing = "source.addMissingImports.eslint",
    fix_all = "source.fixAll.eslint",
  },
  -- Biome
  biome = {
    remove_unused = "source.fixAll.biome",
    add_missing = "source.fixAll.biome",
    fix_all = "source.fixAll.biome",
  },
  -- Ruff (Python)
  ruff = {
    remove_unused = "source.removeUnusedImports.ruff",
    add_missing = "source.addMissingImports.ruff",
    fix_all = "source.fixAll.ruff",
  },
  -- rust-analyzer: does NOT expose source.* actions. Unused-import fixes come
  -- from rustc diagnostics as "quickfix" actions, so we fall back to that.
  rust_analyzer = {
    remove_unused = "quickfix",
    add_missing = "quickfix",
    fix_all = "quickfix",
  },
  -- gopls (Go)
  gopls = {
    remove_unused = "source.removeUnused.go",
    add_missing = "source.addMissingImports.go",
    fix_all = "source.fixAll.go",
  },
}

-- Resolve the active LSP client for the current buffer and look up kinds.
local function kinds_for_buf(bufnr)
  bufnr = bufnr or 0
  local clients = vim.lsp.get_clients({ bufnr = bufnr })
  for _, client in ipairs(clients) do
    local kinds = action_kinds[client.name]
    if kinds then
      return kinds
    end
  end
  return nil
end

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
    {
      "<leader>cu",
      function()
        local kinds = kinds_for_buf()
        vim.lsp.buf.code_action({
          apply = true,
          context = {
            only = kinds and { kinds.remove_unused } or { "source.removeUnused.ts", "source.removeUnusedImports.eslint", "quickfix" },
            diagnostics = {},
          },
        })
      end,
      mode = { "n", "v" },
      desc = "Remove unused imports",
    },
    {
      "<leader>cm",
      function()
        local kinds = kinds_for_buf()
        vim.lsp.buf.code_action({
          apply = true,
          context = {
            only = kinds and { kinds.add_missing } or { "source.addMissingImports.ts", "source.addMissingImports.eslint", "quickfix" },
            diagnostics = {},
          },
        })
      end,
      mode = { "n", "v" },
      desc = "Add missing imports",
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