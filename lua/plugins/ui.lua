-- https://www.lazyvim.org/plugins/colorscheme

---@diagnostic disable-next-line: unused-local
local tokyonight = require("tokyonight")
local current_colorscheme = "tokyonight-moon" -- or catppuccin

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    ---@type tokyonight.Config
    opts = {
      style = "moon",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
        comments = { italic = true },
        keywords = { italic = false },
        functions = {},
        variables = {},
      },
      cache = true,
      on_colors = function(colors)
        colors.bg_statusline = colors.none
        colors.border = colors.blue -- border splits color
      end,
      on_highlights = function(hl, colors)
        ---@diagnostic disable-next-line: param-type-mismatch
        hl.LspInlayHint = vim.tbl_extend("force", hl.LspInlayHint, { bg = colors.none })

        ---@diagnostic disable-next-line: param-type-mismatch
        hl.Todo = vim.tbl_extend("force", hl.Todo, { bg = colors.none })

        ---@diagnostic disable-next-line: param-type-mismatch
        hl.Pmenu = vim.tbl_extend("force", hl.Pmenu, { bg = colors.none })

        ---@diagnostic disable-next-line: param-type-mismatch
        hl.BlinkCmpMenu = vim.tbl_extend("force", hl.Pmenu, { bg = colors.none })
        hl.BlinkCmpMenuBorder = hl.FloatBorder

        -- make neotree border "transparent", but keep splits border colored
        hl.NeoTreeWinSeparator = { fg = colors.bg, bg = colors.none }

        -- fixes weird red color (ansi brown?) while searching in fzf (live grep)
        hl.FzfLuaLiveSym = { link = "FzfLuaFzfMatch" }

        -- disable bold by default
        hl.CursorLineNr = { fg = colors.orange }

        -- gitsigns inline color fixes
        hl.GitSignsAddInline = { bg = colors.git.add, fg = colors.bg }
        hl.GitSignsChangeInline = { bg = colors.git.change, fg = colors.bg }
        hl.GitSignsDeleteInline = { bg = colors.git.delete, fg = colors.bg }
      end,
      plugins = {
        auto = true,
        markdown = true,
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        -- section_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        section_separators = { left = " ", right = " " },
        component_separators = "",
        theme = current_colorscheme,
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(mode)
              return vim.b["visual_multi"] and mode .. " - MULTI" or mode
            end,
          },
        },
        -- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/ui.lua#L129
        lualine_y = {
          {
            "filetype",
            colored = true,
            icon_only = true,
            separator = "",
            padding = { left = 1, right = 0 },
            icon = { align = "left" },
          },
          { "filename" },
          { "progress" },
        },
        lualine_z = {
          { "location" },
        },
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = current_colorscheme,
    },
  },

  {
    "folke/todo-comments.nvim",
    opts = {
      highlight = {
        before = "", -- "fg" or "bg" or empty
        keyword = "fg", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
        after = "fg", -- "fg" or "bg" or empty
      },
    },
  },

  -- {
  --   "catppuccin/nvim",
  --   lazy = true,
  --   name = "catppuccin",
  --   opts = {
  --     flavour = "macchiato",
  --     transparent_background = true,
  --   },
  -- },
}
