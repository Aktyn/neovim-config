-- LSP progress indicator shown in the message area with a spinner and percentage.
-- Inspired by: https://github.com/FractalCodeRicardo/dev-config
local api = vim.api

-- Optional: route progress messages to a dedicated target when the internal UI
-- module is available (custom Neovim builds). Degrades gracefully otherwise.
pcall(function()
  local ui2 = vim._core and vim._core.ui2
  if ui2 then
    ui2.enable({
      enable = true,
      msg = {
        targets = {
          progress = "msg",
        },
      },
    })
  end
end)

local frames = { '⠋', '⠙', '⠹', '⠸', '⠼','⠴', '⠦', '⠧', '⠇', '⠏' }
local i_frame = 1

local message_id = nil
local function progress(percent, title, is_running)
  local status = is_running and "running" or "success"

  if i_frame > #frames then
    i_frame = 1
  end

  message_id = api.nvim_echo(
    { { title } },
    false,
    {
      id = message_id,
      percent = percent,
      source = "lsp-progress",
      status = status,
      title = frames[i_frame] .. " LSP",
      kind = "progress",
    }
  )

  i_frame = i_frame + 1
end

api.nvim_create_autocmd("LspProgress", {
  callback = function(args)
    local value = args.data.params.value
    if value == nil then
      return
    end

    local title = value.title
    local percent = value.percentage or 0
    local is_running = percent <= 95

    if percent > 0 then
      progress(percent, title, is_running)
    end
  end,
})
