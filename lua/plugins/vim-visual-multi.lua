return {
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
    init = function()
      vim.g.VM_set_statusline = 0 -- disable VM's statusline updates to prevent clobbering
      vim.g.VM_silent_exit = 1 -- because the status line already tells me the mode

      vim.g.VM_show_warnings = 0
      vim.g.VM_maps = {
        ["Add Cursor Up"] = "<M-Up>",
        ["Add Cursor Down"] = "<M-Down>",
        ["Undo"] = "u",
        ["Redo"] = "<C-r>",

        -- https://github.com/Saghen/blink.cmp/issues/406#issuecomment-2537184121
        ["I Return"] = "<S-CR>",
        ["I Down Arrow"] = "",
        ["I Up Arrow"] = "",
      }
    end,
  },
}
