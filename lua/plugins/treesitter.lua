return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      keys = {
        { "]x", desc = "Increment Selection" },
        { "[x", desc = "Decrement Selection", mode = "x" },
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "]x",
          node_incremental = "]x",
          scope_incremental = false,
          node_decremental = "[x",
        },
      },
    },
  },
}
