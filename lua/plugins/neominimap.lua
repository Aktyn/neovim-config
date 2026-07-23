---@module "neominimap.config.meta"
return {
  "Isrothy/neominimap.nvim",
  version = "v3.x.x",
  -- priority = 100, -- Set a higher priority to load before neo-tree
  -- lazy = false,
  enabled = false,
  event = "VeryLazy",
  keys = {},
  click = {
    enable = true,
    auto_switch_focus = true,
  },
  init = function()
    -- vim.api.nvim_buf_is_valid(0) -- Experimental bugfix
    -- local bufnr = vim.api.nvim_get_current_buf()
    -- local state = vim.b[bufnr].nes_state

    -- Test long line X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X  
    -- if state then

    vim.g.neominimap = {
      auto_enable = true,

      layout = "float",

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
        -- opt.winhighlight = "Normal:Normal,NormalNC:Normal,FloatBorder:Normal"
        opt.winhighlight = table.concat({
          "Normal:NeominimapBackground",
          "FloatBorder:NeominimapBorder",
          "CursorLine:NeominimapCursorLine",
          "CursorLineNr:NeominimapCursorLineNr",
          "CursorLineSign:NeominimapCursorLineSign",
          "CursorLineFold:NeominimapCursorLineFold",
        }, ",")
        opt.cursorline = true
        opt.spell = false
        opt.winblend = 100
      end,

      search = {
        enabled = true, ---@type boolean
        mode = "line",
        priority = 20, ---@type integer
        icon = "󰱽 ", ---@type string
      },

      git = {
        enabled = true, ---@type boolean
        mode = "sign",
        priority = 6, ---@type integer
        icon = {
          add = "+ ", ---@type string
          change = "~ ", ---@type string
          delete = "- ", ---@type string
        },
      },

      fold = {
        enabled = true,
      },
      ---@type string[]
      exclude_filetypes = {
        "help",
        "bigfile", -- For Snacks.nvim
      },

      ---@type string[]
      exclude_buftypes = {
        "nofile",
        "nowrite",
        "quickfix",
        "terminal",
        "prompt",
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
    -- end
  end,
}
