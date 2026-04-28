return {
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
    },
    config = function()
      local neogit = require("neogit")

      neogit.setup({
        use_default_keymaps = true,
        disable_context_highlighting = true,
        process_spinner = true,
        graph_style = "kitty",
        kind = "auto",
        integrations = {
          diffview = true,

          -- https://github.com/NeogitOrg/neogit/pull/1654
          snacks = true,
        },
        -- commit_editor = {
        --   show_staged_diff = false,
        --   staged_diff_split_kind = "split",
        -- },
        -- TODO: Improve chevron icons
        -- signs = {
        --   -- { CLOSED, OPENED }
        --   hunk = { "", "" },
        --   item = { "", "" },
        --   section = { "", "" },
        -- },
      })
    end,
  },
}
