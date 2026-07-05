return {
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local cmp = require("cmp")
      local conf = require("nvchad.configs.cmp")
      local luasnip = require("luasnip")

      table.insert(conf.sources, 1, { name = "supermaven" })

      -- Modify the sorting to always put supermaven first
      conf.sorting = conf.sorting or {}
      conf.sorting.comparators = conf.sorting.comparators or {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        cmp.config.compare.recently_used,
        cmp.config.compare.locality,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      }

      table.insert(conf.sorting.comparators, 1, function(entry1, entry2)
        local is_sm1 = entry1.source.name == "supermaven"
        local is_sm2 = entry2.source.name == "supermaven"
        if is_sm1 and not is_sm2 then
          return true
        elseif not is_sm1 and is_sm2 then
          return false
        end
        return nil
      end)

      conf.mapping["<Tab>"] = cmp.mapping(function(fallback)
        local cursortab_ui_ok, cursortab_ui = pcall(require, "cursortab.ui")
        local cursortab_ok, cursortab = pcall(require, "cursortab")
        local copilot_ok, copilot_suggestion = pcall(require, "copilot.suggestion")
        local has_supermaven, supermaven = pcall(require, "supermaven-nvim.completion_preview")

        if cmp.visible() then
          cmp.select_next_item()
        elseif has_supermaven and supermaven.has_suggestion() then
          supermaven.on_accept_suggestion()
        elseif cursortab_ui_ok and (cursortab_ui.has_completion() or cursortab_ui.has_cursor_prediction()) then
          if cursortab_ok then
            cursortab.accept()
          end
        elseif copilot_ok and copilot_suggestion.is_visible() then
          copilot_suggestion.accept()
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
