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
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "auto",
      },
    },
  },
}
