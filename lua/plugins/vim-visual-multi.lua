return {
  "mg979/vim-visual-multi",
  event = "VeryLazy",
  init = function()
    vim.g.VM_maps = {
      ["Add Cursor Up"] = "<M-Up>",
      ["Add Cursor Down"] = "<M-Down>",
    }
  end,
}
