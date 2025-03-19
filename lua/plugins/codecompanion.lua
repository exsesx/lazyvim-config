return {
  {
    "olimorris/codecompanion.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      {
        "<leader>aE",
        function()
          local prompt = vim.fn.input("edit selected block:")

          if prompt == "" then
            return
          end

          vim.cmd("CodeCompanion " .. prompt)
        end,
        desc = "codecompanion: edit",
        mode = { "v" },
      },
      {
        "<leader>aA",
        function()
          require("codecompanion").chat()
        end,
        desc = "codecompanion: ask",
        mode = { "n", "v" },
      },
      {
        "<leader>aT",
        function()
          require("codecompanion").toggle()
        end,
        desc = "codecompanion: toggle",
      },
    },
    config = function()
      require("codecompanion").setup({
        display = {
          chat = {
            icons = {
              pinned_buffer = " ",
              watched_buffer = " ",
            },
            window = {
              border = "rounded",
              width = 0.3,
            },
            intro_message = "Press ? for options",
          },
        },
        adapters = {
          copilot = function()
            return require("codecompanion.adapters").extend("copilot", {
              schema = {
                model = {
                  default = "claude-3.7-sonnet",
                  -- "claude-3.5-sonnet", "claude-3.7-sonnet-thought", "gpt-4o-2024-08-06", "gemini-2.0-flash-001", "o1-2024-12-17", "o1-mini-2024-09-12", "o3-mini-2025-01-31"
                },
              },
            })
          end,
        },
        strategies = {
          chat = {
            adapter = "copilot",
            slash_commands = {
              ["file"] = {
                callback = "strategies.chat.slash_commands.file",
                description = "Select a file using Snacks",
                opts = {
                  provider = "snacks",
                  contains_code = true,
                },
              },
            },
          },
          inline = {
            adapter = "copilot",
            keymaps = {
              accept_change = {
                modes = { n = "ga" },
                description = "Accept the suggested change",
              },
              reject_change = {
                modes = { n = "gr" },
                description = "Reject the suggested change",
              },
            },
          },
        },
      })
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = function(_, ft)
      vim.list_extend(ft, { "codecompanion" })
    end,
    opts = function(_, opts)
      opts.file_types = opts.file_types or {}

      if not vim.tbl_contains(opts.file_types, "codecompanion") then
        table.insert(opts.file_types, "codecompanion")
      end

      return opts
    end,
  },
}
