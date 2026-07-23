require("nvchad.autocmds")

vim.api.nvim_create_augroup("remember_folds", { clear = true })

vim.api.nvim_create_autocmd("BufWinLeave", {
  group = "remember_folds",
  pattern = "*",
  callback = function()
    -- Only for normal files
    if vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
      vim.cmd.mkview()
    end
  end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = "remember_folds",
  pattern = "*",
  callback = function()
    if vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
      pcall(vim.cmd.loadview)
    end
  end,
})

vim.api.nvim_create_augroup("auto_wrap", { clear = true })
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  group = "auto_wrap",
  callback = function()
    vim.o.wrap = true
  end,
})

--- Copied from lazyvim autocmds.lua ---

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("auto_create_dir"),
  callback = function(event)
    if event.match:match("^%w%w+:[\\/][\\/]") then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local ft = vim.bo[bufnr].filetype

    -- Skip native inline completion for some servers.
    -- Neovim's inline-completion "agent" can send synthetic didChange ranges (e.g. end.line=2147483647)
    -- which has been observed to destabilize qmlls.
    if
      client.name == "copilot_ls"
      or client.name == "qmlls"
      or client.name == "AgentTextDocumentConfiguration"
      or ft == "qml"
      or ft == "qmljs"
    then
      return
    end

    if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlineCompletion, bufnr) then
      vim.lsp.inline_completion.enable(true, { bufnr = bufnr })

      vim.keymap.set("i", "<Right>", function()
        if vim.lsp.inline_completion.get() then
          return ""
        end
        return "<Right>"
      end, { desc = "LSP: accept inline completion", buffer = bufnr, expr = true })
      vim.keymap.set(
        "i",
        "<C-G>",
        vim.lsp.inline_completion.select,
        { desc = "LSP: switch inline completion", buffer = bufnr }
      )
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.keymap.set("n", "<CR>", function()
      local qf_win = vim.api.nvim_get_current_win()
      local is_loclist = vim.fn.getwininfo(qf_win)[1].loclist == 1

      -- Jump to the location
      local cmd = is_loclist and ".ll" or ".cc"
      local ok, _ = pcall(vim.cmd, cmd)

      -- Close the quickfix/location list window if jump was successful
      if ok and vim.api.nvim_win_is_valid(qf_win) then
        vim.api.nvim_win_close(qf_win, true)
      end
    end, { buffer = true })
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("outline").open({ focus_outline = false })
    vim.cmd("Neotree filesystem show")
    vim.api.nvim_set_hl(0, "NeoTreeCursorLine", { bg = "#292b2b" })
    -- Open tree if starting with a directory or no arguments
    -- if vim.fn.isdirectory(vim.fn.expand("%:p:h")) == 1 or vim.fn.argc() == 0 then
    --   require("nvim-tree").setup({
    --     update_focused_file = {
    --       enable = true,
    --       update_cwd = true, -- Optional: Updates the tree root to the current buffer's directory
    --       ignore_list = {}, -- Optional: List of file patterns to ignore
    --     },
    --     -- Optional: Sync tree root with working directory on buffer change
    --     sync_root_with_cwd = true,
    --     respect_buf_cwd = true,
    --
    --     view = {
    --       width = 48,
    --     },
    --     filters = {
    --       dotfiles = true,
    --     },
    --   })
    --   require("nvim-tree.api").tree.open()
    --   vim.cmd("wincmd l")
    -- end

    vim.cmd(":silent !kitty @ set-spacing padding=0 margin=0")
  end,
})

vim.api.nvim_create_autocmd("RecordingEnter", {
  callback = function()
    vim.opt.cmdheight = 1
  end,
})
vim.api.nvim_create_autocmd("RecordingLeave", {
  callback = function()
    vim.opt.cmdheight = 0
  end,
})
