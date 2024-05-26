return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")

      -- https://github.com/hrsh7th/nvim-cmp/blob/main/doc/cmp.txt
      -- FIXME: Limit width (especially in Rust)
      -- For now this looks awful when the types are long, etc.

      opts.preselect = cmp.PreselectMode.Item
      opts.completion = {
        completeopt = "menu,menuone,noinsert",
      }

      -- Annoying at times
      opts.experimental = {
        ghost_text = false,
      }

      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }
    end,
  },
}
