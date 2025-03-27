if vim.g.vscode then
  return
end

local map = vim.keymap.set

map("n", "<leader>uu", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
