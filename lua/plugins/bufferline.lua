return {
  {
    "akinsho/bufferline.nvim",
    optional = true,
    opts = function(_, opts)
      opts.options.show_buffer_close_icons = false
      opts.options.show_close_icon = false
      opts.options.separator_style = { "", "" }
      opts.options.groups = {
        items = {
          require("bufferline.groups").builtin.pinned:with({ icon = "" }),
        },
      }

      return opts
    end,
  },
}
