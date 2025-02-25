return {
  {
    "akinsho/git-conflict.nvim",
    event = "VeryLazy",
    enabled = false,
    dependencies = {
      {
        "folke/which-key.nvim",
        opts = {
          spec = {
            { "<leader>ch", group = "hunks/conflicts" },
            { "<leader>cho", desc = "Choose ours", mode = "n" },
            { "<leader>cht", desc = "Choose theirs", mode = "n" },
            { "<leader>chb", desc = "Choose both", mode = "n" },
            { "<leader>ch0", desc = "Choose none", mode = "n" },
            { "]x", desc = "Move to next conflict", mode = "n" },
            { "[x", desc = "Move to previous conflict", mode = "n" },
          },
        },
      },
    },
    config = function()
      local gc = require("git-conflict")

      gc.setup({
        default_mappings = true, -- disable buffer local mapping created by this plugin
        default_commands = true, -- disable commands created by this plugin
        disable_diagnostics = true, -- This will disable the diagnostics in a buffer whilst it is conflicted
        list_opener = "copen", -- command or function to open the conflicts list
        highlights = { -- They must have background color, otherwise the default color will be used
          incoming = "DiffAdd",
          current = "DiffText",
          ancestor = "DiffChange",
        },
      })
    end,
  },
}
