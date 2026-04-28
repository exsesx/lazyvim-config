if vim.g.vscode then
  return
end

local map = vim.keymap.set

map("n", "<leader>gn", "<CMD>Neogit kind=tab<CR>", { desc = "Open Neogit" })

-- NOTE: ../autocmds/diffclipboard.lua
map({ "n", "v" }, "<leader>ghc", ":DiffClipboard<CR>", { desc = "Compare with Clipboard" })
