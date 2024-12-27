return {
  {
    "akinsho/bufferline.nvim",
    optional = true,
    opts = {
      options = {
        indicator = {
          style = "none",
        },
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = { "|", "|" },
        groups = {
          items = {
            require("bufferline.groups").builtin.pinned:with({ icon = "" }),
          },
        },
      },
    },
  },
}
