-- NOTE: vim.g.ai_cmp is set in lua/config/options.lua

return {
  {
    "Saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "enter",
        ["<Tab>"] = {
          LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
          "select_next",
          "fallback",
        },
        ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
      },
      completion = {
        -- list = { selection = { preselect = true, auto_insert = false } },
        ghost_text = {
          -- enabled = vim.g.ai_cmp,
          -- NOTE: I don't like layout being shifted all over the place
          enabled = false,
        },
        menu = {
          border = "rounded",
          draw = {
            treesitter = {},
          },
        },
        documentation = {
          window = {
            border = "rounded",
          },
        },
      },
    },
  },
}
