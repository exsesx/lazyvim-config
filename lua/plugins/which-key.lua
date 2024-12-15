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
          { "<leader>O", group = "obsidian", icon = "󰠮 " },
          { "<leader>r", group = "refactor", icon = " " },
        },
      },
    },
  },
}
