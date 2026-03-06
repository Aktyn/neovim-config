-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

vim.o.winbar = " %{%v:lua.vim.fn.expand('%:~:.')%}"
-- %{%v:lua.require'nvim-navic'.get_location()%}"
vim.o.relativenumber = false
vim.o.wrap = true
-- vim.opt.wrap = true
vim.opt.nu = true
vim.opt.tabstop = 2
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
--vim.opt.colorcolumn = "120" -- for line length warnings
vim.opt.updatetime = 50

vim.g.root_spec = { "cwd" }

---- NEOVIDE OPTIONS ----
--vim.o.guifont = "JetBrains Mono:h12"
-- vim.o.guifont = "JetBrainsMono Nerd Font Propo:h12"
vim.o.guifont = "Monaspace_Neon_Frozen,JetBrainsMono_Nerd_Font_Propo,FreeMono:h11"

if vim.g.neovide then
  vim.g.neovide_font_hinting = "none"
  vim.g.neovide_font_edging = "subpixelantialias"
  vim.g.neovide_scale_factor = 1.0
  --vim.g.neovide_padding_bottom = 0
  -- vim.g.neovide_refresh_rate = 60 -- it is synchronized with display refresh rate by default
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_profiler = false
  --vim.g.neovide_cursor_animation_length = 0.1
  --vim.g.neovide_cursor_short_animation_length = 0.1
  --vim.g.neovide_cursor_animation_length = 0.150
  vim.g.neovide_cursor_trail_size = 0
  vim.g.neovide_cursor_smooth_blink = true
  vim.o.guicursor =
    "n-v-c-sm:block-blinkon700-blinkoff700-blinkwait1000-TermCursor,i-ci-ve:ver25-blinkon700-blinkoff700-blinkwait1000,r-cr-o:hor20,t:block-blinkon500-blinkoff500-TermCursor"
  -- vim.g.neovide_cursor_vfx_mode = "torpedo"
  vim.g.neovide_cursor_vfx_mode = { "", "" }

  vim.g.neovide_normal_opacity = 0.85
  vim.g.neovide_normal_opacity = 0.85
end

-- Experimental option for synchonizing background:
vim.api.nvim_create_autocmd({ "UIEnter", "ColorScheme" }, {
  callback = function()
    local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
    if not normal.bg then
      return
    end
    io.write(string.format("\027]11;#%06x\027\\", normal.bg))
  end,
})

vim.api.nvim_create_autocmd("UILeave", {
  callback = function()
    io.write("\027]111\027\\")
  end,
})
