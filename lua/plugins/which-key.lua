return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
      defaults = {
        ["<leader>l"] = { name = "+lsp/lazy" },
      },
    },
  },
}
