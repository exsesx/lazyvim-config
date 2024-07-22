-- https://www.lazyvim.org/plugins/colorscheme

local current_colorscheme = "tokyonight" -- or catppuccin

return {
  {
    -- https://github.com/sainnhe/everforest?tab=readme-ov-file
    "sainnhe/everforest",
    lazy = true,
    init = function()
      vim.g.everforest_transparent_background = 2
      vim.g.everforest_better_performance = 1
      vim.g.everforest_current_word = "grey background"
    end,
  },

  -- https://github.com/sainnhe/gruvbox-material/blob/master/doc/gruvbox-material.txt
  {
    "sainnhe/gruvbox-material",
    lazy = true,
    config = function()
      vim.g.gruvbox_material_transparent_background = 2
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_current_word = "grey background"
    end,
  },

  -- https://github.com/sainnhe/edge/blob/master/doc/edge.txt
  {
    "sainnhe/edge",
    lazy = true,
    config = function()
      vim.g.edge_transparent_background = 2
      vim.g.edge_better_performance = 1
      vim.g.edge_current_word = "grey background"
      vim.g.edge_style = "aura"
    end,
  },

  -- https://github.com/sainnhe/sonokai/blob/master/doc/sonokai.txt
  {
    "sainnhe/sonokai",
    lazy = true,
    config = function()
      vim.g.sonokai_transparent_background = 2
      vim.g.sonokai_better_performance = 1
      vim.g.sonokai_current_word = "grey background"
      -- vim.g.sonokai_style = "shusia"
    end,
  },

  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      transparent = true,
      style = "moon",
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_colors = function(colors)
        colors.bg_statusline = colors.none
      end,
      on_highlights = function(hl, colors)
        -- Transparent inlay hints
        hl.LspInlayHint = vim.tbl_extend("force", hl.LspInlayHint, { bg = colors.none })

        -- Transparent Neogit WIP
        -- hl.NeogitDiffAdd = { bg = colors.none }
        -- hl.NeogitDiffDelete = { bg = colors.none }
        -- hl.NeogitDiffHeader = { bg = colors.none }
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
      -- color_overrides = {
      --   -- HACK: MAKE colors distinguishable, i.e. no same colors (close are acceptable)

      --   -- https://www.colors.tools
      --   macchiato = {
      --     rosewater = "#eb7a73",
      --     flamingo = "#eb7a73",
      --     red = "#eb7a73",
      --     maroon = "#eb7a73",
      --     pink = "#e396a4",
      --     mauve = "#e396a4",
      --     peach = "#e89a5e",
      --     yellow = "#e8b267",
      --     green = "#b9c675",
      --     teal = "#99c792",
      --     sky = "#99c792",
      --     sapphire = "#99c792",
      --     blue = "#8dbba3",
      --     lavender = "#8dbba3",
      --     text = "#f1e4c2",
      --     subtext1 = "#e5d5b1",
      --     subtext0 = "#c5bda3",
      --     overlay2 = "#b8a994",
      --     overlay1 = "#a39284",
      --     overlay0 = "#656565",
      --     surface2 = "#5d5d5d",
      --     surface1 = "#505050",
      --     surface0 = "#393939",
      --     base = "#2e3233",
      --     mantle = "#242727",
      --     crust = "#1f2223",
      --   },
      --
      --   -- TODO: Go WebStorm colors:
      --   -- FIXME: Close, but not yet
      --
      --   mocha = {
      --     overlay2 = "#92969d",
      --     overlay1 = "#7d8188",
      --     overlay0 = "#696d74",
      --
      --     surface2 = "#54575f",
      --     surface1 = "#40424a",
      --     surface0 = "#2c2e36",
      --
      --     base = "#1e1f22",
      --     mantle = "#191a1c",
      --     crust = "#121314",
      --
      --     text = "#BCBEC4",
      --     subtext0 = "#BCBEC4",
      --     subtext1 = "#BCBEC4",
      --
      --     rosewater = "#CED0D6", -- cursor
      --     flamingo = "#CED0D6",
      --
      --     pink = "#C77DBB",
      --     mauve = "#C77DBB",
      --
      --     red = "#FA6675",
      --     maroon = "#CF8E6D",
      --     peach = "#CF8E6D",
      --     yellow = "#B3AE60",
      --     green = "#6AAB73",
      --     teal = "#299999",
      --     sky = "#0DA19E",
      --     sapphire = "#83ACFC",
      --     blue = "#56A8F5",
      --     lavender = "#C77DBB",
      --   },
      -- },
      custom_highlights = function(colors)
        return {
          TreesitterContextBottom = { sp = colors.none, style = {} },

          -- DiagnosticHint = { fg = colors.pink },

          -- CursorLine = { bg = "#26282E" },

          -- NOTE: WebStorm Highlights
          -- TODO: optimize colors and highlights

          -- CursorLine = { bg = "#26282E" },
          -- NeoTreeDirectoryName = { fg = colors.text },
          -- NeoTreeGitModified = { fg = colors.blue },
          -- -- NeoTreeGitRenamed = { fg = colors.blue },
          --
          -- NoiceCmdlinePopupBorder = { fg = colors.text },
          -- CursorLineNr = { fg = colors.rosewater },
          --
          -- Type = { fg = colors.text },
          -- ["@variable.builtin"] = { fg = colors.peach },
          -- ["@variable.parameter"] = { fg = colors.text },
          -- ["@variable.member"] = { fg = colors.peach },
          --
          -- ["@parameter"] = { fg = colors.text },
          --
          -- ["@keyword.return"] = { fg = colors.peach },
          -- ["@keyword.import"] = { fg = colors.peach },
          -- ["@keyword.export"] = { fg = colors.peach },
          --
          -- -- TypeScript decorators
          -- ["@attribute.typescript"] = { fg = colors.yellow },
          -- ["@operator.typescript"] = { fg = colors.text },
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
