local map = vim.keymap.set
local del = vim.keymap.del

-- Muscle memory ¯\_(ツ)_/¯

del("n", "<leader>l")
map("n", "<leader>ll", ":Lazy<CR>", { desc = "Lazy" })
map("n", "<leader>le", ":LazyExtras<CR>", { desc = "Lazy Extras" })

map("n", "<leader>ld", "<leader>cd", { desc = "Line Diagnostics", remap = true })
map({ "n", "v" }, "<leader>lf", "<leader>cf", { desc = "Format", remap = true })

map("n", "<leader>lr", "<leader>cr", { desc = "Rename (inc-rename.nvim)", remap = true })