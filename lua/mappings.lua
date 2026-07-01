require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set
local nomap = vim.keymap.del

nomap("n", "<leader>cm")
nomap("n", "<leader>gt")
nomap("n", "<leader>h")
-- nomap("n", "<C-S-P>")

-- Window navigation
map("n", "<C-w>Left", "<C-w>h", { desc = "Window left" })
map("n", "<C-w>Down", "<C-w>j", { desc = "Window down" })
map("n", "<C-w>Up", "<C-w>k", { desc = "Window up" })
map("n", "<C-w>Right", "<C-w>l", { desc = "Window right" })

-- nomap("n", "<C-h>")
-- nomap("n", "<C-j>")
-- nomap("n", "<C-k>")
-- nomap("n", "<C-l>")
map("n", "<C-l>", function()
  vim.diagnostic.open_float()
end, { desc = "Show diagnostics" })

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("n", ":", "<Plug>(cmdpalette)")
-- map("n", ":", "<cmd>lua require('snacks').input.input({}, function() end)<CR>")
map("i", "jk", "<ESC>")
map("n", "<leader>go", function()
  require("snacks").gitbrowse()
end, { desc = "Open file on remote" })

map("n", "<leader><leader>", ":Telescope find_files hidden=false<cr>", { desc = "Find files within open project" })
map("n", "<leader>bb", ":buffer #<cr>", { desc = "Select previous buffer" })
-- map("i", "<C-v>", '<ESC>l"+Pli') -- Paste insert mode
map("i", "<C-v>", "<ESC>pa") -- Paste insert mode
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<C-s>", ":wa<CR>") -- Save
map("n", "<C-M-a>", "ggVG", { desc = "Select all" })
map("i", "<C-s>", "<C-o>:wa<CR>", { noremap = true, desc = "Save all in insert mode" })
map("i", "<C-z>", "<C-o>u", { noremap = true, silent = true })
map("i", "<C-u>", "<Esc><C-r>a", { noremap = true, silent = true })

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
map("i", "<C-S-l>", "<Esc>:LspEslintFixAll<CR>i", { silent = true, noremap = true, desc = "Fix all ESLint issues" })
-- map("n", "<C-l>", "???", { desc = "Format document" })

-- package-info keymaps
map(
  "n",
  "<leader>cpt",
  "<cmd>lua require('package-info').toggle()<cr>",
  { silent = true, noremap = true, desc = "Toggle" }
)
map(
  "n",
  "<leader>cpd",
  "<cmd>lua require('package-info').delete()<cr>",
  { silent = true, noremap = true, desc = "Delete package" }
)
map(
  "n",
  "<leader>cpu",
  "<cmd>lua require('package-info').update()<cr>",
  { silent = true, noremap = true, desc = "Update package" }
)
map(
  "n",
  "<leader>cpi",
  "<cmd>lua require('package-info').install()<cr>",
  { silent = true, noremap = true, desc = "Install package" }
)
map(
  "n",
  "<leader>cpc",
  "<cmd>lua require('package-info').change_version()<cr>",
  { silent = true, noremap = true, desc = "Change package version" }
)

--- Project management
map(
  "n",
  "<leader>qS",
  "<cmd>NeovimProjectHistory<cr>",
  { desc = "Show recent sessions", noremap = true, silent = true }
)
map("n", "<leader>qd", "<cmd>NeovimProjectDiscover<cr>", { desc = "Discover sessions", noremap = true, silent = true })

--- Better definitions jumping
-- Go to definition
map("n", "<F12>", function(arg)
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

map("n", "<F11>", function()
  vim.cmd("Telescope lsp_references")
end, { noremap = true, silent = true })

--- Advanced search
-- Find in current buffer
map({ "n", "i" }, "<C-f>", function()
  require("telescope.builtin").current_buffer_fuzzy_find()
end, { desc = "Find in current buffer" })

map("v", "<C-f>", function()
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

map("n", "<C-S-f>", function()
  require("telescope.builtin").grep_string({
    search = "",
    only_sort_text = true,
  })
end, { desc = "Search in workspace (fuzzy)" })

map("v", "<C-S-f>", function()
  vim.cmd('normal! "vy')
  local selection = vim.fn.getreg("v")
  selection = selection:gsub("\n", " ")
  if selection ~= "" then
    require("telescope.builtin").grep_string({
      search = selection,
      only_sort_text = true,
    })
  else
    require("telescope.builtin").grep_string({
      search = "",
      only_sort_text = true,
    })
  end
end, { noremap = true, silent = true, desc = "Telescope search for selected text in workspace (fuzzy)" })

-- Buffertabs navigation
map({ "n" }, "<C-M-Right>", function()
  require("bufferline").move(1)
end, { desc = "move buffer to the right" })
map({ "n" }, "<C-M-Left>", function()
  require("bufferline").move(-1)
end, { desc = "move buffer to the left" })

map({ "n" }, "<S-tab>", function()
  require("bufferline").cycle(-1)
end, { desc = "cycle to previous buffer" })

map({ "n" }, "<leader>x", "<cmd>BufferLineCyclePrev<cr><cmd>bdelete! #<cr>", { desc = "close current buffer" })

-- Todo comments
map(
  "n",
  "<leader>ft",
  "<cmd>TodoTelescope keywords=TODO,FIX<cr>",
  { desc = "Discover TODOs", noremap = true, silent = true }
)
map("n", "<leader>tt", "<cmd>TodoLocList<cr>", { desc = "Localize TODOs", noremap = true, silent = true })

-- Inlay hints
map("n", "<leader>uh", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(), nil)
end, { desc = "Toggle Inlay Hints" })

-- CursorTab / Buffer navigation conflict resolution
map("n", "<tab>", function()
  local has_cursortab, cursortab = pcall(require, "cursortab")
  local has_cursortab_ui, cursortab_ui = pcall(require, "cursortab.ui")
  local has_supermaven, supermaven = pcall(require, "supermaven-nvim.completion_preview")

  if has_cursortab and has_cursortab_ui and (cursortab_ui.has_completion() or cursortab_ui.has_cursor_prediction()) then
    cursortab.accept()
  elseif has_supermaven and supermaven.has_suggestion() then
    supermaven.on_accept_suggestion()
  else
    require("bufferline").cycle(1)
  end
end, { desc = "Accept suggestion or goto next buffer" })


-- Codecompletion mappings
map("n", "<leader>ai", "<cmd>CodeCompanion<cr>", { desc = "Inline prompt" })
map("n", "<leader>aa", "<cmd>CodeCompanionChat<cr>", { desc = "Toggle code companion chat" })
