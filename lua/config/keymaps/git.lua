local map = vim.keymap.set

map("n", "<leader>gt", "<CMD>tab Git<CR>", { desc = "Open Git Fugitive" })
map("n", "<leader>gn", "<CMD>Neogit kind=tab<CR>", { desc = "Open Neogit" })
