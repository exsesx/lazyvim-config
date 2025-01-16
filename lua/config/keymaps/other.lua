local map = vim.keymap.set

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
