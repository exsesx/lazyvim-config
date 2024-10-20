-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- NOTE: Tree
vim.keymap.set("n", "<leader>o", "<Cmd>Neotree<CR>", { silent = true })

-- NOTE: Obsidian
vim.keymap.set("n", "<leader>Oo", "<Cmd>ObsidianOpen<CR>", { desc = "Open Obsidian " })
vim.keymap.set("n", "<leader>Of", "<Cmd>ObsidianFollowLink<CR>", { desc = "Obsidian Follow Link" })
vim.keymap.set("n", "<leader>fO", "<Cmd>ObsidianQuickSwitch<CR>", { desc = "Obsidian Quick Switch (Find)" })

-- NOTE: Neogit

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
vim.keymap.set("n", "<leader>le", ":LazyExtras<CR>", { desc = "Lazy Extras" })

-- NOTE: LSP
-- Muscle memory ¯\_(ツ)_/¯

vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
vim.keymap.set({ "n", "v" }, "<leader>lf", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

-- vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("n", "<leader>lr", function()
  local inc_rename = require("inc_rename")
  return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
end, { desc = "Rename (inc-rename.nvim)", expr = true })

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

-- NOTE: Git
vim.keymap.set("n", "<leader>gt", "<CMD>tab Git<CR>", { desc = "Open Git Fugitive" })
vim.keymap.set("n", "<leader>gn", "<CMD>Neogit kind=tab<CR>", { desc = "Open Neogit" })

-- Tricks

-- TODO: Update neo-tree somehow? Re-open if already opened, etc.
vim.keymap.set("n", "<leader>.", "<CMD>cd %:p:h<CR>", { desc = "Set Buffer Working Directory" })

-- https://stackoverflow.com/questions/16134457/insert-a-newline-without-entering-in-insert-mode-vim
-- Questionable really :thinking:
-- vim.keymap.set("n", "oo", "m`o<Esc>``", { desc = "Insert new line in normal mode" })

-- NOTE: Move Lines from A-j and A-j to A-Down and A-Up
-- vim.keymap.del("n", "<A-j>")
-- vim.keymap.del("n", "<A-k>")
-- vim.keymap.del("i", "<A-j>")
-- vim.keymap.del("i", "<A-k>")
-- vim.keymap.del("v", "<A-j>")
-- vim.keymap.del("v", "<A-k>")

vim.keymap.set("n", "<A-S-Down>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "<A-S-Up>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "<A-S-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<A-S-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "<A-S-Down>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<A-S-Up>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- NOTE: Undotree
vim.keymap.set("n", "<leader>uu", vim.cmd.UndotreeToggle)
