return {
  {
    "yetone/avante.nvim",
    lazy = true,
    event = "VeryLazy",
    build = "make",
    opts = {
      provider = "copilot",
      copilot = {
        -- model = "o3-mini",
        model = "claude-3.7-sonnet",
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
      -- cursor_applying_provider = "fastapply",
      -- behaviour = {
      --   enable_cursor_planning_mode = true,
      --   auto_apply_diff_after_generation = true,
      -- },
      -- vendors = {
      --   fastapply = {
      --     __inherited_from = "openai",
      --     api_key_name = "",
      --     endpoint = "http://localhost:11434/v1",
      --     model = "hf.co/Kortix/FastApply-7B-v1.0_GGUF:Q4_K_M",
      --   },
      -- },
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
            per_filetype = {
              AvanteInput = { "avante_commands", "avante_mentions", "avante_files" },
            },
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
        ft = function(_, ft)
          vim.list_extend(ft, { "Avante" })
        end,
        opts = function(_, opts)
          opts.file_types = opts.file_types or {}

          if not vim.tbl_contains(opts.file_types, "Avante") then
            table.insert(opts.file_types, "Avante")
          end

          return opts
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
