return {
  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    lazy = false, -- This plugin is already lazy
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
