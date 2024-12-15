return {
  {
    "mrcjkb/rustaceanvim",
    opts = function()
      vim.g.rustaceanvim = {
        tools = {
          float_win_config = {
            border = "rounded",
          },
        },
      }
    end,
  },
  {
    "saecki/crates.nvim",
    opts = {
      popup = {
        border = "rounded",
      },
    },
  },
}
