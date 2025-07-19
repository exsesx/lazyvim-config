return {
  {
    "akinsho/bufferline.nvim",
    optional = true,
    opts = function(_, opts)
      if (vim.g.colors_name or ""):find("catppuccin") then
        opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
      end

      -- opts.options.indicator = {
      --   style = "underline",
      -- }

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
