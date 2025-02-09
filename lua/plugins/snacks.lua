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
    -- {
    --   "<leader>gs",
    --   function()
    --     Snacks.picker.git_status({
    --       win = {
    --         input = {
    --           keys = {
    --             -- ["<Tab>"] = { "git_stage", mode = { "n", "i" } },
    --             ["<Tab>"] = { "select_and_next", mode = { "i", "n" } },
    --             ["<Left>"] = { "git_stage", mode = { "n", "i" } },
    --             ["<Right>"] = { "git_stage", mode = { "n", "i" } },
    --           },
    --         },
    --       },
    --     })
    --   end,
    --   desc = "Git Status",
    -- },
  },
  opts = {
    scroll = { enabled = false },
    -- explorer = {},
    dashboard = {
      preset = {
        header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
        -- Cool ASCII project: https://itoa.hex.dance/
        -- ASCII Art: https://patorjk.com/software/taag/#p=testall&c=lua&f=Doh&t=Neovim
        -- stylua: ignore start
        --         header =
        -- [[
        --
        --     _/      _/                                  _/
        --    _/_/    _/    _/_/      _/_/    _/      _/      _/_/_/  _/_/
        --   _/  _/  _/  _/_/_/_/  _/    _/  _/      _/  _/  _/    _/    _/
        --  _/    _/_/  _/        _/    _/    _/  _/    _/  _/    _/    _/
        -- _/      _/    _/_/_/    _/_/        _/      _/  _/    _/    _/
        -- ]]
        -- ,
        -- stylua: ignore end
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
          },
        },
      },
      formatters = {
        file = {
          filename_first = true,
          -- filename_only = true,
        },
      },
      -- layout = "telescope",
      icons = {
        ui = {
          -- TODO: spacing is better, but inconsistent with other pickers (git branches, for example)
          -- selected = " ● ",
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
