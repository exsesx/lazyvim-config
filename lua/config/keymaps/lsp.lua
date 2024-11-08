local map = vim.keymap.set

-- Muscle memory ¯\_(ツ)_/¯

map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map({ "n", "v" }, "<leader>lf", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

-- map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<leader>lr", function()
  local inc_rename = require("inc_rename")
  return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
end, { desc = "Rename (inc-rename.nvim)", expr = true })
