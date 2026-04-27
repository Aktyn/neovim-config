require "nvchad.options"

vim.opt.updatetime = 100

-- o.cursorlineopt ='both' -- to enable cursorline!
vim.o.winbar = " %{%v:lua.vim.fn.expand('%:~:.')%}" -- Display relative file path in the window bar
vim.o.wrap = true -- Enable soft line wrapping
vim.opt.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for
vim.opt.undofile = true -- Save undo history to a file
vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.smartcase = true -- Override ignorecase if search pattern contains upper case characters
vim.g.loaded_perl_provider = 0 -- Disable Perl provider
vim.g.loaded_ruby_provider = 0 -- Disable Ruby provider
-- vim.g.loaded_node_provider = 0
-- vim.g.loaded_python3_provider = 0
vim.o.guifont = "Monaspace_Neon_Frozen,JetBrainsMono_Nerd_Font_Propo,FreeMono:h11" -- Set GUI font family and size

--- Experimental option for synchronizing terminal  with Neovim's background color:
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
