-- https://www.lazyvim.org/plugins/colorscheme

---@diagnostic disable-next-line: unused-local
local tokyonight = require("tokyonight")
local current_colorscheme = "tokyonight" -- or catppuccin

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    --- WRONG HERE
    ---@type tokyonight.Config
    opts = {
      style = "night",
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
        -- Transparent inlay hints
        ---@diagnostic disable-next-line: param-type-mismatch
        hl.LspInlayHint = vim.tbl_extend("force", hl.LspInlayHint, { bg = colors.none })

        -- Transparent Neogit WIP
        -- hl.NeogitDiffAdd = { bg = colors.none }
        -- hl.NeogitDiffDelete = { bg = colors.none }
        -- hl.NeogitDiffHeader = { bg = colors.none }

        -- hl.NeoTreeVertSplit = { fg = colors.none, bg = colors.none }
        -- hl.NeoTreeFloatBorder = { fg = colors.none, bg = colors.none }

        -- make neotree border "transparent", but keep splits border colored
        hl.NeoTreeWinSeparator = { fg = colors.bg, bg = colors.none }

        -- hl.VertSplit = { fg = colors.none, bg = colors.none }
        -- hl.WinSeparator = { fg = colors.bg, bg = colors.none }
        -- hl.FloatBorder = { fg = colors.none, bg = colors.none }

        -- fixes weird red color (ansi brown?) while searching in fzf (live grep)
        hl.FzfLuaLiveSym = { link = "FzfLuaFzfMatch" }

        -- disable bold by default
        hl.CursorLineNr = { fg = colors.orange }
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
        section_separators = { left = "", right = "" },
        -- section_separators = { left = " ", right = " " },
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
}
