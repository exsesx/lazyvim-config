local map = vim.keymap.set

map("n", "<leader>gt", "<CMD>tab Git<CR>", { desc = "Open Git Fugitive" })
map("n", "<leader>gn", "<CMD>Neogit kind=tab<CR>", { desc = "Open Neogit" })

-- Gitsigns
-- local gitsigns = require("gitsigns")

-- NOTE: Lazy for some reason uses <cmd> instead of lua calls, which renders noice,
-- https://github.com/LazyVim/LazyVim/blob/3ac62a4364780412fb791d459f908ca7a9232919/lua/lazyvim/plugins/editor.lua#L289
-- del({ "n", "v" }, "<leader>ghs")
-- del({ "n", "v" }, "<leader>ghr")
-- map({ "n", "v" }, "<leader>ghs", gitsigns.stage_hunk, { desc = "Stage Hunk" })
-- map({ "n", "v" }, "<leader>ghr", gitsigns.reset_hunk, { desc = "Reset Hunk" })

-- HACK: Old ways with gitsigns (now using mini.diff)
-- map("n", "<leader>ghr", function()
--   vim.cmd("normal dgh")
-- end, { desc = "Reset Hunk", silent = true })
