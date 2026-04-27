require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
vim.o.winbar = " %{%v:lua.vim.fn.expand('%:~:.')%}"
