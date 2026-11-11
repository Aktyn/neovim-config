-- Auto-pairing plugin with treesitter support.
--
-- ultimate-autopair handles closing quotes, brackets, and parens that other
-- autopairers miss: it is treesitter-aware (skips pairing inside strings /
-- comments) and supports multiline pairs, per-filetype rules, and custom
-- rule overrides.
--
-- Events: loads on InsertEnter/CmdlineEnter so pairing kicks in as needed.
return {
  "altermo/ultimate-autopair.nvim",
  event = { "InsertEnter", "CmdlineEnter" },
  -- branch = "v0.6", -- uncomment in case of update breaking the plugin
  opts = {
    -- Default rules cover (), [], {}, '', "" across most filetypes.
    -- Disable pairing inside strings/comments via treesitter filtering.
    ft_block = {
      -- Filetypes where pairing is turned off entirely.
      [""] = true,
      ["markdown"] = true,
      ["tex"] = true,
      ["latex"] = true,
      ["plaintex"] = true,
      ["yaml"] = true,
      ["toml"] = true,
      ["json"] = true,
      ["jsonc"] = true,
    },
    ft_add = {
      -- Filetypes that get extra pair rules on top of the defaults.
      python = { { "<space>", "<space>" } },
      -- Treat single quotes as a pair in some shells/CSV-ish files.
      csv = { { "'", "'" } },
    },
    -- Don't auto-close over existing characters when typing in the middle
    -- of an already-paired region (avoids accidental doubling).
    close_flex_last = true,
  },
}
