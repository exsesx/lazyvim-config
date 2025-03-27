---@module "flash"

return {
  "folke/flash.nvim",
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
        autohide = not vim.g.vscode,
      },
    },
  },
}
