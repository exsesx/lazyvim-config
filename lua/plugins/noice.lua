return {
  -- https://github.com/folke/noice.nvim
  {
    "folke/noice.nvim",
    opts = {
      views = {
        hover = {
          border = { style = "rounded" },
          position = { row = 2, col = 0 },
        },
      },
      lsp = {
        hover = {
          -- Set not show a message if hover is not available
          -- ex: shift+k on Typescript code
          silent = true,
        },
      },
    },
  },
}
