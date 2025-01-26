-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

vim.opt.scrolloff = 10
vim.opt.shell = "/opt/homebrew/bin/bash"

vim.opt.formatoptions:remove("c")
vim.opt.formatoptions:remove("r")
vim.opt.formatoptions:remove("o")

-- hide invisible characters (tabs, etc.)
vim.opt.list = false

vim.opt.listchars = {
  tab = "▷ ", -- Tab character (two characters: ▷ and space)
  trail = "·", -- Trailing space
  extends = "◣", -- Characters extending past the end of the line
  precedes = "◢", -- Characters preceding the start of the line
  nbsp = "○", -- Non-breaking space
}

-- fix nvim-cmp transparency
vim.opt.pumblend = 0
vim.o.winblend = 0

-- add border to diagnostic window
vim.diagnostic.config({
  float = { border = "rounded" },
})

-- completions
vim.opt.completeopt = { "menu", "menuone", "noselect" }
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
vim.g.ai_cmp = true

-- use my custom lazygit config
vim.g.lazygit_config = false

-- vim.g.visual_whitespace = false

-- biome linter + formatter
-- vim.g.lazyvim_prettier_needs_config = true

-- Ruby
-- vim.g.lazyvim_ruby_lsp = "ruby_lsp"
-- vim.g.lazyvim_ruby_formatter = "rubocop"
-- vim.g.lazyvim_ruby_lsp = "solargraph"

vim.g.snacks_animate = false

-- Zig
vim.g.zig_fmt_autosave = 0

-- Neovim fixes
vim.hl = vim.highlight
