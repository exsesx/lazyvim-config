-- do not add comment on the new line if the previous line is commented
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove("c")
    vim.opt_local.formatoptions:remove("r")
    vim.opt_local.formatoptions:remove("o")
  end,
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

-- HACK: Disable bashls diagnostics for .env files
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = ".env",
  callback = function(args)
    vim.diagnostic.enable(false, { bufnr = args.buf })
  end,
})

-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
--   pattern = "*",
--   callback = function()
--     vim.cmd("silent! Copilot disable")
--   end,
-- })
