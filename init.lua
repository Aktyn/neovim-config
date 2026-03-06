require("config.lazy")

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

-- Explicitly set colorscheme on VimEnter to ensure overrides take effect
vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("SetColorscheme", { clear = true }),
  callback = function()
    vim.cmd.colorscheme("catppuccin")
  end,
})

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
