require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local unmap = vim.keymap.del

unmap("n", "<leader>cm")
unmap("n", "<leader>gt")

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<C-s>", ":wa<CR>") -- Save
map("i", "<C-s>", "<C-o>:wa<CR>", { noremap = true, desc = "Save all in insert mode" })

-- Remove current line or selected lines
map("n", "<C-S-k>", '"_dd', { noremap = true, silent = true })
map("v", "<C-S-k>", '"_d', { noremap = true, silent = true })
map("i", "<C-S-k>", '<Esc>"_ddi', { noremap = true, silent = true })

-- Duplicate current/selected line(s) below
map("n", "<C-S-d>", "yyp", { noremap = true, silent = true })
map("v", "<C-S-d>", ":t '>+1<CR>gv", { noremap = true, silent = true })
map("i", "<C-S-d>", "<Esc>yypgi", { noremap = true, silent = true })

-- Move selected lines up/down
map("n", "<C-S-Up>", ":move .-2<CR>==", { noremap = true, silent = true })
map("n", "<C-S-Down>", ":move .+1<CR>==", { noremap = true, silent = true })
map("v", "<C-S-Up>", ":move '<-2<CR>gv=gv", { noremap = true, silent = true })
map("v", "<C-S-Down>", ":move '>+1<CR>gv=gv", { noremap = true, silent = true })
map("i", "<C-S-Up>", "<Esc>:move .-2<CR>==gi", { noremap = true, silent = true })
map("i", "<C-S-Down>", "<Esc>:move .+1<CR>==gi", { noremap = true, silent = true })

-- Linting
-- unmap("n", "<leader>fm")
map("n", "<C-S-l>", ":LspEslintFixAll<cr>", { silent = true, noremap = true, desc = "Fix all ESLint issues" })
-- map("n", "<C-l>", "???", { desc = "Format document" })

-- Project management
map(
  "n",
  "<leader>qS",
  "<cmd>NeovimProjectHistory<cr>",
  { desc = "Show recent sessions", noremap = true, silent = true }
)
map("n", "<leader>qd", "<cmd>NeovimProjectDiscover<cr>", { desc = "Discover sessions", noremap = true, silent = true })
