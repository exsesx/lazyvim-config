local lualine = require("lualine")

return {
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    -- https://github.com/folke/zen-mode.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
    opts = {
      -- options = {
      --   signcolumn = "no", -- disable signcolumn
      --   number = false, -- disable number column
      --   relativenumber = false, -- disable relative numbers
      --   cursorline = false, -- disable cursorline
      --   cursorcolumn = false, -- disable cursor column
      --   foldcolumn = "0", -- disable fold column
      --   list = false, -- disable whitespace characters
      -- },
      on_open = function()
        lualine.hide({})
        vim.o.statusline = ""
        vim.o.laststatus = 0
      end,
      on_close = function()
        lualine.hide({ unhide = true })
      end,
      wezterm = {
        enabled = true,
        -- can be either an absolute font size or the number of incremental steps
        font = "+4", -- (10% increase per step)
      },
    },
  },
}
