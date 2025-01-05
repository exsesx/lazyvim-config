local actions = require("fzf-lua.actions")

local no_header = true

return {
  {
    "ibhagwan/fzf-lua",
    opts = {
      -- Set to false to use my FZF_DEFAULT_OPTS
      fzf_colors = false,
      oldfiles = {
        include_current_session = true,
      },
      defaults = {
        file_icons = "mini",
        formatter = "path.filename_first",
      },
      previewers = {
        builtin = {
          -- fzf-lua is very fast, but it really struggled to preview a couple files
          -- in a repo. Those files were very big JavaScript files (1MB, minified, all on a single line).
          -- It turns out it was Treesitter having trouble parsing the files.
          -- With this change, the previewer will not add syntax highlighting to files larger than 100KB
          -- (Yes, I know you shouldn't have 100KB minified files in source control.)
          syntax_limit_b = 1024 * 100, -- 100KB
        },
      },
      files = {
        no_header = no_header,
        cwd_prompt = false,
        fd_opts = [[--color=never --type f --hidden --follow --exclude .git --exclude node_modules]],
        actions = {
          -- o for ignOre
          -- i from hIdden
          ["alt-o"] = { actions.toggle_ignore },
          ["alt-i"] = { actions.toggle_hidden },
          ["alt-h"] = false,
          -- disable toggle ignore
          ["ctrl-g"] = false,
        },
      },
      grep = {
        no_header = no_header,
        -- DEFAULT from https://github.com/ibhagwan/fzf-lua/blob/1bba731df46feb1751dca1632268aae41ed5ac15/lua/fzf-lua/defaults.lua#L316-L317
        -- Flags for case sensitivity: https://github.com/BurntSushi/ripgrep/issues/70#issuecomment-551947205
        -- rg_opts = "--column --line-number --no-heading --color=always --smart-case "
        -- rg_opts = "--column --line-number --no-heading --color=always --case-sensitive "
        --   .. "--max-columns=4096 -e",
        -- no_header_i = true,
        actions = {
          ["alt-o"] = { actions.toggle_ignore },
          ["alt-i"] = { actions.toggle_hidden },
          ["alt-h"] = false,
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
  },
}
