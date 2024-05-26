return {
  -- https://github.com/rachartier/tiny-devicons-auto-colors.nvim
  {
    "rachartier/tiny-devicons-auto-colors.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
    config = function()
      local theme_colors = require("catppuccin.palettes").get_palette("macchiato")

      require("tiny-devicons-auto-colors").setup({
        colors = theme_colors,

        -- factors = {
        --   lightness = 1.75,
        --   chroma = 1,
        --   hue = 1.25,
        -- },
        --
        -- cache = {
        --   enabled = true,
        --   path = vim.fn.stdpath("cache") .. "/tiny-devicons-auto-colors-cache.json",
        -- },
        --
        -- precise_search = {
        --   enabled = true,
        --   iteration = 10,
        --   precision = 20,
        --   threshold = 23,
        -- },
        --
        -- ignore = {},
        --
        -- autoreload = false,
      })
    end,
  },
}
