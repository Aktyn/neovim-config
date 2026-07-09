-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",
  transparency = true,

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}
vim.api.nvim_create_autocmd({ "UIEnter", "ColorScheme" }, {
  pattern = "*",
  callback = function()
    local base46 = require("base46")
    base46.toggle_transparency()
    vim.defer_fn(function()
      base46.toggle_transparency()
    end, 1000)
  end,
})
-- vim.api.nvim_create_autocmd("UILeave", {
--   callback = function()
--     -- io.write("\027]111\027\\")
--     local base46 = require("base46")
--     base46.toggle_transparency(false)
--   end,
-- })

-- M.nvdash = { load_on_startup = true }
M.ui = {
  tabufline = {
    enabled = false,
    lazyload = false,
  },
}

return M
