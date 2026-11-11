return {
  -- Managing Cargo.toml dependencies
  {
    "saecki/crates.nvim",
    ft = { "toml" },
    config = function()
      require("crates").setup()
    end,
  },

  -- Rust-analyzer & Rust tools integration
  {
    "mrcjkb/rustaceanvim",
    lazy = false, -- This plugin already handles lazy-loading internally
    config = function()
      vim.g.rustaceanvim = {
        -- LSP configuration
        server = {
          on_attach = function(client, bufnr)
            -- Add your custom LSP keymaps here (e.g., K for hover, gd for definition)
          end,
          default_settings = {
            ["rust-analyzer"] = {
              checkOnSave = false,
              diagnostics = {
                enable = false,
              },
              check = {
                command = "clippy",
              },
              cargo = {
                allFeatures = true,
              },
            },
          },
        },
      }
    end,
  },
}
