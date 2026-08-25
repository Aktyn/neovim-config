return {
  "smartpde/telescope-recent-files",
  dependencies = { "nvim-telescope/telescope.nvim" },
  event = "VeryLazy",
  config = function()
    require("telescope").load_extension("recent_files")
  end,
}
