return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = function()
      return {
        -- file_types = { "markdown", "vimwiki" },
        code = { -- Determines how code blocks & inline code are rendered:
          --  none:     disables all rendering
          --  normal:   adds highlight group to code blocks & inline code, adds padding to code blocks
          --  language: adds language icon to sign column if enabled and icon + name above code blocks
          --  full:     normal + language
          style = "language",
          border = "none",
          disable_background = true,
          sign = true,
        },
        heading = {
          sign = true,
        },
      }
    end,
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          args = {
            "--config",
            os.getenv("HOME") .. "/.markdownlint-cli2.yaml",
            "--",
          },
        },
      },
    },
  },
}
