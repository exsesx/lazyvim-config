if vim.g.vscode then
  return
end

local Snacks = require("snacks")

-- FIXME: Copilot LSP next edit suggestion stops working if disabled and enabled again
-- Find a way to restart native copilot LSP

-- if copilot_exists then
Snacks.toggle({
  name = "Copilot Completion",
  icon = "",
  color = {
    enabled = "azure",
    disabled = "orange",
  },
  get = function()
    return not require("copilot.client").is_disabled()
  end,
  set = function(state)
    if state then
      require("copilot.command").enable()
    else
      require("copilot.command").disable()
    end
  end,
}):map("<leader>a<Tab>")
-- end
