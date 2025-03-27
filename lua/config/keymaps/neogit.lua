if vim.g.vscode then
  return
end

-- local map = vim.keymap.set

-- local neogit = require("neogit")

-- vim.keymap.del("n", "<leader>gs")
-- map("n", "<leader>gs", neogit.open, { silent = true, noremap = true, desc = "Neogit Status" })

-- vim.keymap.del("n", "<leader>gc")
-- map("n", "<leader>gc", ":Neogit commit<CR>", { silent = true, noremap = true, desc = "Neogit Commit" })

-- map("n", "<leader>gp", ":Neogit pull<CR>", { silent = true, noremap = true, desc = "Neogit Pull" })
-- map("n", "<leader>gP", ":Neogit push<CR>", { silent = true, noremap = true, desc = "Neogit Push" })

-- vim.keymap.del("n", "<leader>gb") -- remove git blame line
-- map("n", "<leader>gW", LazyVim.lazygit.blame_line, { desc = "Git Blame Line" }) -- reassign

-- map("n", "<leader>gw", ":G blame_line<CR>", { silent = true, noremap = true, desc = "Blame Line" })
