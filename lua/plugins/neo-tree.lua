local utils = require("neo-tree.utils")

return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      window = {
        mappings = {
          ["d"] = "delete",
          ["D"] = "trash",
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
