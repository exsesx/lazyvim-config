local utils = require("neo-tree.utils")

return {
  "nvim-neo-tree/neo-tree.nvim",
  optional = true,
  opts = {
    default_component_configs = {
      icon = {
        provider = function(icon, node)
          local text, hl
          local mini_icons = require("mini.icons")
          if node.type == "file" then
            text, hl = mini_icons.get("file", node.name)
          elseif node.type == "directory" then
            text, hl = mini_icons.get("directory", node.name)
            if node:is_expanded() then
              text = nil
            end
          end

          if text then
            icon.text = text
          end
          if hl then
            icon.highlight = hl
          end
        end,
      },
      kind_icon = {
        provider = function(icon, node)
          icon.text, icon.highlight = require("mini.icons").get("lsp", node.extra.kind.name)
        end,
      },
    },
    filesystem = {
      window = {
        mappings = {
          ["d"] = "delete",
          ["D"] = "trash",
          ["L"] = {
            function(state)
              vim.fn.system({ "qlmanage", "-p", vim.fn.fnameescape(state.tree:get_node().path) })
            end,
            desc = "Quick Look",
          },
          ["Z"] = "expand_all_nodes",
        },
      },
      commands = {
        trash = function(state)
          local inputs = require("neo-tree.ui.inputs")
          local path = state.tree:get_node().path
          local _, name = utils.split_path(path)

          local msg = string.format("Are you sure you want to trash '%s'?", name)

          inputs.confirm(msg, function(confirmed)
            if not confirmed then
              return
            end

            vim.fn.system({ "trash", vim.fn.fnameescape(path) })

            require("neo-tree.sources.manager").refresh(state.name)
          end)
        end,

        trash_visual = function(state, selected_nodes)
          local inputs = require("neo-tree.ui.inputs")
          local msg = "Are you sure you want to trash " .. #selected_nodes .. " files ?"

          inputs.confirm(msg, function(confirmed)
            if not confirmed then
              return
            end
            for _, node in ipairs(selected_nodes) do
              vim.fn.system({ "trash", vim.fn.fnameescape(node.path) })
            end

            require("neo-tree.sources.manager").refresh(state.name)
          end)
        end,

        open_visual = function(_, selected_nodes)
          for _, node in ipairs(selected_nodes) do
            if node.type == "file" then
              vim.cmd("edit " .. vim.fn.fnameescape(node.path))
            end
          end
        end,
      },
    },
  },
}
