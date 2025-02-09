return {
  {
    "mrjones2014/smart-splits.nvim",
    -- NOTE: set lazy to false if any error occurs
    lazy = true,
    disabled = true,
    event = "VeryLazy",
    keys = {
      {
        "<C-h>",
        function()
          require("smart-splits").move_cursor_left()
        end,
        mode = { "i", "n", "v" },
        desc = "Move to left window",
      },
      {
        "<C-j>",
        function()
          require("smart-splits").move_cursor_down()
        end,
        mode = { "i", "n", "v" },
        desc = "Move to down window",
      },
      {
        "<C-k>",
        function()
          require("smart-splits").move_cursor_up()
        end,
        mode = { "i", "n", "v" },
        desc = "Move to up window",
      },
      {
        "<C-l>",
        function()
          require("smart-splits").move_cursor_right()
        end,
        mode = { "i", "n", "v" },
        desc = "Move to right window",
      },
    },
  },
}
