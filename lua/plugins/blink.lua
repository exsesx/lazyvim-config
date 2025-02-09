-- NOTE: vim.g.ai_cmp is set in lua/config/options.lua

return {
  {
    "Saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "enter",
        ["<Tab>"] = {
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
      -- fuzzy = {
      --   sorts = {
      --     function(a, b)
      --       if a.source_name ~= "LSP" or b.source_name ~= "LSP" then
      --         return
      --       end
      --       local name = vim.lsp.get_client_by_id(b.client_id).name
      --       return name == "emmet_ls"
      --     end,
      --     "score",
      --     "sort_text",
      --   },
      -- },
      enabled = function()
        return vim.bo.buftype ~= "prompt"
          and vim.bo.filetype ~= "AvanteInput"
          and vim.b.completion ~= false
      end,
      completion = {
        list = { selection = { preselect = true, auto_insert = false } },
        ghost_text = {
          -- enabled = vim.g.ai_cmp,
          -- NOTE: I don't like layout being shifted all over the place
          enabled = false,
        },
        menu = {
          border = "rounded",
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
