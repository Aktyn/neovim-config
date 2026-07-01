return {
  "frenchef156/harpoon-lists.nvim",
  dependencies = {
    {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
    },
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",

  config = function()
    local harpoonLists = require("harpoon-lists")
    harpoonLists:setup()

    -- basic telescope configuration
    -- local conf = require("telescope.config").values
    -- local function toggle_telescope(harpoon_files)
    --   local file_paths = {}
    --   for _, item in ipairs(harpoon_files.items) do
    --     table.insert(file_paths, item.value)
    --   end
    --
    --   require("telescope.pickers")
    --     .new({}, {
    --       prompt_title = "Harpoon",
    --       finder = require("telescope.finders").new_table({
    --         results = file_paths,
    --       }),
    --       previewer = conf.file_previewer({}),
    --       sorter = conf.generic_sorter({}),
    --     })
    --     :find()
    -- end

    vim.keymap.set("n", "<leader>hh", function()
      harpoonLists:list():add()
    end, { desc = "Add current file to Harpoon list" })
    vim.keymap.set("n", "<leader>hr", function()
      harpoonLists:list():remove()
    end, { desc = "Remove current file from Harpoon list" })

    vim.keymap.set("n", "<C-p>", function()
      harpoonLists.harpoon.ui:toggle_quick_menu(harpoonLists:list())
      -- toggle_telescope(harpoonLists:list())
    end, { desc = "Toggle Harpoon list" })

    vim.keymap.set("n", "<C-M-P>", function()
      harpoonLists:open_manager()
    end, { desc = "Open Harpoon manager" })

    vim.keymap.set("n", "<leader>h1", function()
      harpoonLists:list():select(1)
    end, { desc = "Select first buffer in Harpoon list" })
    vim.keymap.set("n", "<leader>h2", function()
      harpoonLists:list():select(2)
    end, { desc = "Select second buffer in Harpoon list" })
    vim.keymap.set("n", "<leader>h3", function()
      harpoonLists:list():select(3)
    end, { desc = "Select third buffer in Harpoon list" })
    vim.keymap.set("n", "<leader>h4", function()
      harpoonLists:list():select(4)
    end, { desc = "Select fourth buffer in Harpoon list" })
    vim.keymap.set("n", "<leader>h5", function()
      harpoonLists:list():select(5)
    end, { desc = "Select fifth buffer in Harpoon list" })
    vim.keymap.set("n", "<leader>h6", function()
      harpoonLists:list():select(6)
    end, { desc = "Select sixth buffer in Harpoon list" })
    vim.keymap.set("n", "<leader>h7", function()
      harpoonLists:list():select(7)
    end, { desc = "Select seventh buffer in Harpoon list" })
    vim.keymap.set("n", "<leader>h8", function()
      harpoonLists:list():select(8)
    end, { desc = "Select eighth buffer in Harpoon list" })
    vim.keymap.set("n", "<leader>h9", function()
      harpoonLists:list():select(9)
    end, { desc = "Select ninth buffer in Harpoon list" })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<leader>hp", function()
      harpoonLists:list():prev({ ui_nav_wrap = true })
    end, { desc = "Go to previous buffer in Harpoon list" })
    vim.keymap.set("n", "<leader>hn", function()
      harpoonLists:list():next({ ui_nav_wrap = true })
    end, { desc = "Go to next buffer in Harpoon list" })
  end,
}
