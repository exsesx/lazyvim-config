return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts_extend = { "spec" },
    opts = {
      preset = "helix",
      defaults = {},
      spec = {
        {
          mode = { "n", "v" },
          { "<leader>l", group = "lsp/lazy" },
          { "<leader>gd", group = "diffview" },
          { "<leader>r", group = "refactor", icon = " " },
        },
      },
    },
  },
}
