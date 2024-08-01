-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- NOTE: Tree

vim.keymap.set("n", "<leader>o", "<Cmd>Neotree<CR>", { silent = true })

-- NOTE: Remove lazygit keymaps

-- vim.keymap.del("n", "<leader>gg")
-- vim.keymap.del("n", "<leader>gG")

-- NOTE: Neogit keymaps

-- local neogit = require("neogit")
--
-- vim.keymap.del("n", "<leader>gs")
-- vim.keymap.set("n", "<leader>gs", neogit.open, { silent = true, noremap = true, desc = "Neogit Status" })
--
-- vim.keymap.del("n", "<leader>gc")
-- vim.keymap.set("n", "<leader>gc", ":Neogit commit<CR>", { silent = true, noremap = true, desc = "Neogit Commit" })
--
-- vim.keymap.set("n", "<leader>gp", ":Neogit pull<CR>", { silent = true, noremap = true, desc = "Neogit Pull" })
-- vim.keymap.set("n", "<leader>gP", ":Neogit push<CR>", { silent = true, noremap = true, desc = "Neogit Push" })
--
-- vim.keymap.del("n", "<leader>gb") -- remove git blame line
-- vim.keymap.set("n", "<leader>gW", LazyVim.lazygit.blame_line, { desc = "Git Blame Line" }) -- reassign
--
-- vim.keymap.set("n", "<leader>gw", ":G blame_line<CR>", { silent = true, noremap = true, desc = "Blame Line" })

-- NOTE: LazyVim

vim.keymap.del("n", "<leader>l")
vim.keymap.set("n", "<leader>ll", ":Lazy<CR>", { desc = "Lazy" })

-- NOTE: LSP
-- Muscle memory, sorry

vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
vim.keymap.set({ "n", "v" }, "<leader>lf", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename" })

-- NOTE: Treesitter Context

-- x for conteXt
if LazyVim.has("nvim-treesitter-context") then
  vim.keymap.set("n", "[x", function()
    require("treesitter-context").go_to_context(vim.v.count1)
  end, { silent = true, desc = "Up Treesitter Context" })
end

-- NOTE: Oil
vim.keymap.set("n", "<leader>fo", "<Cmd>Oil<CR>", { desc = "Oil" })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open Parent Directory" })

-- https://stackoverflow.com/questions/16134457/insert-a-newline-without-entering-in-insert-mode-vim
-- Questionable really :thinking:
-- vim.keymap.set("n", "oo", "m`o<Esc>``", { desc = "Insert new line in normal mode" })

-- NOTE: DiffView

-- vim.keymap.set("n", "<leader>gd", function()
--   if next(require("diffview.lib").views) == nil then
--     vim.cmd("DiffviewOpen")
--   else
--     vim.cmd("DiffviewClose")
--   end
-- end, { desc = "Toggle Diff View" })
