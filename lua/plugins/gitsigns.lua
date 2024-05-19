return {
  {
    -- https://github.com/LazyVim/LazyVim/blob/b0128b60bffd0d6a97ddd99af6179ebcd8a5096f/lua/lazyvim/plugins/editor.lua#L375
    "lewis6991/gitsigns.nvim",
    event = "LazyFile",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = buffer
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]h", bang = true })
          else
            gs.nav_hunk("next")
          end
        end, { desc = "Next Hunk" })

        map("n", "[h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[h", bang = true })
          else
            gs.nav_hunk("prev")
          end
        end, { desc = "Previous Hunk" })

        -- Actions
        map("n", "<leader>ghs", gs.stage_hunk, { desc = "Stage Hunk" })
        map("n", "<leader>ghr", gs.reset_hunk, { desc = "Reset Hunk" })
        map("v", "<leader>ghs", function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "Stage Hunk" })
        map("v", "<leader>ghr", function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "Reset Hunk" })
        map("n", "<leader>ghS", gs.stage_buffer, { desc = "Stage Buffer" })
        map("n", "<leader>ghu", gs.undo_stage_hunk, { desc = "Undo Stage Buffer" })
        map("n", "<leader>ghR", gs.reset_buffer, { desc = "Reset Buffer" })
        map("n", "<leader>ghp", gs.preview_hunk, { desc = "Preview Hunk" })
        map("n", "<leader>ghb", function()
          gs.blame_line({ full = true })
        end, { desc = "Blame Line" })
        map("n", "<leader>gtb", gs.toggle_current_line_blame, { desc = "Toggle Current Line Blame" })
        map("n", "<leader>ghd", gs.diffthis, { desc = "Git Diff This" })
        map("n", "<leader>ghD", function()
          gs.diffthis("~")
        end, { desc = "Git Diff This ~" })
        map("n", "<leader>gtd", gs.toggle_deleted, { desc = "Toggle Deleted" })

        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
      end,
    },
  },
}
