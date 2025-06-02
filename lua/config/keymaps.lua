-- Custom keymaps

vim.keymap.del("", "<C-/>")
vim.keymap.del("", "<C-_>")
-- vim.keymap.del("n", "<C-g>")
vim.keymap.set("n", "<C-g>", function()
  require("Comment.api").toggle.linewise.current()
end, { noremap = true, silent = true })

-- Session management
vim.keymap.del("n", "<leader>qd")
vim.keymap.del("n", "<leader>ql")
vim.keymap.del("n", "<leader>qs")
vim.keymap.del("n", "<leader>qS")
vim.keymap.set(
  "n",
  "<leader>qS",
  "<cmd>NeovimProjectHistory<cr>",
  { desc = "Show recent sessions", noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "<leader>qs",
  "<cmd>NeovimProjectLoadRecent<cr>",
  { desc = "Open previous session", noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "<leader>qd",
  "<cmd>NeovimProjectDiscover<cr>",
  { desc = "Discover sessions", noremap = true, silent = true }
)

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

-- Select previous/next word
vim.keymap.set("n", "<C-S-Left>", "vB", { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-Right>", "ve", { noremap = true, silent = true })
vim.keymap.set("v", "<C-S-Left>", "B", { noremap = true, silent = true })
vim.keymap.set("v", "<C-S-Right>", "e", { noremap = true, silent = true })

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
vim.keymap.set("i", "<C-Del>", "<Esc>ldei", { noremap = true, silent = true })
vim.keymap.set("i", "<C-BS>", "<C-w>", { noremap = true, silent = true })

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

-- Close current buffer
vim.keymap.set("n", "<C-w>", function()
  require("mini.bufremove").delete(0, false)
end, { noremap = true, silent = true })

-- Go to definition
vim.keymap.set("n", "<F12>", function(arg)
  local params = vim.lsp.util.make_position_params(0, "utf-8")
  vim.lsp.buf_request(0, "textDocument/definition", params, function(_, result, _, _)
    local function location_equal(loc)
      -- Support both Location and LocationLink
      local uri
      local range
      if loc.uri then
        uri = loc.uri
        range = loc.range
      elseif loc.targetUri then
        uri = loc.targetUri
        range = loc.targetRange
      end
      if not uri or not range then
        return false
      end
      -- Compare with current buffer/position
      local bufnr = vim.api.nvim_get_current_buf()
      local curr_uri = vim.uri_from_bufnr(bufnr)
      local curr_row, curr_col = unpack(vim.api.nvim_win_get_cursor(0))
      -- LSP is zero-based, Neovim is one-based
      if
        uri == curr_uri
        and curr_row - 1 >= range.start.line
        and curr_row - 1 <= range["end"].line
        and curr_col >= range.start.character
        and curr_col <= range["end"].character
      then
        return true
      end
      return false
    end

    local found = false
    if result and not vim.tbl_isempty(result) then
      local first = result[1] or result
      if not location_equal(first) then
        found = true
        vim.lsp.buf.definition(arg)
      end
    end
    if not found then
      vim.cmd("Telescope lsp_references")
    end
  end)
end, { noremap = true, silent = true })

vim.keymap.set("n", "<F11>", function()
  vim.cmd("Telescope lsp_references")
end, { noremap = true, silent = true })

-- package-info keymaps
vim.keymap.set(
  "n",
  "<leader>cpt",
  "<cmd>lua require('package-info').toggle()<cr>",
  { silent = true, noremap = true, desc = "Toggle" }
)
vim.keymap.set(
  "n",
  "<leader>cpd",
  "<cmd>lua require('package-info').delete()<cr>",
  { silent = true, noremap = true, desc = "Delete package" }
)
vim.keymap.set(
  "n",
  "<leader>cpu",
  "<cmd>lua require('package-info').update()<cr>",
  { silent = true, noremap = true, desc = "Update package" }
)
vim.keymap.set(
  "n",
  "<leader>cpi",
  "<cmd>lua require('package-info').install()<cr>",
  { silent = true, noremap = true, desc = "Install package" }
)
vim.keymap.set(
  "n",
  "<leader>cpc",
  "<cmd>lua require('package-info').change_version()<cr>",
  { silent = true, noremap = true, desc = "Change package version" }
)

-- Linting
vim.keymap.set("n", "<C-S-l>", ":EslintFixAll<cr>", { silent = true, noremap = true, desc = "Fix all ESLint issues" })
