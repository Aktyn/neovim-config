return {
  "teocns/neocursor.nvim",
  -- lazy = false,
  version = "*",
  event = "InsertEnter",
  build = "uv run --with 'httpx[http2]' python -c 'import httpx'", -- pre-warm the sidecar
  opts = {
    map_tab = false,
  },
}
