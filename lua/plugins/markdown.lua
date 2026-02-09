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
        -- highlight = nil,
        -- highlight_info = nil,
        -- highlight_language = nil,
        -- highlight_inline = nil,
        highlight_border = false,
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
