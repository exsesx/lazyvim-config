local actions = require("fzf-lua.actions")

return {
  {
    "ibhagwan/fzf-lua",
    opts = {
      -- Set to false to use my FZF_DEFAULT_OPTS
      fzf_colors = false,

      -- NOTE: Removes the header line with actions descriptions
      -- I haven't figured out yet how to do that properly and if I need it
      -- It still could be useful to know what the actions are

      -- fzf_args = "--header-lines=0 --header=",

      -- https://github.com/LazyVim/LazyVim/blob/12818a6cb499456f4903c5d8e68af43753ebc869/lua/lazyvim/plugins/extras/editor/fzf.lua#L153
      -- winopts = {
      --   width = 0.9,
      --   height = 0.9,
      --   row = 0.5,
      --   col = 0.5,
      -- },

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
