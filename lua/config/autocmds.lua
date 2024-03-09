-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- do not add comment on the new line if the previous line is commented
vim.api.nvim_create_autocmd("FileType", {
  command = "set formatoptions-=cro",
})
