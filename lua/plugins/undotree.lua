return {
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    init = function()
      vim.g.undotree_WindowLayout = 3
      vim.g.undotree_ShortIndicators = 0
      vim.g.undotree_SplitWidth = 35
      vim.g.undotree_DiffAutoOpen = 0
    end,
  },
}
