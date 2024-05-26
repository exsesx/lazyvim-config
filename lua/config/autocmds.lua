-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- do not add comment on the new line if the previous line is commented
vim.api.nvim_create_autocmd("BufRead", {
  command = "set formatoptions-=cro",
})

-- NOTE: Colorschemes by sainnhe are not fully transparent
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = { "everforest", "edge", "sonokai", "gruvbox-material" },
  callback = function()
    vim.notify(vim.g.colors_name .. " colorscheme activated (transparency)")

    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
  end,
})
