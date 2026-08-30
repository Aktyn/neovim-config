return {
  "folke/flash.nvim",
  event = "VeryLazy",
  priority = 60,
  opts = {
    modes = {
      search = {
        enabled = true,
      },
      char = {
        jump_labels = true,
        config = function(opts)
          -- Check if in operator-pending mode ("o" is in the mode string)
          if vim.fn.mode(true):find("o") then
            opts.jump_labels = false
          end

          -- Also disable if a count is used (e.g., 5f)
          if vim.v.count > 0 then
            opts.jump_labels = false
          end

          -- autohide flash when in operator-pending mode
          opts.autohide = opts.autohide or (vim.fn.mode(true):find("no") and vim.v.operator == "y")

          -- disable jump labels when not enabled, when using a count,
          -- or when recording/executing registers
          opts.jump_labels = opts.jump_labels
            and vim.v.count == 0
            and vim.fn.reg_executing() == ""
            and vim.fn.reg_recording() == ""

          -- Show jump labels only in operator-pending mode
          -- opts.jump_labels = vim.v.count == 0 and vim.fn.mode(true):find("o")
        end,
      },
    },
  },
  keys = {
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "S",
      mode = { "n", "x", "o" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
    {
      "r",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
    {
      "R",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Treesitter Search",
    },
    {
      "<c-s>",
      mode = { "c" },
      function()
        require("flash").toggle()
      end,
      desc = "Toggle Flash Search",
    },
    {
      "g*",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({
          pattern = vim.fn.expand("<cword>"),
        })
      end,
      desc = "Flash Search",
    },
  },
}
