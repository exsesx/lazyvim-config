return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")

      -- https://github.com/hrsh7th/nvim-cmp/blob/main/doc/cmp.txt
      -- FIXME: Limit width (especially in Rust)
      -- For now this looks awful when the types are long, etc.

      opts.preselect = cmp.PreselectMode.None
      opts.completion = {
        completeopt = "menu,menuone,noinsert,noselect",
      }

      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }
    end,
  },
}
