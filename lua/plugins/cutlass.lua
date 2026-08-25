return {
  "gbprod/cutlass.nvim",
  event = "BufEnter",
  lazy = true,
  config = function()
    require("cutlass").setup({
      cut_key = "x", -- Optional: map 'x' to actual cut (yank + delete)
      override_del = true, -- Make <Del> key also use black hole
      -- exclude = {}, -- Keys to exclude from overriding
      registers = {
        select = "_",
        delete = "_",
        change = "_",
      },
    })
  end,
}
