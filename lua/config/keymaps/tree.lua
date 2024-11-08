local map = vim.keymap.set

map("n", "<leader>o", "<Cmd>Neotree<CR>", { silent = true })

-- TODO: Update neo-tree somehow? Re-open if already opened, etc.
map("n", "<leader>.", "<CMD>cd %:p:h<CR>", { desc = "Set Buffer Working Directory" })
