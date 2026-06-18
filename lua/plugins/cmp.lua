return {
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local cmp = require("cmp")
      local conf = require("nvchad.configs.cmp")
      local luasnip = require("luasnip")

      table.insert(conf.sources, 1, { name = "supermaven" })

      conf.mapping["<Tab>"] = cmp.mapping(function(fallback)
        local cursortab_ui_ok, cursortab_ui = pcall(require, "cursortab.ui")
        local cursortab_ok, cursortab = pcall(require, "cursortab")
        local copilot_ok, copilot_suggestion = pcall(require, "copilot.suggestion")
        local supermaven_suggestion = require("supermaven-nvim.completion_preview")

        if cmp.visible() then
          cmp.select_next_item()
        elseif cursortab_ui_ok and (cursortab_ui.has_completion() or cursortab_ui.has_cursor_prediction()) then
          if cursortab_ok then
            cursortab.accept()
          end
        elseif copilot_ok and copilot_suggestion.is_visible() then
          copilot_suggestion.accept()
        elseif supermaven_suggestion.has_suggestion() then
          supermaven_suggestion.on_accept_suggestion()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" })

      conf.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" })

      return conf
    end,
  },
}
