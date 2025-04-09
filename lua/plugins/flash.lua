---@module "flash"

return {
  "folke/flash.nvim",
  enabled = not vim.g.vscode,
  keys = {
    -- XXX: I rely on S too much for now, maybe someday
    {
      "S",
      false,
      mode = { "n", "x", "o" },
    },
  },
  ---@type Flash.Config
  opts = {
    modes = {
      char = {
        enabled = false,
        autohide = not vim.g.vscode,
      },
    },
  },
}
