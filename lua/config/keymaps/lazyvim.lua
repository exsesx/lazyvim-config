local map = vim.keymap.set
local del = vim.keymap.del

del("n", "<leader>l")
map("n", "<leader>ll", ":Lazy<CR>", { desc = "Lazy" })
map("n", "<leader>le", ":LazyExtras<CR>", { desc = "Lazy Extras" })
