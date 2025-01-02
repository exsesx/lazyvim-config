return {
  "stevearc/conform.nvim",
  opts = {
    -- NOTE: Biome + Prettier based on cwd
    -- HACK: Sounds like a fun/useful contribution to LazyVim repo

    formatters = {
      prettier = {
        require_cwd = true,
        condition = function()
          return true
        end,
      },
    },
    formatters_by_ft = {
      zig = { "zigfmt" },
    },
  },
}
