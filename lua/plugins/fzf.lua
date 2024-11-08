local actions = require("fzf-lua.actions")

return {
  {
    "ibhagwan/fzf-lua",
    opts = {
      -- Set to false to use my FZF_DEFAULT_OPTS
      fzf_colors = false,
      files = {
        no_header = true,
        -- no_header_i = true,
        cwd_prompt = false,
        actions = {
          ["ctrl-alt-i"] = { actions.toggle_ignore },
          ["ctrl-alt-h"] = { actions.toggle_hidden },
        },
      },
      grep = {
        no_header = true,
        -- no_header_i = true,
        actions = {
          ["ctrl-alt-i"] = { actions.toggle_ignore },
          ["ctrl-alt-h"] = { actions.toggle_hidden },
        },
      },
      git = {
        status = {
          no_header = true,
        },
      },
    },
  },
}
