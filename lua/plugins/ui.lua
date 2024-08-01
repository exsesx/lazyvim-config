-- https://www.lazyvim.org/plugins/colorscheme

local current_colorscheme = "tokyonight" -- or catppuccin

return {
  -- {
  --   -- https://github.com/sainnhe/everforest?tab=readme-ov-file
  --   "sainnhe/everforest",
  --   lazy = true,
  --   init = function()
  --     vim.g.everforest_transparent_background = 2
  --     vim.g.everforest_better_performance = 1
  --     vim.g.everforest_current_word = "grey background"
  --   end,
  -- },

  -- https://github.com/sainnhe/gruvbox-material/blob/master/doc/gruvbox-material.txt
  -- {
  --   "sainnhe/gruvbox-material",
  --   lazy = true,
  --   config = function()
  --     vim.g.gruvbox_material_transparent_background = 2
  --     vim.g.gruvbox_material_better_performance = 1
  --     vim.g.gruvbox_material_current_word = "grey background"
  --   end,
  -- },

  -- https://github.com/sainnhe/edge/blob/master/doc/edge.txt
  -- {
  --   "sainnhe/edge",
  --   lazy = true,
  --   config = function()
  --     vim.g.edge_transparent_background = 2
  --     vim.g.edge_better_performance = 1
  --     vim.g.edge_current_word = "grey background"
  --     vim.g.edge_style = "aura"
  --   end,
  -- },

  -- https://github.com/sainnhe/sonokai/blob/master/doc/sonokai.txt
  -- {
  --   "sainnhe/sonokai",
  --   lazy = true,
  --   config = function()
  --     vim.g.sonokai_transparent_background = 2
  --     vim.g.sonokai_better_performance = 1
  --     vim.g.sonokai_current_word = "grey background"
  --     -- vim.g.sonokai_style = "shusia"
  --   end,
  -- },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      style = "moon",
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      dim_inactive = true,
      -- colors https://github.com/folke/tokyonight.nvim/blob/main/extras/lua/tokyonight_moon.lua
      on_colors = function(colors)
        colors.bg_statusline = colors.none
        colors.border = colors.blue -- border splits color
      end,
      on_highlights = function(hl, colors)
        -- Transparent inlay hints
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
      end,
      plugins = {
        auto = true,
      },
    },
  },

  -- https://github.com/catppuccin/nvim
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    opts = {
      flavour = "macchiato",
      transparent_background = true,
      -- NOTE: All inspirations: https://github.com/catppuccin/nvim/discussions/323
      -- NOTE: Plastilin https://github.com/catppuccin/nvim/discussions/323?sort=new#discussioncomment-8869494
      custom_highlights = function(colors)
        return {
          TreesitterContextBottom = { sp = colors.none, style = {} },
        }
      end,
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dap = true,
        dap_ui = true,
        dashboard = true,
        flash = true,
        gitsigns = true,
        headlines = true,
        illuminate = {
          enabled = true,
          lsp = false,
        },
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        diffview = true,
        harpoon = true,
        neogit = true,
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = {
          enabled = true,
          style = "nvchad",
        },
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        -- section_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
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
        lualine_y = {
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
