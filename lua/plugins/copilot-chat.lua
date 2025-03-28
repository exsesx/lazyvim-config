-- https://github.com/LazyVim/LazyVim/blob/efc95dc6aaed3d09ea4eaefe21f668f24da2ae2e/lua/lazyvim/plugins/extras/ai/copilot-chat.lua#L22
local user = vim.env.USER or "User"

return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    -- NOTE: in favor of ./avante.lua
    enabled = false,
    cmd = "CopilotChat",
    opts = {
      auto_insert_mode = true,
      question_header = "  " .. user .. " ",
      answer_header = "  Copilot ",
      window = {
        layout = "vertical",
        width = 0.3,
        zindex = 22,
        border = "rounded",
      },
    },
  },
}
