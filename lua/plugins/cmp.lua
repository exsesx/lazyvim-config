-- NOTE: vim.g.ai_cmp is set in lua/config/options.lua

return {
  {
    "Saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "enter",
        ["<Tab>"] = vim.g.ai_cmp == false
            and { LazyVim.cmp.map({ "snippet_forward", "ai_accept" }), "select_next", "fallback" }
          or { LazyVim.cmp.map({ "snippet_forward" }), "select_next", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
      },
      windows = {
        autocomplete = {
          border = "rounded",
          -- selection = "manual", -- "preselect" by default
        },
        signature_help = {
          border = "rounded",
        },
        documentation = {
          border = "rounded",
        },
      },
    },
  },
}
