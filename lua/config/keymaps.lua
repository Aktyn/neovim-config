-- Custom keymaps

vim.keymap.del("", "<C-/>")
vim.keymap.del("", "<C-_>")
-- vim.keymap.del("n", "<C-g>")
vim.keymap.set("n", "<C-g>", function()
  require("Comment.api").toggle.linewise.current()
end, { noremap = true, silent = true })

vim.keymap.set("x", "<C-g>", '<ESC><CMD>lua require("Comment.api").locked("toggle.linewise")(vim.fn.visualmode())<CR>')
-- vim.keymap.del("", "/")
-- vim.keymap.set("n", "/", "<Nop>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-s>", ":w<CR>") -- Save
vim.keymap.set("v", "<C-c>", '"+y') -- Copy
vim.keymap.set("n", "<C-v>", '"+P') -- Paste normal mode
vim.keymap.set("v", "<C-v>", '"+P') -- Paste visual mode
vim.keymap.set("c", "<C-v>", "<C-R>+") -- Paste command mode
vim.keymap.set("i", "<C-v>", '<ESC>l"+Pli') -- Paste insert mode

-- Remove current line or selected lines
vim.keymap.set("n", "<C-S-k>", '"_dd', { noremap = true, silent = true })
vim.keymap.set("v", "<C-S-k>", '"_d', { noremap = true, silent = true })
vim.keymap.set("i", "<C-S-k>", '<Esc>"_ddi', { noremap = true, silent = true })

-- Duplicate current/selected line(s) below
vim.keymap.set("n", "<C-S-d>", "yyp", { noremap = true, silent = true })
vim.keymap.set("v", "<C-S-d>", ":t '>+1<CR>gv", { noremap = true, silent = true })
vim.keymap.set("i", "<C-S-d>", "<Esc>yypgi", { noremap = true, silent = true })

-- Move selected lines up/down
vim.keymap.set("n", "<C-S-Up>", ":move .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-Down>", ":move .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<C-S-Up>", ":move '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<C-S-Down>", ":move '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("i", "<C-S-Up>", "<Esc>:move .-2<CR>==gi", { noremap = true, silent = true })
vim.keymap.set("i", "<C-S-Down>", "<Esc>:move .+1<CR>==gi", { noremap = true, silent = true })

-- Select all
vim.keymap.set({ "n", "v" }, "<C-a>", "ggVG", { noremap = true, silent = true })
vim.keymap.set("i", "<C-a>", "<Esc>ggVG", { noremap = true, silent = true })

-- Cut selected text (like Ctrl+C, then delete)
vim.keymap.set("v", "<C-x>", '"+d', { noremap = true, silent = true })

-- Ctrl+Z / Ctrl+U as Undo/Redo in all modes
vim.keymap.set("n", "<C-z>", "u", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-r>", { noremap = true, silent = true })
vim.keymap.set("v", "<C-z>", "u", { noremap = true, silent = true })
vim.keymap.set("v", "<C-u>", "<C-r>", { noremap = true, silent = true })
-- vim.keymap.set("i", "<C-z>", "<Esc>ua", { noremap = true, silent = true })
vim.keymap.set("i", "<C-z>", "<C-o>u", { noremap = true, silent = true })
vim.keymap.set("i", "<C-u>", "<Esc><C-r>a", { noremap = true, silent = true })

-- Ctrl+Delete: delete word ahead; Ctrl+Backspace: delete word behind in insert mode
vim.keymap.set("i", "<C-Del>", "<Esc>dwi", { noremap = true, silent = true })
vim.keymap.set("i", "<C-BS>", "<C-w>", { noremap = true, silent = true })

--
