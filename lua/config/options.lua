-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

vim.o.winbar = " %{%v:lua.vim.fn.expand('%:~:.')%}  %{%v:lua.require'nvim-navic'.get_location()%}"

---- NEOVIDE OPTIONS ----
--vim.o.guifont = "JetBrains Mono:h12"
vim.o.guifont = "JetBrainsMono Nerd Font Propo:h12"
vim.g.neovide_scale_factor = 1.0
--vim.g.neovide_padding_bottom = 0
-- vim.g.neovide_refresh_rate = 60 -- it is synchronized with display refresh rate by default
vim.g.neovide_remember_window_size = true
vim.g.neovide_profiler = false
--vim.g.neovide_cursor_animation_length = 0.150
--vim.g.neovide_cursor_animation_length = 0.1
--vim.g.neovide_cursor_short_animation_length = 0.1
vim.g.neovide_cursor_trail_size = 0
vim.g.neovide_cursor_smooth_blink = true
vim.o.guicursor =
  "n-v-c-sm:block-blinkon700-blinkoff700-blinkwait1000-TermCursor,i-ci-ve:ver25-blinkon700-blinkoff700-blinkwait1000,r-cr-o:hor20,t:block-blinkon500-blinkoff500-TermCursor"
--vim.g.neovide_cursor_vfx_mode = "torpedo"
vim.g.neovide_cursor_vfx_mode = { "", "" }
