return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "norg", "rmd", "org", "Avante", "codecompanion" },
    opts = {
      file_types = { "markdown", "norg", "rmd", "org" },
      code = {
        style = "language",
        border = "none",
        disable_background = true,
        sign = true,
      },
      heading = {
        sign = true,
      },
    },
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
