return {
  {
    "NeogitOrg/neogit",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      -- "ibhagwan/fzf-lua", -- optional
    },
    opts = {
      use_default_keymaps = true,
      integrations = {
        diffview = true,
      },
      commit_editor = {
        show_staged_diff = false,
        staged_diff_split_kind = "split",
      },
    },
  },
}
