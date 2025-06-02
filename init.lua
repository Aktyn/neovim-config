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

vim.api.nvim_create_augroup("open_snacks", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
  group = "open_snacks",
  callback = function()
    vim.cmd("lua Snacks.picker.explorer()")
  end,
})

vim.api.nvim_create_augroup("auto_wrap", { clear = true })
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  group = "auto_wrap",
  callback = function()
    vim.o.wrap = true
  end,
})

vim.api.nvim_create_augroup("neotree", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
  group = "neotree",
  callback = function()
    vim.cmd("Neotree reveal buffers") --git_status
  end,
})
