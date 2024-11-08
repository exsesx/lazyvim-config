local map = vim.keymap.set

-- Treesitter Context

-- x for conteXt
if LazyVim.has("nvim-treesitter-context") then
  map("n", "[x", function()
    require("treesitter-context").go_to_context(vim.v.count1)
  end, { silent = true, desc = "Up Treesitter Context" })
end
