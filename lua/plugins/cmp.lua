return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")

      -- opts.preselect = cmp.PreselectMode.None
      -- opts.completion = {
      --   completeopt = "menu,menuone,noinsert",
      -- }

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

      -- https://www.reddit.com/r/neovim/comments/14k7pbc/comment/jpp9u1a/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button

      -- https://github.com/tjdevries/config_manager/blob/78608334a7803a0de1a08a9a4bd1b03ad2a5eb11/xdg_config/nvim/after/plugin/completion.lua#L129
      opts.sorting = {
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,

          -- copied from cmp-under, but I don't think I need the plugin for this.
          -- I might add some more of my own.
          function(entry1, entry2)
            local _, entry1_under = entry1.completion_item.label:find("^_+")
            local _, entry2_under = entry2.completion_item.label:find("^_+")
            entry1_under = entry1_under or 0
            entry2_under = entry2_under or 0
            if entry1_under > entry2_under then
              return false
            elseif entry1_under < entry2_under then
              return true
            end
          end,

          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      }
    end,
  },
}
