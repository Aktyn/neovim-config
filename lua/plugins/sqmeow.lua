-- SQL and Database client interface inside Neovim
return {
    "2giosangmitom/sqmeow.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    lazy = true,
    version = "*",
    build = function()
    -- Downloads the matching release binary; pass 'curl', 'wget', 'powershell' or 'cargo' to choose.
    require("sqmeow").install()
    end,
    opts = {},
    cmd = "Sqmeow",
    keys = {
        { "<leader>dd", "<cmd>Sqmeow toggle<cr>", desc = "Toggle" },
        { "<leader>dc", "<cmd>Sqmeow cancel<cr>", desc = "Cancel" },
        { "<leader>da", "<cmd>Sqmeow add<cr>", desc = "Add Connection" },
        { "<leader>ds", "<cmd>Sqmeow scratch<cr>", desc = "New Scratchpad" },
    },
}
