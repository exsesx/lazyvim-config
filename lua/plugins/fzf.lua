local actions = require("fzf-lua.actions")

local no_header = true

return {
  {
    "ibhagwan/fzf-lua",
    opts = {

      -- Set to false to use my FZF_DEFAULT_OPTS
      fzf_colors = false,
      files = {
        no_header = no_header,
        -- no_header_i = true,
        cwd_prompt = false,
        actions = {
          ["ctrl-alt-i"] = { actions.toggle_ignore },
          ["ctrl-alt-h"] = { actions.toggle_hidden },
        },
      },
      grep = {
        no_header = no_header,
        -- no_header_i = true,
        actions = {
          ["ctrl-alt-i"] = { actions.toggle_ignore },
          ["ctrl-alt-h"] = { actions.toggle_hidden },
        },

        -- HACK: always use live_grep_glob
        rg_glob = true,
      },
      git = {
        status = {
          no_header = no_header,
        },
      },
    },
    keys = {
      { "<leader>fa", "<cmd>FzfLua resume<cr>", desc = "Find Again (resume)" },
    },
  },
}
