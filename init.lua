-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.api.nvim_create_augroup("remember_folds", { clear = true })

vim.api.nvim_create_autocmd("BufWinLeave", {
  group = "remember_folds",
  pattern = "*",
  callback = function()
  -- Only for normal files
  if vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
    vim.cmd("mkview")
    end
    end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = "remember_folds",
  pattern = "*",
  callback = function()
  if vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
    vim.cmd("silent! loadview")
    end
    end,
})
