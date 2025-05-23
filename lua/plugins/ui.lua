-- https://www.lazyvim.org/plugins/colorscheme

---@module "tokyonight"
---@module "catppuccin"

local dark_colorscheme = "catppuccin-mocha"
local light_colorscheme = "catppuccin-latte"

return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    -- priority = 1000,
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
        -- hl.LspInlayHint = vim.tbl_extend("force", hl.LspInlayHint, { bg = colors.none })

        ---@diagnostic disable-next-line: param-type-mismatch
        hl.TabLineFill = vim.tbl_extend("force", hl.TabLineFill, { bg = colors.none })

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

        -- snacks
        hl.SnacksPickerSelected = { fg = colors.blue }
      end,
      plugins = {
        auto = true,
        markdown = true,
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
        section_separators = { left = "", right = "" },
        -- Uncomment and modify the line below to use different separators
        -- section_separators = { left = "", right = "" },
        -- section_separators = { left = " ", right = " " },
        component_separators = "",
        theme = dark_colorscheme,
      })

      opts.sections = vim.tbl_deep_extend("force", opts.sections or {}, {
        lualine_a = {
          {
            "mode",
            separator = { left = "" },
            padding = { left = 0, right = 1 },
          },
        },
        -- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/ui.lua#L129
        lualine_y = {
          require("config.lualine.codecompanion"),
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
          {
            "location",
            separator = { right = "" },
            padding = { left = 1, right = 0 },
          },
        },
      })

      -- TODO: This section in LazyVim is helpful, however it takes too much space
      if #opts.sections.lualine_c > 0 then
        table.remove(opts.sections.lualine_c, #opts.sections.lualine_c)
      end

      -- NOTE: Remove when https://github.com/LazyVim/LazyVim/pull/5900 is merged
      -- opts.sections.lualine_x[2] = LazyVim.lualine.status(
      --   LazyVim.config.icons.kinds.Copilot,
      --   function()
      --     local clients = package.loaded["copilot"]
      --         and LazyVim.lsp.get_clients({ name = "copilot", bufnr = 0 })
      --       or {}
      --     if #clients > 0 then
      --       local status = require("copilot.status").data.status
      --       return (status == "InProgress" and "pending")
      --         or (status == "Warning" and "error")
      --         or "ok"
      --     end
      --   end
      -- )

      return opts
    end,
  },

  -- NOTE: Remove when https://github.com/LazyVim/LazyVim/pull/5900 is merged
  {
    "zbirenbaum/copilot.lua",
    optional = true,
    opts = function()
      require("copilot.api").status = require("copilot.status")
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = dark_colorscheme,
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

  {
    "f-person/auto-dark-mode.nvim",
    lazy = true,
    enabled = false,
    event = "VeryLazy",
    opts = {
      set_dark_mode = function()
        vim.api.nvim_set_option_value("background", "dark", {})
        vim.api.nvim_command("colorscheme " .. dark_colorscheme)
      end,
      set_light_mode = function()
        vim.api.nvim_set_option_value("background", "light", {})
        vim.api.nvim_command("colorscheme " .. light_colorscheme)
      end,
      update_interval = 3000,
      fallback = "dark",
    },
  },

  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      transparent_background = true,
      no_bold = true,
      no_italic = true,
      integrations = {
        neogit = true,
        diffview = true,
        harpoon = true,
        nvim_surround = true,
        gitgraph = true,
        avante = {
          enabled = true,
          windows_sidebar_header_rounded = true,
        },
      },
      ---@type CtpHighlightOverrideFn
      custom_highlights = function(colors)
        return {
          ["@comment.note"] = { link = "TodoFgNote" },
          ["@comment.warning"] = { link = "TodoFgWarn" },
          ["@comment.todo"] = { link = "TodoFgTODO" },
          ["@comment.error"] = { link = "TodoFgFIX" },

          -- HACK: Disable italic for cmdline icon
          NoiceCmdlineIcon = { fg = colors.sky, style = {} },

          -- NOTE: Neogit integration (https://github.com/catppuccin/nvim/blob/c1fcef5d7a6e8dd28392c3b04150b9c42b84a40e/lua/catppuccin/groups/integrations/neogit.lua)
          NeogitDiffContext = {
            bg = colors.none,
          },
          NeogitDiffContextHighlight = {
            bg = colors.none,
          },
          NeogitDiffContextCursor = {
            link = "CursorLine",
          },
          NeogitDiffDelete = {
            bg = colors.none,
          },
          NeogitDiffDeleteHighlight = {
            bg = colors.none,
          },
          NeogitDiffDeleteCursor = {
            link = "CursorLine",
          },
          NeogitDiffAdd = {
            bg = colors.none,
          },
          NeogitDiffAddHighlight = {
            bg = colors.none,
          },
          NeogitDiffAddCursor = {
            link = "CursorLine",
          },
          NeogitDiffHeader = {
            bg = colors.none,
          },
          NeogitDiffHeaderHighlight = {
            bg = colors.none,
          },
          NeogitDiffHunkHeader = {
            bg = colors.none,
          },
          NeogitDiffHunkHeaderHighlight = {
            bg = colors.none,
          },

          -- kitty-scrollback
          KittyScrollbackNvimVisual = { link = "Visual" },
          KittyScrollbackNvimPasteWinNormal = {},
          KittyScrollbackNvimNormal = {},
          KittyScrollbackNvimPasteWinFloatTitle = {},
          KittyScrollbackNvimPasteWinFloatBorder = {},
          KittyScrollbackNvimStatusWinNormal = {},
          KittyScrollbackNvimStatusWinNvimIcon = {
            bg = colors.none,
            fg = colors.green,
          },
          KittyScrollbackNvimStatusWinHeartIcon = {
            bg = colors.none,
            fg = colors.red,
          },
          KittyScrollbackNvimStatusWinKittyIcon = {
            bg = colors.none,
            fg = colors.pink,
          },
          KittyScrollbackNvimStatusWinReadyIcon = {},
          KittyScrollbackNvimStatusWinSpinnerIcon = {},
        }
      end,
    },
  },
}
