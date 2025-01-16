return {
  "snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
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

    -- TODO: Enable after https://github.com/folke/snacks.nvim/discussions/464 is resolved
    -- Also https://github.com/folke/snacks.nvim/discussions/337 is interesting discussion
    -- indent = {}

    picker = {
      formatters = {
        file = {
          filename_first = true,
        },
      },
      -- layout = "telescope",
      icons = {
        ui = {
          selected = " ● ",
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
