return {
  "dmtrKovalenko/fff.nvim",
  build = "cargo build --release",
  enabled = false,
  opts = {
    -- pass here all the options
  },
  keys = {
    {
      "ff", -- try it if you didn't it is a banger keybinding for a picker
      function()
        require("fff").find_files() -- or find_in_git_root() if you only want git files
      end,
      desc = "Open file picker",
    },
  },
}
