local map = vim.keymap.set

map("n", "<leader>Oo", "<Cmd>ObsidianOpen<CR>", { desc = "Open Obsidian " })
map("n", "<leader>Of", "<Cmd>ObsidianFollowLink<CR>", { desc = "Obsidian Follow Link" })
map("n", "<leader>fO", "<Cmd>ObsidianQuickSwitch<CR>", { desc = "Obsidian Quick Switch (Find)" })
