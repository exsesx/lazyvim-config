return {
  {
    "MeanderingProgrammer/markdown.nvim",
    opts = {
      file_types = { "markdown", "vimwiki" },
      code = { -- Determines how code blocks & inline code are rendered:
        --  none:     disables all rendering
        --  normal:   adds highlight group to code blocks & inline code, adds padding to code blocks
        --  language: adds language icon to sign column if enabled and icon + name above code blocks
        --  full:     normal + language
        style = "language",
        sign = true,
      },
      heading = {
        sign = true,
      },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          args = { "--config", os.getenv("HOME") .. "/.markdownlint-cli2.yaml", "--" },
        },
      },
    },
  },
}
