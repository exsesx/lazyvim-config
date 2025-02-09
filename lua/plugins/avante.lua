return {
  {
    "yetone/avante.nvim",
    lazy = true,
    event = "VeryLazy",
    build = "make",
    opts = {
      provider = "copilot",
      auto_suggestions_provider = "copilot",
      copilot = {
        model = "o3-mini",
        -- model = "claude-3.5-sonnet",
        -- model = "gpt-4o",

        -- temperature = 0,
        -- max_tokens = 8192,
        -- max_tokens = 4096,
      },
      hints = { enabled = false },
      file_selector = {
        provider = "snacks",
        provider_opts = {},
      },
    },
    dependencies = {
      {
        "folke/which-key.nvim",
        opts = {
          spec = {
            { "<leader>a", group = "ai", mode = { "n", "v" } },
          },
        },
      },
      {
        "saghen/blink.compat",
        lazy = true,
        opts = {},
        config = function()
          -- monkeypatch cmp.ConfirmBehavior for Avante
          require("cmp").ConfirmBehavior = {
            Insert = "insert",
            Replace = "replace",
          }
        end,
      },
      {
        "saghen/blink.cmp",
        lazy = true,
        opts = {
          sources = {
            default = { "avante_commands", "avante_mentions", "avante_files" },
            providers = {
              avante_commands = {
                name = "avante_commands",
                module = "blink.compat.source",
                score_offset = 90, -- show at a higher priority than lsp
                opts = {},
              },
              avante_files = {
                name = "avante_files",
                module = "blink.compat.source",
                score_offset = 100, -- show at a higher priority than lsp
                opts = {},
              },
              avante_mentions = {
                name = "avante_mentions",
                module = "blink.compat.source",
                score_offset = 1000, -- show at a higher priority than lsp
                opts = {},
              },
            },
          },
        },
      },
      {
        "MeanderingProgrammer/render-markdown.nvim",
        optional = true,
        ft = function(_, ft)
          vim.list_extend(ft, { "Avante" })
        end,
      },
    },
  },
  {
    "stevearc/dressing.nvim",
    lazy = true,
    optional = true,
    opts = {
      input = { enabled = false },
      select = { enabled = false },
    },
  },
}
