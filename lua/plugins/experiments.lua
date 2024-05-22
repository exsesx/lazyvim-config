-- WARNING: HIGHLY DANGEROUS PLACE
-- DO NOT CONSIDER AS A PART OF THE MAIN CONFIG

-- Comment this block if feeling adventurous
if true then
  return {}
end

return {
  -- NOTE: UI Experiments
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_transparent_background = 2
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_float_style = "dim"
      vim.g.gruvbox_material_current_word = "grey background"
    end,
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    opts = {
      variant = "auto", -- auto, main, moon, or dawn
      dark_variant = "main", -- main, moon, or dawn
      dim_inactive_windows = false,
      extend_background_behind_borders = true,

      enable = {
        terminal = true,
        legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
        migrations = true, -- Handle deprecated options automatically
      },

      styles = {
        bold = true,
        italic = true,
        transparency = true,
      },

      groups = {
        border = "muted",
        link = "iris",
        panel = "surface",

        error = "love",
        hint = "iris",
        info = "foam",
        note = "pine",
        todo = "rose",
        warn = "gold",

        git_add = "foam",
        git_change = "rose",
        git_delete = "love",
        git_dirty = "rose",
        git_ignore = "muted",
        git_merge = "iris",
        git_rename = "pine",
        git_stage = "iris",
        git_text = "rose",
        git_untracked = "subtle",

        h1 = "iris",
        h2 = "foam",
        h3 = "rose",
        h4 = "gold",
        h5 = "pine",
        h6 = "foam",
      },

      highlight_groups = {
        -- Comment = { fg = "foam" },
        -- VertSplit = { fg = "muted", bg = "muted" },
      },

      before_highlight = function(group, highlight, palette)
        -- Disable all undercurls
        -- if highlight.undercurl then
        --     highlight.undercurl = false
        -- end
        --
        -- Change palette colour
        -- if highlight.fg == palette.pine then
        --     highlight.fg = palette.foam
        -- end
      end,
    },
  },

  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- Main options --
      style = "warm", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
      transparent = true, -- Show/hide background
      term_colors = true, -- Change terminal color as per the selected theme style
      ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
      cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

      -- toggle theme style ---
      toggle_style_key = "<leader>uk", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
      toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

      -- Change code style ---
      -- Options are italic, bold, underline, none
      -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
      code_style = {
        comments = "italic",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none",
      },

      -- Lualine options --
      lualine = {
        transparent = true, -- lualine center bar transparency
      },

      -- Custom Highlights --
      colors = {}, -- Override default colors
      highlights = {}, -- Override highlight groups

      -- Plugins Config --
      diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true, -- use undercurl instead of underline for diagnostics
        background = true, -- use background color for virtual text
      },
    },
  },

  -- TODO: work in progress
  {
    "marko-cerovac/material.nvim",
    lazy = false,
    priority = 1000,
    opts = function()
      local high_visibility = {
        darker = true,
        lighter = true,
      }

      return {
        -- contrast = {
        --   terminal = false, -- Enable contrast for the built-in terminal
        --   sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
        --   floating_windows = false, -- Enable contrast for floating windows
        --   cursor_line = true, -- Enable darker background for the cursor line
        --   lsp_virtual_text = false, -- Enable contrasted background for lsp virtual text
        --   non_current_windows = false, -- Enable contrasted background for non-current windows
        --   -- filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
        -- },

        styles = { -- Give comments style such as bold, italic, underline etc.
          comments = { italic = true },
          -- strings = { bold = true },
          -- keywords = { underline = true },
          -- functions = { bold = true, undercurl = true },
          variables = {},
          operators = {},
          types = {},
        },

        plugins = {
          "dap",
          "gitsigns",
          "harpoon",
          "illuminate",
          "indent-blankline",
          "mini",
          "neogit",
          "neotest",
          "neo-tree",
          "noice",
          "nvim-cmp",
          "nvim-web-devicons",
          "telescope",
          "trouble",
          -- "which-key", -- looks better without it
          "nvim-notify",
        },

        disable = {
          colored_cursor = true, -- Disable the colored cursor
          borders = false, -- Disable borders between verticaly split windows
          background = true, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
          term_colors = false, -- Prevent the theme from setting terminal colors
          eob_lines = false, -- Hide the end-of-buffer lines
        },

        high_visibility,

        lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )

        async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

        custom_colors = function(colors)
          local white = "#ffffff"
          local gray = "#616161" -- WebStorm
          local black = "#595959" -- WebStorm dark grey
          local red = "#F75464"
          local green = "#6AAB73"
          local yellow = "#CF8E6D" -- orange
          local blue = "#56A8F5"
          local paleblue = "#83ACFC"
          local cyan = "#2AACB8"
          local purple = "#c77dbb"
          local orange = "#cf8e6d"

          local link_color = "#548AF7"
          local caret_color = "#CED0D6"
          local error_color = "#F75464"
          local title_color = "#EEFFFF" -- from theme

          local fg = "#BCBEC4"
          local selection_color = "#214283"

          colors.main.white = white
          colors.main.gray = gray
          colors.main.black = black

          colors.main.red = red
          colors.main.green = green
          colors.main.yellow = yellow
          colors.main.blue = blue
          colors.main.paleblue = paleblue
          colors.main.cyan = cyan
          colors.main.purple = purple
          colors.main.orange = orange

          -- NOTE: same as light for now
          colors.main.darkred = red
          colors.main.darkgreen = green
          colors.main.darkyellow = yellow
          colors.main.darkblue = blue
          colors.main.darkpaleblue = paleblue
          colors.main.darkcyan = cyan
          colors.main.darkpurple = purple
          colors.main.darkorange = orange

          colors.editor.link = link_color
          colors.editor.cursor = caret_color
          colors.editor.title = title_color
          colors.lsp.error = error_color

          colors.editor.line_numbers = "#5C5C5C" -- theme
          colors.syntax.comments = "#757575" -- theme

          colors.editor.bg = "#212121"
          colors.editor.bg_alt = "#1A1A1A"
          colors.editor.fg = fg -- WS
          colors.editor.fg_dark = fg -- WS
          colors.editor.selection = selection_color
          colors.editor.contrast = "#1A1A1A"
          colors.editor.active = "#323232"
          colors.editor.border = "#343434"
          colors.editor.highlight = "#3F3F3F"
          colors.editor.disabled = "#474747"
          colors.editor.accent = orange

          colors.syntax.variable = colors.editor.fg
          colors.syntax.field = colors.editor.fg
          colors.syntax.keyword = colors.main.purple
          colors.syntax.value = colors.main.orange
          colors.syntax.operator = colors.main.cyan
          colors.syntax.fn = colors.main.blue
          colors.syntax.string = colors.main.green
          colors.syntax.type = colors.main.purple

          colors.git.added = colors.main.green
          colors.git.removed = colors.main.red
          colors.git.modified = colors.main.blue

          colors.lsp.warning = colors.main.yellow
          colors.lsp.info = colors.main.paleblue
          colors.lsp.hint = colors.main.purple

          -- colors.backgrounds.sidebars = colors.editor.bg
          -- colors.backgrounds.floating_windows = colors.editor.bg
          -- colors.backgrounds.non_current_windows = colors.editor.bg
          colors.backgrounds.cursor_line = colors.editor.active
        end,

        custom_highlights = {
          CursorLine = { bg = "#323232" }, -- colors.editor.active
          Search = { bg = "#114957" },
          CurSearch = { bg = "#114957" },
          IncSearch = { bg = "#114957" },
          TreesitterContext = { bg = "#212121" },
          -- TreesitterContextBottom = { undercurl = true },
          TreesitterContextLineNumber = { bg = "NONE" },
          LspReferenceText = { bg = "#373B39" }, -- from WebStorm
        },
      }
    end,
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      light_style = "day", -- The theme is used when the background is set to light
      transparent = true, -- Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "transparent", -- style for sidebars, see below
        floats = "transparent", -- style for floating windows
      },
      sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
      lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

      --- You can override specific color groups to use other groups or a hex color
      --- function will be called with a ColorScheme table
      ---@param colors ColorScheme
      on_colors = function(colors) end,

      --- You can override specific highlights to use other groups or a hex color
      --- function will be called with a Highlights and ColorScheme table
      ---@param highlights Highlights
      ---@param colors ColorScheme
      on_highlights = function(highlights, colors) end,
    },
  },

  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      compile = false, -- enable compiling the colorscheme
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      -- functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      -- typeStyle = {},
      transparent = true, -- do not set background color
      dimInactive = false, -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
      overrides = function(colors)
        local theme = colors.theme

        return {
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },

          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },

          -- Save an hlgroup with dark background and dimmed foreground
          -- so that you can use it where your still want darker windows.
          -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

          -- Popular plugins that open floats will link to NormalFloat by default;
          -- set their background accordingly if you wish to keep them dark and borderless
          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        }
      end,
      theme = "dragon",
    },
  },

  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function()
      require("transparent").setup({
        extra_groups = {
          "NormalFloat",
          "FloatBorder",
          "FloatTitle",

          -- neogit transparency
          "NeogitDiffHeader",
          "NeogitDiffHeader",
          "NeogitDiffContextHighlight",
          "NeogitDiffContext",
        },
        exclude_groups = {},
      })
    end,
  },
}
