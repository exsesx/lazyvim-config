local Snacks = require("snacks")
-- FIXME: disables lazy loading
-- local copilot_exists = pcall(require, "copilot")

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
