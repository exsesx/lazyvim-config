-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.scrolloff = 12
vim.opt.shell = "/opt/homebrew/bin/fish"

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

-- enable wrap by default
vim.opt.wrap = true

-- TODO: Make split borders thicker if possible
-- vim.o.fillchars.vert = "▏"
-- vim.o.fillchars.horiz = "▁"
-- vim.opt.listchars:append({ vert = "#", horiz = "-" })
