return {
  {
    "folke/which-key.nvim",
    -- FIXME: https://github.com/folke/which-key.nvim/issues/482
    -- FIXME: https://github.com/LazyVim/LazyVim/issues/1955
    -- FIXME: https://github.com/folke/which-key.nvim/issues/514
    -- tl;dr versions >1.4 forbid to setup empty groups (like the ones below)
    version = "1.4",
    opts = {
      defaults = {
        ["<leader>l"] = { name = "+lsp/lazy" },
        ["<leader>gh"] = { name = "+hunks" },
        ["<leader>gt"] = { name = "+toggle" },
        ["<leader>n"] = { name = "+next" },
        ["<leader>p"] = { name = "+prev" },
      },
    },
  },
}
