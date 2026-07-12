return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  -- event = "VeryLazy",
  lazy = false,
  priority = 1000,
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({
      options = {
        sort_by = "insert_after_current",
        -- mode = "tabs",
        style_preset = bufferline.style_preset.minimal,
        themable = true,
        separator_style = "thin", -- slant",
        -- separator_style = { " ", " " },
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        -- show_tab_indicators = true,
        -- enforce_regular_tabs = false,
        always_show_bufferline = false,
        diagnostics = "nvim_lsp",
        diagnostics_update_on_event = true, -- use nvim's diagnostic handler
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        color_icons = true,
        show_buffer_icons = true,

        indicator = {
          style = "underline",
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
      highlights = {
        fill = { bg = "NONE", fg = "NONE" },
        background = { bg = "NONE", fg = "NONE" },
        tab_selected = {
          fg = "NONE",
          bg = "NONE",
        },
        buffer_selected = {
          fg = "NONE",
          bg = "NONE",
          bold = true,
          italic = false,
        },
        indicator_visible = {
          fg = "NONE",
          bg = "NONE",
        },
        indicator_selected = {
          fg = "NONE",
          bg = "NONE",
        },
      },
    })

    local highlights = {
      "BufferLineFill",
      "BufferLineBackground",
      "BufferLineTab",
      "BufferLineTabClose",
      "BufferLineSeparator",
      "BufferLineSeparatorSelected",
      "BufferLineSeparatorVisible",
      "BufferLineIndicatorSelected"
    }
    for _, hl in ipairs(highlights) do
      vim.api.nvim_set_hl(0, hl, { bg = "NONE", ctermbg = "NONE" })
    end

    vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "NONE", fg = "NONE" })
    vim.api.nvim_set_hl(0, "BufferLineBackground", { bg = "NONE", fg = "NONE" })
    vim.api.nvim_set_hl(0, "BufferLineSeparator", { bg = "NONE", fg = "#444444" })
  end,
}
