return {
  "copilotlsp-nvim/copilot-lsp",
  init = function()
    vim.g.copilot_nes_debounce = 500
    vim.lsp.enable("copilot_ls")
    local function accept_nes()
      local bufnr = vim.api.nvim_get_current_buf()
      local state = vim.b[bufnr].nes_state
      if state then
        -- Apply the pending suggestion immediately
        local nes = require("copilot-lsp.nes")
        nes.walk_cursor_start_edit()
        nes.apply_pending_nes()
        nes.walk_cursor_end_edit()
        return true
      end
      return false
    end

    vim.keymap.set({ "n", "i" }, "<C-Tab>", function()
      if accept_nes() then
        return ""
      end

      -- Resolving the terminal's inability to distinguish between `TAB` and `<C-i>` in normal mode
      return vim.api.nvim_replace_termcodes("<C-i>", true, true, true)
    end, { desc = "Accept Copilot NES", expr = true, silent = true })
  end,
}
