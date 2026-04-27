require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local unmap = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- unmap("n", "<leader>fm")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Linting
vim.keymap.set("n", "<C-l>", ":LspEslintFixAll<cr>", { silent = true, noremap = true, desc = "Fix all ESLint issues" })




