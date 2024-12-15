return {
  {
    "epwalsh/obsidian.nvim",
    enabled = false,
    version = "*", -- recommended, use latest release instead of latest commit
    event = "VeryLazy",
    -- lazy = false,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "/Users/exsesx/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes",
        },
      },
    },
  },
}
