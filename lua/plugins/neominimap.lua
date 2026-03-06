---@module "neominimap.config.meta"
return {
  "Isrothy/neominimap.nvim",
  version = "v3.x.x",
  priority = 100, -- Set a higher priority to load before neo-tree
  lazy = false,
  keys = {},
  click = {
    enable = true,
    auto_switch_focus = true,
  },
  init = function()
    -- The following options are recommended when layout == "float"
    vim.opt.wrap = false
    vim.opt.sidescrolloff = 36 -- Set a large value

    --- Put your configuration here
    ---@type Neominimap.UserConfig
    vim.g.neominimap = {
      auto_enable = true,

      layout = "split",

      -- How many columns a dot should span
      x_multiplier = 4,

      -- How many rows a dot should span
      y_multiplier = 1,
      fold = {
        enabled = true,
      },
    }
  end,
}
