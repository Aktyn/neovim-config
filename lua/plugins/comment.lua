return {
  "numToStr/Comment.nvim",
  keys = {
    {
      "n",
      "<C-g>",
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      { noremap = true, silent = true },
    },
    -- { "i", "<C-g>", "<ESC><cmd>lua require('Comment.api').toggle.linewise()<CR>a", { noremap = true } },
    -- { "x", "<C-g>", '<ESC><CMD>lua require("Comment.api").locked("toggle.linewise")(vim.fn.visualmode())<CR>' },
  },
  config = function()
    require("Comment").setup()
  end,
}
