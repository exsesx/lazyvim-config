if vim.g.vscode then
  return
end

local map = vim.keymap.set

map("n", "<leader>uu", "<CMD>Undotree<CR>", { desc = "Toggle Undotree" })
