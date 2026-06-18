return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
  -- priority = 100,
  opts = {
    options = {
      sort_by = "insert_after_current",
      -- mode = "tabs",
      -- style_preset = bufferline.style_preset.minimal,
      themable = true,
      separator_style = "slant",
      -- separator_style = { " ", " " },
      persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
      -- show_tab_indicators = true,
      -- enforce_regular_tabs = false,
      always_show_bufferline = false,
      -- diagnostics = "coc",
      diagnostics = "nvim_lsp",
      -- diagnostics_update_in_insert = true, -- only applies to coc
      diagnostics_update_on_event = true, -- use nvim's diagnostic handler
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local icon = level:match("error") and " " or " "
        return " " .. icon .. count
      end,
      color_icons = true,
      show_buffer_icons = true,

      indicator = {
        style = "none",
      },
      hover = {
        enabled = true,
        delay = 200,
        reveal = { "close" },
      },
      offsets = {
        {
          filetype = "NvimTree",
          highlight = "Directory",
        },
        -- {
        --   filetype = "neo-tree",
        --   highlight = "Directory",
        --   text_align = "left",
        -- },
        {
          filetype = "snacks_layout_box",
        },
      },
    },
  },
}
