require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set
local nomap = vim.keymap.del

nomap("n", "<leader>cm")
nomap("n", "<leader>gt")

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", ":", "<Plug>(cmdpalette)")
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
-- nomap("n", "<leader>fm")
map("n", "<C-S-l>", ":LspEslintFixAll<cr>", { silent = true, noremap = true, desc = "Fix all ESLint issues" })
-- map("n", "<C-l>", "???", { desc = "Format document" })

--- Project management
map(
  "n",
  "<leader>qS",
  "<cmd>NeovimProjectHistory<cr>",
  { desc = "Show recent sessions", noremap = true, silent = true }
)
map("n", "<leader>qd", "<cmd>NeovimProjectDiscover<cr>", { desc = "Discover sessions", noremap = true, silent = true })

--- Advanced search
-- Find in current buffer
vim.keymap.set({ "n", "i" }, "<C-f>", function()
  require("telescope.builtin").current_buffer_fuzzy_find()
end, { desc = "Find in current buffer" })

vim.keymap.set("v", "<C-f>", function()
  vim.cmd('normal! "vy')
  local selection = vim.fn.getreg("v")
  selection = selection:gsub("\n", " ")
  if selection ~= "" then
    require("telescope.builtin").current_buffer_fuzzy_find({
      default_text = selection,
    })
  else
    require("telescope.builtin").current_buffer_fuzzy_find()
  end
end, { noremap = true, silent = true, desc = "Telescope search for selected text in current buffer" })

vim.keymap.set("n", "<C-S-f>", function()
  require("telescope.builtin").live_grep()
end, { desc = "Search in workspace" })

vim.keymap.set("v", "<C-S-f>", function()
  vim.cmd('normal! "vy')
  local selection = vim.fn.getreg("v")
  selection = selection:gsub("\n", " ")
  if selection ~= "" then
    require("telescope.builtin").live_grep({
      default_text = selection,
    })
  else
    require("telescope.builtin").live_grep()
  end
end, { noremap = true, silent = true, desc = "Telescope search for selected text in workspace" })
