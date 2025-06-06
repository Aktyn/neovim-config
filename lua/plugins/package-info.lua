return {
  {
    "vuki656/package-info.nvim",
    ft = "json",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require("package-info").setup({
        autostart = true,
        package_manager = "npm",
        colors = {
          outdated = "#db4b4b",
        },
        hide_up_to_date = true,
      })

      require("telescope").load_extension("package_info")
    end,
  },
}
