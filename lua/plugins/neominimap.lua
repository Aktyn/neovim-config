---@module "neominimap.config.meta"
return {
  "Isrothy/neominimap.nvim",
  version = "v3.x.x",
  priority = 100, -- Set a higher priority to load before neo-tree
  lazy = true,
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
      y_multiplier = 1, -- Moderately dense

      split = {
        minimap_width = 30, -- Standard width
        fix_width = true,
      },

      winopt = function(opt)
        -- Ensure minimap uses standard Normal highlight for transparency
        opt.winhighlight = "Normal:Normal,NormalNC:Normal,FloatBorder:Normal"
      end,

      fold = {
        enabled = true,
      },
    }

    -- Ensure the minimap background is transparent by linking it to Normal
    vim.api.nvim_set_hl(0, "NeominimapBackground", { link = "Normal" })

    local ok, coord = pcall(require, "neominimap.map.coord")
    if ok then
      local old_bitmap_to_code = coord.bitmap_to_code
      coord.bitmap_to_code = function(bitmap)
        if bitmap == 0 then
          return 32 -- ASCII Space
        end
        return old_bitmap_to_code(bitmap)
      end
    end
  end,
}
