return {
  -- { import = "lazyvim.plugins.extras.ai.copilot" },
  -- {
  --   "giuxtaposition/blink-cmp-copilot",
  --   enabled = false,
  -- },
  {
    "Saghen/blink.cmp",
    -- https://github.com/LazyVim/LazyVim/pull/5551 - new copilot module
    -- dependencies = {
    --   "fang2hou/blink-copilot",
    -- },
    opts = {
      sources = {
        -- TODO: https://github.com/kristijanhusak/vim-dadbod-completion/commit/1de1216
        -- SQL extra doesn't reflect that yet
        per_filetype = {
          sql = { "snippets", "dadbod", "buffer" },
        },
        -- providers = {
        --   copilot = {
        --     module = "blink-copilot",
        --   },
        -- },
      },
      keymap = {
        preset = "enter",
        ["<Tab>"] = {
          -- function(cmp)
          --   if vim.b[vim.api.nvim_get_current_buf()].nes_state then
          --     cmp.hide()
          --     return (
          --       require("copilot-lsp.nes").apply_pending_nes()
          --       and require("copilot-lsp.nes").walk_cursor_end_edit()
          --     )
          --   end
          --
          --   return false
          -- end,
          LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
          function(cmp)
            -- NOTE: Inspired by - https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#confirm-candidate-on-tab-immediately-when-theres-only-one-completion-entry
            local completion_list = require("blink.cmp.completion.list")

            -- XXX: include AI (copilot) in this case?
            local non_snippet_items = vim.tbl_filter(function(item)
              return item.source_id ~= "snippets"
            end, completion_list.items)

            local count = #non_snippet_items

            local entry = cmp.get_selected_item() or {}

            if count == 1 and entry.detail == "Emmet Abbreviation" then
              return cmp.select_and_accept()
            end

            return false
          end,
          "select_next",
          "fallback",
        },
        ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
      },
      fuzzy = {
        sorts = {
          -- NOTE: Deprioritize Emmet Language Server
          -- function(a, b)
          --   if a.source_name ~= "LSP" or b.source_name ~= "LSP" then
          --     return
          --   end
          --
          --   local client_a = vim.lsp.get_client_by_id(a.client_id)
          --   local client_b = vim.lsp.get_client_by_id(b.client_id)
          --   if not client_a or not client_b then
          --     return
          --   end
          --
          --   local name_a = client_a.name
          --   local name_b = client_b.name
          --
          --   if name_a == "emmet_language_server" and name_b ~= "emmet_language_server" then
          --     return false
          --   elseif name_a ~= "emmet_language_server" and name_b == "emmet_language_server" then
          --     return true
          --   else
          --     return nil
          --   end
          -- end,
          "exact",
          "score",
          "sort_text",
        },
      },
      completion = {
        keyword = {
          range = "prefix",
        },
        list = { selection = { preselect = true, auto_insert = false } },
        ghost_text = {
          -- enabled = vim.g.ai_cmp,
          enabled = false,
        },
        menu = {
          border = "rounded",
          draw = {
            columns = {
              { "kind_icon", "label", "label_description", gap = 1 },
              { "kind", gap = 1 },
            },
            components = {
              kind_icon = {
                ellipsis = false,
                text = function(ctx)
                  local kind_icon, _, is_default = require("mini.icons").get("lsp", ctx.kind)

                  if is_default and ctx.kind_icon then
                    return ctx.kind_icon
                  end

                  return kind_icon
                end,
                highlight = function(ctx)
                  local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                  return hl
                end,
              },
            },
          },
        },
        documentation = {
          window = {
            border = "rounded",
          },
        },
      },
    },
  },
}
