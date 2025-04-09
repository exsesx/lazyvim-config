-- TODO: Add toggle remap
-- TODO: Adjust highlight colors
-- gx me https://github.com/mcauley-penney/visual-whitespace.nvim
return {
  "mcauley-penney/visual-whitespace.nvim",
  event = "VeryLazy",
  opts = function()
    return {
      highlight = {
        fg = vim.api.nvim_get_hl(0, { name = "Comment" }).fg,
        bg = vim.api.nvim_get_hl(0, { name = "Visual" }).bg,
      },
      space_char = "·",
      tab_char = "–",
      -- nl_char = "↲",
      nl_char = "",
      -- cr_char = "←",
      cr_char = "",
      enabled = true,
      excluded = {
        filetypes = {},
        buftypes = {},
      },
    }
  end,
  -- keys = { 'v', 'V', '<C-v>' }, -- optionally, lazy load on visual mode keys
}
