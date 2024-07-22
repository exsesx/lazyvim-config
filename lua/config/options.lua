-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.scrolloff = 16

-- hide invisible characters (tabs, etc.)
vim.opt.list = false

-- fix nvim-cmp transparency
vim.opt.pumblend = 0

-- add border to diagnostic window
vim.diagnostic.config({
  float = { border = "rounded" },
})

-- completions
vim.opt.completeopt = { "menu", "menuone", "noinsert" }
vim.opt.shortmess:append("c")

-- vim-visual-multi tweaks
vim.g.VM_set_statusline = 0 -- disable VM's statusline updates to prevent clobbering
vim.g.VM_silent_exit = 1 -- because the status line already tells me the mode
