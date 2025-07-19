return {
  "mcauley-penney/visual-whitespace.nvim",
  -- event = "ModeChanged *:[vV\22]",
  event = "VeryLazy",
  config = function(_, opts)
    require("visual-whitespace").setup(opts)

    local default_fg = "#5d5f71"

    local on_colorscheme_change = function()
      local visual_hl = vim.api.nvim_get_hl(0, { name = "Visual" })
      vim.api.nvim_set_hl(0, "VisualNonText", {
        fg = default_fg,
        bg = visual_hl and visual_hl.bg,
      })
    end

    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = on_colorscheme_change,
    })

    on_colorscheme_change()

    vim.g.visual_whitespace_enabled = true

    Snacks.toggle({
      name = "Visual Whitespace",
      get = function()
        return vim.g.visual_whitespace_enabled
      end,
      set = function(state)
        vim.g.visual_whitespace_enabled = not state
        require("visual-whitespace").toggle()
      end,
    }):map("<leader>uv")
  end,
  opts = function()
    return {
      list_chars = {
        space = "·",
        tab = "→",
        nbsp = "␣",
      },
      fileformat_chars = {
        unix = "↲",
        mac = "←",
        dos = "↙",
      },
      enabled = true,
      ignore = {
        filetypes = { "neo-tree" },
        buftypes = {},
      },
    }
  end,
  -- keys = { 'v', 'V', '<C-v>' }, -- optionally, lazy load on visual mode keys
}
