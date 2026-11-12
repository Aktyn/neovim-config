-- Neotest runner framework
return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "marilari88/neotest-vitest",
    "mrcjkb/rustaceanvim",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-vitest"),
        require("rustaceanvim.neotest"),
      },
    })
  end,
}
