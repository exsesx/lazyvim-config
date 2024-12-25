-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

vim.opt.scrolloff = 12
-- vim.opt.shell = "/opt/homebrew/bin/fish"

vim.opt.formatoptions:remove("c")
vim.opt.formatoptions:remove("r")
vim.opt.formatoptions:remove("o")

-- hide invisible characters (tabs, etc.)
vim.opt.list = false

-- fix nvim-cmp transparency
vim.opt.pumblend = 0
vim.o.winblend = 0

-- add border to diagnostic window
vim.diagnostic.config({
  float = { border = "rounded" },
})

-- completions
-- vim.opt.completeopt = { "menu", "menuone", "noinsert" }
vim.opt.shortmess:append("c")

-- enable wrap by default
vim.opt.wrap = true

-- vim.opt.cursorline = true
-- vim.opt.cursorlineopt = "number"

vim.g.autoformat = false
-- vim.g.lazyvim_eslint_auto_format = false

vim.opt.swapfile = false
vim.opt.spell = false

vim.opt.laststatus = 3

-- in cmp, instead of inline suggestions
-- vim.g.ai_cmp = true

-- vim.g.visual_whitespace = false

-- biome linter + formatter
-- vim.g.lazyvim_prettier_needs_config = true

-- Ruby
-- vim.g.lazyvim_ruby_lsp = "ruby_lsp"
-- vim.g.lazyvim_ruby_formatter = "rubocop"
-- vim.g.lazyvim_ruby_lsp = "solargraph"

vim.g.snacks_animate = false
