return {
  "nvimdev/dashboard-nvim",
  lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
  event = "VimEnter",
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
  opts = function()
    local opts = {
      theme = "hyper",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      change_to_vcs_root = true,
      config = {
        packages = { enable = true }, -- show how many plugins neovim loaded
        --        header = vim.split(logo, "\n"),
        week_header = {
          enable = true,
        },
        -- stylua: ignore
        shortcut = { --changed from center
          {
            action = 'Telescope find_files',
            desc = 'Files',
            icon = ' ',
            icon_hl = '@variable',
            key = 'f',
           group = 'Label',
          },
          --{ action = LazyVim.telescope("files"),                                    desc = " Find File",       icon = " ", key = "f" },
        { action = "ene | startinsert",                                        desc = " New File",        icon = " ", key = "n" },
          { action = "Telescope oldfiles",                                       desc = " Recent Files",    icon = " ", key = "r" },
          { action = "Telescope live_grep",                                      desc = " Find Text",       icon = " ", key = "g" },
          { action = [[lua LazyVim.telescope.config_files()()]], desc = " Config",          icon = " ", key = "c" },
         { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
        --  { action = "LazyExtras",                                               desc = " Lazy Extras",     icon = " ", key = "x" },
          { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    }

    --for _, button in ipairs(opts.config.center) do
    --button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
    --button.key_format = "  %s"
    --end

    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "DashboardLoaded",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    return opts
  end,
}
