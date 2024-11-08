local map = vim.keymap.set

map("n", "<leader>uu", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
