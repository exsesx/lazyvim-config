if vim.g.vscode then
  return
end

local map = vim.keymap.set

map("n", "<leader>uP", function()
  require("precognition").toggle()
end, { desc = "Toggle Precognition" })
