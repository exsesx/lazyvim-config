return {
  -- https://github.com/folke/noice.nvim
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
        inc_rename = true,
      },
      views = {
        hover = {
          border = { style = "rounded" },
        },
        mini = {
          win_options = {
            winblend = 0,
          },
        },
      },
      lsp = {
        hover = {
          -- Set not show a message if hover is not available
          -- ex: shift+k on Typescript code
          silent = true,
        },
        signature = {
          auto_open = {
            enabled = false,
          },
        },
      },
    },
  },
}
