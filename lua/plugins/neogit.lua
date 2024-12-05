return {
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
      "ibhagwan/fzf-lua", -- optional
    },
    config = function()
      local neogit = require("neogit")

      neogit.setup({
        use_default_keymaps = true,
        disable_context_highlighting = false,
        graph_style = "kitty",
        integrations = {
          diffview = true,
          fzf_lua = true,
        },
        commit_editor = {
          show_staged_diff = false,
          staged_diff_split_kind = "split",
        },
      })

      local function extend_highlight(group, opts)
        local current_hl = vim.api.nvim_get_hl(0, { name = group })
        local new_hl = vim.tbl_extend("force", current_hl, opts, { default = false })

        vim.api.nvim_set_hl(0, group, new_hl)
      end

      -- TODO: WIP

      -- FIXME: This won't change on the fly when colorscheme changes
      -- NOTE: From tokyonight, but use link instead or something
      -- idea is https://stackoverflow.com/questions/18774910/how-to-partially-link-highlighting-groups
      local cursor_hl = vim.api.nvim_get_hl(0, { name = "CursorLine" })
      local cursor_line_color = cursor_hl.bg

      extend_highlight("NeogitDiffContext", { bg = "none" })
      extend_highlight("NeogitDiffContextHighlight", { bg = "none" })
      extend_highlight("NeogitDiffContextCursor", { bg = cursor_line_color })

      extend_highlight("NeogitDiffDelete", { bg = "none" })
      extend_highlight("NeogitDiffDeleteHighlight", { bg = "none" })
      extend_highlight("NeogitDiffDeleteCursor", { bg = cursor_line_color })

      extend_highlight("NeogitDiffAdd", { bg = "none" })
      extend_highlight("NeogitDiffAddHighlight", { bg = "none" })
      extend_highlight("NeogitDiffAddCursor", { bg = cursor_line_color })

      extend_highlight("NeogitDiffHeader", { bg = "none" })
      extend_highlight("NeogitDiffHeaderHighlight", { bg = "none" })

      extend_highlight("NeogitHunkHeader", { bg = "none" })
      extend_highlight("NeogitHunkHeaderHighlight", { bg = "none" })
      -- extend_highlight("NeogitHunkHeaderCursor", { bg = "none" })
    end,
  },
}
