return {
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters = {
        sqlfluff = {
          args = {
            "lint",
            "--format=json",

            -- NOTE: ansi dialect overriding via config
            -- https://github.com/mfussenegger/nvim-lint/blob/139cd3ccefdc92644746168dd95a15f36aec5458/lua/lint/linters/sqlfluff.lua#L3-L7

            -- NOTE: Figured out the issue with conflicting config and CLI by providing default dialect
            -- at ~/.config/sqlfluff/setup.cfg

            -- "--dialect=ansi",
          },
        },
      },
    },
  },
}
