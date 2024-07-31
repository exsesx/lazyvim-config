-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.scrolloff = 18

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

-- enable wrap by default
vim.opt.wrap = true

-- TODO: Make split borders thicker if possible
-- vim.o.fillchars.vert = "▏"
-- vim.o.fillchars.horiz = "▁"
-- vim.opt.listchars:append({ vert = "#", horiz = "-" })

-- NOTE: Neovide Settings

if vim.g.neovide then
  vim.notify(string.format("Neovide: %s", vim.g.neovide_version))

  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_refresh_rate = 120
  vim.g.neovide_cursor_vfx_mode = "wireframe"
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_no_idle = true
  vim.g.neovide_cursor_trail_size = 0.75
  vim.g.neovide_cursor_unfocused_outline_width = 0.125
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_animate_command_line = true

  -- Helper function for transparency formatting
  local alpha = function()
    return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
  end
  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  vim.g.neovide_transparency = 0
  vim.g.transparency = 0.95
  vim.g.neovide_background_color = "#1E1F22" .. alpha()
end
