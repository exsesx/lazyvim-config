return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      require("telescope").setup({
        defaults = {
          layout_strategy = "vertical",
          sorting_strategy = "ascending",
          layout_config = {
            vertical = {
              prompt_position = "top",
              mirror = true,
            },
          },
        },
      })
    end,
  },
}
