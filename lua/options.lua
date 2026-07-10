require("nvchad.options")

vim.opt.updatetime = 100

vim.g.root_spec = { "cwd" }

vim.opt.termguicolors = true
vim.o.mousemoveevent = true
vim.o.cursorlineopt = "both" -- to enable cursorline!
vim.o.winbar = " %{%v:lua.vim.fn.expand('%:~:.')%}" -- Display relative file path in the window bar
vim.o.wrap = true -- Enable soft line wrapping
vim.opt.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for
vim.opt.undofile = true -- Save undo history to a file
vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.smartcase = true -- Override ignorecase if search pattern contains upper case characters
vim.g.loaded_perl_provider = 0 -- Disable Perl provider
vim.g.loaded_ruby_provider = 0 -- Disable Ruby provider
-- vim.o.guifont = "Monaspace_Neon_Frozen,JetBrainsMono_Nerd_Font_Propo,FreeMono:h11" 
vim.o.guifont = "Monaspace Neon Frozen,JetBrainsMono Nerd Font Propo,Noto Sans Mono:h11"

vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.foldlevel = 99
vim.opt.foldmethod = "indent"
vim.opt.foldtext = ""

vim.diagnostic.config({ update_in_insert = true })

-- Neovide specific settings
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
