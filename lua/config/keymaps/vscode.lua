if not vim.g.vscode then
  return
end

local vscode = require("vscode")

local map = vim.keymap.set
-- local del = vim.keymap.del

map("n", "<leader>ghp", function()
  vscode.action("editor.action.dirtydiff.next")
end, { desc = "Preview hunk" })

map("n", "[h", function()
  vscode.action("workbench.action.editor.previousChange")
end, { desc = "Next hunk" })

map("n", "]h", function()
  vscode.action("workbench.action.editor.nextChange")
end, { desc = "Next hunk" })

map({ "n", "v" }, "<leader>ghr", function()
  vscode.action("git.revertSelectedRanges")
end)

map({ "n" }, "<leader>ghd", function()
  vscode.action("git.openChange")
end)

map("n", "<leader>bd", function()
  vscode.action("workbench.action.closeActiveEditor")
end)

map("n", "]d", function()
  vscode.action("editor.action.marker.next")
end)

map("n", "[d", function()
  vscode.action("editor.action.marker.prev")
end)

map("n", "]]", function()
  vscode.action("editor.action.wordHighlight.next")
end)

map("n", "[[", function()
  vscode.action("editor.action.wordHighlight.prev")
end)

map("n", "<leader>cr", function()
  vscode.action("editor.action.rename")
end)

map("n", "<leader>lr", function()
  vscode.action("editor.action.rename")
end)

map("n", "<leader>lf", function()
  vscode.action("editor.action.formatDocument")
end)

map("n", "<leader>e", function()
  vscode.action("workbench.view.explorer")
end)

map("n", "<leader>ss", function()
  vscode.action("workbench.action.gotoSymbol")
end)

map("n", "<leader>sS", function()
  vscode.action("workbench.action.showAllSymbols")
end)
