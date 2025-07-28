---@module "snacks"

return {
  "snacks.nvim",
  keys = {
    {
      "<leader><space>",
      function()
        Snacks.picker.smart()
      end,
      desc = "Smart Open",
    },
    {
      "<leader>fd",
      function()
        Snacks.picker.git_diff()
      end,
      desc = "Find Diff",
    },
    {
      "<leader>fB",
      function()
        Snacks.picker("git_branches")
      end,
      desc = "Find Git Branches",
    },
  },
  ---@type snacks.Config
  opts = {
    indent = {
      enabled = true,
      scope = {
        enabled = true,
      },
      chunk = {
        enabled = false,
        char = {
          corner_top = "╭",
          corner_bottom = "╰",
          horizontal = "─",
          vertical = "│",
          arrow = "─",
        },
      },
    },
    scroll = { enabled = false },
    -- explorer = {},
    dashboard = {
      preset = {
        -- Cool ASCII project: https://itoa.hex.dance/
        -- ASCII Art: https://patorjk.com/software/taag/#p=testall&c=lua&f=Doh&t=Neovim
        header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
      },
    },
    scratch = {
      win_by_ft = {
        typescript = {
          keys = {
            ["source"] = {
              "<cr>",
              function(self)
                vim.notify(
                  vim.fn.system({ "bun", "run", vim.api.nvim_buf_get_name(self.buf) }),
                  "info",
                  {
                    id = "typescript_scratch",
                    title = "Scratch",
                    opts = function(notif)
                      notif.ft = "typescript"
                    end,
                  }
                )
              end,
              desc = "Run buffer (bun)",
              mode = { "n", "x" },
            },
          },
        },
      },
    },
    picker = {
      layout = {
        fullscreen = false,
      },
      sources = {
        explorer = {
          win = {
            input = {
              keys = {
                ["<Esc>"] = { "", desc = "skip", mode = { "n" } },
              },
            },
            list = {
              keys = {
                ["<Esc>"] = { "", desc = "skip" },
              },
            },
          },
          layout = {
            cycle = false,
            fullscreen = false,
          },
        },
      },
      formatters = {
        file = {
          filename_first = true,
        },
      },
      win = {
        input = {
          keys = {
            -- to close the picker on ESC instead of going to normal mode,
            -- add the following keymap to your config
            -- NOTE: I'm going to use C-[ to go to normal mode, because Esc exit makes me faster
            -- ["<Esc>"] = { "close", mode = { "n", "i" } },

            -- for ignOre
            ["<a-o>"] = { "toggle_ignored", mode = { "i", "n" } },
            -- for hIdden
            ["<a-i>"] = { "toggle_hidden", mode = { "i", "n" } },
          },
        },
      },
    },
    styles = {
      notification = {
        wo = {
          winblend = 0,
        },
      },
    },
  },
}
