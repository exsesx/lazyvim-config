if vim.g.vscode then
  return
end

local map = vim.keymap.set

map("n", "<leader>fo", "<Cmd>Oil<CR>", { desc = "Oil" })
map("n", "-", "<CMD>Oil<CR>", { desc = "Open Parent Directory" })
