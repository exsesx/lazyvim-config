if vim.g.vscode then
  return
end

local map = vim.keymap.set
local del = vim.keymap.del

-- From NvChad
-- NOTE: ";" is used for next
-- map("n", ";", ":", { noremap = true })

-- From Primeagen and https://vineeth.io/posts/neovim-setup
-- map("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })
map(
  "n",
  "J",
  ":let p=getpos('.')<bar>join<bar>call setpos('.', p)<cr>",
  { desc = "Join lines and keep cursor position", silent = true }
)
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up and center" })
map("n", "n", "nzzzv", { desc = "Next search result and center" })
map("n", "N", "Nzzzv", { desc = "Previous search result and center" })
map("n", "Q", "<nop>", { desc = "Disable Ex mode" })

-- https://stackoverflow.com/questions/16134457/insert-a-newline-without-entering-in-insert-mode-vim
-- Questionable really :thinking:
-- map("n", "oo", "m`o<Esc>``", { desc = "Insert new line in normal mode" })

-- NOTE: Interesting stuff https://www.reddit.com/r/neovim/comments/1h7f0bz/share_your_coolest_keymap/
map("n", "yc", "yygccp", { desc = "Duplicate a line and comment out the first line", remap = true })
-- map("n", "<C-c>", "ciw") -- from folke

-- inspired by helix, tbh
map({ "n", "x" }, "gl", "$", { remap = true, desc = "Go to last character of the line" })
map({ "n", "x" }, "gh", "^", { remap = true, desc = "Go to first character of the line" })

map("n", "]p", "]p`[=`]", { desc = "Paste after and format" })
map("n", "[p", "[p`[=`]", { desc = "Paste before and format" })

map("x", "]p", "p`[=`]`[", { desc = "Replace selection and format" })
map("x", "[p", "P`[=`]`[", { desc = "Replace selection and format" })

-- Replace selection and format without overwriting the clipboard
map("x", "<leader>p", '"_dP`[=`]`[', { desc = "Replace selection and format" })
map("x", "<leader>P", '"_dP`[=`]`[', { desc = "Replace selection and format" })

-- Delete visual selection without overwriting the clipboard
map("x", "<leader>d", '"_d', { desc = "Delete selection" })

-- Change visual selection without overwriting the clipboard
map("x", "<leader>c", '"_c', { desc = "Change selection" })

-- remove debug -> eval
-- https://github.com/LazyVim/LazyVim/blob/25abbf546d564dc484cf903804661ba12de45507/lua/lazyvim/plugins/extras/dap/core.lua#L87
del("v", "<leader>de")
