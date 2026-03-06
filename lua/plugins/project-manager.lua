return {
  "coffebar/neovim-project",
  opts = {
    projects = {
      "~/Programming/*",
      "~/.config/*",
    },
    picker = {
      type = "telescope",
      preview = {
        enabled = true, -- show directory structure in Telescope preview
        git_status = true, -- show branch name, an ahead/behind counter, and the git status of each file/folder
        git_fetch = false, -- fetch from remote, used to display the number of commits ahead/behind, requires git authorization
        show_hidden = true, -- show hidden files/folders
      },
    },

    last_session_on_startup = true,
    dashboard_mode = false,
    per_branch_sessions = true,
  },
  init = function()
    vim.opt.sessionoptions:append("globals")
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },
    { "Shatur/neovim-session-manager" },
  },
  lazy = false,
  priority = 100,
}
