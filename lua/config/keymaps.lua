-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>o", "<Cmd>Neotree<CR>", { silent = true })

-- Muscle memory, sorry
vim.keymap.set({ "n", "v" }, "<leader>lf", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

-- Neogit remaps
local neogit = require("neogit")

vim.keymap.del("n", "<leader>gs")
vim.keymap.set("n", "<leader>gs", neogit.open, { silent = true, noremap = true })

vim.keymap.del("n", "<leader>gc")
vim.keymap.set("n", "<leader>gc", ":Neogit commit<CR>", { silent = true, noremap = true })

vim.keymap.set("n", "<leader>gp", ":Neogit pull<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>gP", ":Neogit push<CR>", { silent = true, noremap = true })

vim.keymap.del("n", "<leader>gb")
vim.keymap.set("n", "<leader>gw", LazyVim.lazygit.blame_line, { desc = "Git Blame Line" })

vim.keymap.set("n", "<leader>gb", ":Telescope git_branches<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>gB", ":G blame<CR>", { silent = true, noremap = true })

-- LazyVim
vim.keymap.del("n", "<leader>l")
vim.keymap.set("n", "<leader>ll", ":Lazy<CR>", { desc = "Lazy" })
