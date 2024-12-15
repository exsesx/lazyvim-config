local map = vim.keymap.set

map("n", "+", function()
  require("dial.map").manipulate("increment", "normal")
end, { desc = "Increment" })

map("n", "-", function()
  require("dial.map").manipulate("decrement", "normal")
end, { desc = "Decrement" })

map("n", "g+", function()
  require("dial.map").manipulate("increment", "gnormal")
end, { desc = "Increment" })

map("n", "g-", function()
  require("dial.map").manipulate("decrement", "gnormal")
end, { desc = "Decrement" })

map("v", "+", function()
  require("dial.map").manipulate("increment", "visual")
end, { desc = "Increment" })

map("v", "-", function()
  require("dial.map").manipulate("decrement", "visual")
end, { desc = "Decrement" })

map("v", "g+", function()
  require("dial.map").manipulate("increment", "gvisual")
end, { desc = "Increment" })

map("v", "g-", function()
  require("dial.map").manipulate("decrement", "gvisual")
end, { desc = "Decrement" })
