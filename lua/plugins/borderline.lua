return {
  -- TODO: Find a way to make consistent rounded borders
  -- This plugin is okay for now
  {
    "mikesmithgh/borderline.nvim",
    enabled = true,
    lazy = true,
    event = "VeryLazy",
    config = function()
      local bl_borders = require("borderline.borders")

      require("borderline").setup({
        border = bl_borders.rounded,
      })
    end,
  },
}
