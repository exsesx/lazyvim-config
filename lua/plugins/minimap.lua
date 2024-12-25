return {
  {
    "echasnovski/mini.map",
    event = "VeryLazy",
    enabled = false,
    config = function()
      local map = require("mini.map")

      map.setup({
        integrations = {
          map.gen_integration.builtin_search({
            search = "Search",
          }),
          map.gen_integration.diagnostic({
            error = "DiagnosticFloatingError",
            warn = "DiagnosticFloatingWarn",
            info = "DiagnosticFloatingInfo",
            hint = "DiagnosticFloatingHint",
          }),
          map.gen_integration.diff(),
          map.gen_integration.gitsigns(),
        },

        symbols = {
          encode = map.gen_encode_symbols.dot("3x2"),
          -- Some suggestions for scrollbar symbols:
          -- - View-line pairs: '▒' and '█'.
          -- - Line - '🮚', '▶'.
          -- - View - '╎', '┋', '┋'.
          scroll_line = " ▢ ",
          scroll_view = " │ ",
          -- scroll_line = "█",
          -- scroll_view = "▒",
        },
        window = {
          focusable = false,
          side = "right",
          width = 8,
          show_integration_count = false,
          winblend = 0,
          zindex = 21, -- nvim-treesitter-context zindex is 20
        },
      })

      local disable_autohide = false

      Snacks.toggle({
        name = "Minimap",
        get = function()
          return next(map.current.win_data) ~= nil
        end,
        set = function(state)
          disable_autohide = true
          if state then
            map.open()

            if disable_autohide then
              disable_autohide = false
            end
          else
            map.close()
          end
        end,
      }):map("<leader>um")

      local exclude_filetypes = {
        dashboard = true,
        noice = true,
        alpha = true,
        ["neo-tree"] = true,
        oil = true,
        toggleterm = true,
        quickfix = true,
        help = true,
        Trouble = true,
      }

      vim.api.nvim_create_autocmd("BufEnter", {
        callback = function(args)
          local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })
          local ft = vim.api.nvim_get_option_value("filetype", { buf = args.buf })

          if disable_autohide then
            return
          end

          if buftype ~= "" or exclude_filetypes[ft] then
            pcall(map.close)
          else
            pcall(map.open)
          end
        end,
      })
    end,
  },
}
