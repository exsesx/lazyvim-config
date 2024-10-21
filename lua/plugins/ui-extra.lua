if true then
  return {}
end

return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    opts = {
      flavour = "macchiato",
      transparent_background = true,
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
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
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },

  {
    -- https://github.com/sainnhe/everforest?tab=readme-ov-file
    "sainnhe/everforest",
    lazy = true,
    event = "VeryLazy",
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
    event = "VeryLazy",
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
    event = "VeryLazy",
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
    event = "VeryLazy",
    config = function()
      vim.g.sonokai_transparent_background = 2
      vim.g.sonokai_better_performance = 1
      vim.g.sonokai_current_word = "grey background"
      -- vim.g.sonokai_style = "shusia"
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "auto",
      },
    },
  },
}
