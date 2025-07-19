if vim.g.vscode then
  return
end

local mc = require("multicursor-nvim")
-- HACK: plugin: ../../plugins/multicursor.lua

-- TODO: WIP
-- URL: https://github.com/jake-stewart/multicursor.nvim

-- TODO: perhaps let's use <leader>m for multicursors?

local set = vim.keymap.set

set({ "n", "v" }, "<M-up>", function()
  mc.lineAddCursor(-1)
end, { desc = "Add cursor above" })

set({ "n", "v" }, "<M-down>", function()
  mc.lineAddCursor(1)
end, { desc = "Add cursor below" })

-- set({ "n", "v" }, "<leader><up>", function()
--   mc.lineSkipCursor(-1)
-- end, { desc = "Skip cursor above" })

-- set({ "n", "v" }, "<leader><down>", function()
--   mc.lineSkipCursor(1)
-- end, { desc = "Skip cursor below" })

-- Add or skip adding a new cursor by matching word/selection
set({ "n", "v" }, "<C-n>", function()
  mc.matchAddCursor(1)
end, { desc = "Add Matching Cursor" })

set({ "n", "v" }, "<C-x>", function()
  mc.matchSkipCursor(1)
end, { desc = "Skip Matching Cursor" })

set({ "n", "v" }, "<C-p>", function()
  mc.matchAddCursor(-1)
end)
-- set({ "n", "v" }, "<leader>S", function()
--   mc.matchSkipCursor(-1)
-- end)

-- Add all matches in the document
set({ "n", "v" }, "g<C-n>", mc.matchAllAddCursors, { desc = "Add All Matching Cursors" })

-- You can also add cursors with any motion you prefer:
-- set("n", "<right>", function()
--     mc.addCursor("w")
-- end)
-- set("n", "<leader><right>", function()
--     mc.skipCursor("w")
-- end)

-- TODO: not a bad idea actually to map it to <left>, <right>, <up> and <down>
-- Rotate the main cursor.
-- set({ "n", "v" }, "<left>", mc.nextCursor)
-- set({ "n", "v" }, "<right>", mc.prevCursor)
set({ "n", "v" }, "<leader>mn", mc.nextCursor, { desc = "Previous Cursor" })
set({ "n", "v" }, "<leader>mp", mc.prevCursor, { desc = "Next Cursor" })

-- Delete the main cursor.
set({ "n", "v" }, "<leader>mx", mc.deleteCursor, { desc = "Delete Main Cursor" })

-- Add and remove cursors with control + left click.
set("n", "<M-leftmouse>", mc.handleMouse, { desc = "Handle Cursor Addition With Mouse" })

-- Easy way to add and remove cursors using the main cursor.
-- TODO: Choose later which one is the best
set({ "n", "v" }, "<c-q>", mc.toggleCursor, { desc = "Toggle Main Cursor" })
set({ "n", "v" }, "<leader>mt", mc.toggleCursor, { desc = "Toggle Main Cursor" })

set("n", "<esc>", function()
  if not mc.cursorsEnabled() then
    mc.enableCursors()
  elseif mc.hasCursors() then
    mc.clearCursors()
  else
    vim.cmd("noh")
    LazyVim.cmp.actions.snippet_stop()
    return "<esc>"
  end
end, { desc = "Escape: Enable, Clear, or Fallback", remap = true, expr = true })

-- bring back cursors if you accidentally clear them
set("n", "<leader>gv", mc.restoreCursors, { desc = "Restore Cleared Cursors" })

-- Align cursor columns.
set("n", "<leader>ma", mc.alignCursors, { desc = "Align Cursor Columns" })

-- Append/insert for each line of visual selections.
set("v", "I", mc.insertVisual, { desc = "Insert at Start of Visual Selection" })
set("v", "A", mc.appendVisual, { desc = "Append at End of Visual Selection" })

-- match new cursors within visual selections by regex.
set("v", "M", mc.matchCursors, { desc = "Match Additional Cursors in Visual Selection" })

-- Rotate visual selection contents.
-- set("v", "<leader>mt", function()
--   mc.transposeCursors(1)
-- end, { desc = "Transpose Cursors" })
-- set("v", "<leader>mT", function()
--   mc.transposeCursors(-1)
-- end, { desc = "Transpose Cursors" })

set({ "v", "n" }, "<c-i>", mc.jumpForward, { desc = "Jump Forward" })
set({ "v", "n" }, "<c-o>", mc.jumpBackward, { desc = "Jump Backward" })
