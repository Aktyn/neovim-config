return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup()

    vim.keymap.set("i", "<C-g>", "<ESC><cmd>lua require('Comment.api').toggle.linewise()<CR>a", { noremap = true })
  end,
}
