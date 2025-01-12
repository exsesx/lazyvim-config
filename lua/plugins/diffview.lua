return {
  -- NOTE: https://github.com/sindrets/diffview.nvim

  "sindrets/diffview.nvim",
  event = "VeryLazy",
  opts = function()
    local actions = require("diffview.actions")

    return {
      hooks = {
        diff_buf_read = function()
          -- vim.opt_local.wrap = false
          -- vim.opt_local.list = false
          -- vim.opt_local.colorcolumn = { 80 }
          vim.opt_local.cursorline = false
        end,
      },
      keymaps = {
        view = {
          {
            "n",
            "q",
            actions.close,
            { desc = "Close" },
          },
        },
        file_panel = {
          {
            "n",
            "q",
            actions.close,
            { desc = "Close" },
          },
        },
        file_history_panel = {
          {
            "n",
            "q",
            actions.close,
            { desc = "Close" },
          },
        },
      },
    }
  end,
  keys = {
    -- https://github.com/sindrets/diffview.nvim/issues/302#issuecomment-1678397129
    {
      "<leader>gdd",
      "<cmd>DiffviewClose<cr>",
      desc = "Diffview Delete",
    },
    -- gdf and gdo inspired by https://www.reddit.com/r/neovim/comments/1f7jj15/comment/ll9ial8
    {
      "<leader>gdf",
      function()
        local user_input = vim.fn.input("Files to Open: ")

        if user_input == "" then
          return
        end

        vim.cmd("DiffviewFileHistory" .. user_input)
      end,
      desc = "Diffview File History",
    },
    {
      "<leader>gdo",
      function()
        local user_input = vim.fn.input("Revision to Open: ")

        if user_input == "" then
          return
        end

        vim.cmd("DiffviewOpen " .. user_input)
      end,
      desc = "Diffview Open",
    },
  },
}
