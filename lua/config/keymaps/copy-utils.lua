local map = vim.keymap.set

-- NOTE: copy file reference path and paste
-- handy tool, especially with lewis6991/fileline.nvim (../../plugins/fileline.lua)

map("n", "<leader>xa", function()
  local file = vim.fn.expand("%:p")
  local line = vim.fn.line(".")
  local text = file .. ":" .. line
  vim.fn.setreg("+", text)
  vim.notify("Copied absolute path: " .. text, vim.log.levels.INFO)
end, { desc = "Copy absolute file path and line number to clipboard" })

map("n", "<leader>xy", function()
  local file = vim.fn.expand("%:.")
  local line = vim.fn.line(".")
  local text = file .. ":" .. line

  vim.fn.setreg("+", text)
  vim.notify("Copied: " .. text, vim.log.levels.INFO)
end, { desc = "Copy file path and line number to clipboard" })

map("n", "<leader>xp", function()
  local input = vim.fn.getreg("+")
  if input == "" then
    vim.notify("Clipboard is empty", vim.log.levels.ERROR)
    return
  end
  local lnum = input:match(":(%d+)$")
  local filepath = lnum and input:sub(1, #input - #lnum - 1) or input
  if vim.fn.filereadable(filepath) == 1 or vim.fn.isdirectory(filepath) == 1 then
    vim.cmd("edit " .. vim.fn.fnameescape(filepath))
    if lnum then
      vim.api.nvim_win_set_cursor(0, { tonumber(lnum), 0 })
    end
  else
    vim.notify("Invalid file or directory: " .. filepath, vim.log.levels.ERROR)
  end
end, { noremap = true, desc = "Go to location in clipboard" })

local function copy_path_picker()
  local opts = {
    "Absolute path with line number",
    "Absolute path without line number",
    "Relative path with line number",
    "Relative path without line number",
  }
  vim.ui.select(opts, { prompt = "Select copy path option:" }, function(choice)
    if not choice then
      return
    end
    local file, text
    local line = vim.fn.line(".")
    if choice == opts[1] then
      file = vim.fn.expand("%:p")
      text = file .. ":" .. line
      vim.notify("Copied absolute path with line number: " .. text, vim.log.levels.INFO)
    elseif choice == opts[2] then
      file = vim.fn.expand("%:p")
      text = file
      vim.notify("Copied absolute path: " .. text, vim.log.levels.INFO)
    elseif choice == opts[3] then
      file = vim.fn.expand("%:.")
      text = file .. ":" .. line
      vim.notify("Copied relative path with line number: " .. text, vim.log.levels.INFO)
    elseif choice == opts[4] then
      file = vim.fn.expand("%:.")
      text = file
      vim.notify("Copied relative path: " .. text, vim.log.levels.INFO)
    end
    vim.fn.setreg("+", text)
  end)
end

map("n", "<leader>xc", copy_path_picker, { desc = "Picker for copy file path options" })
vim.api.nvim_create_user_command(
  "CopyFilePathPicker",
  copy_path_picker,
  { desc = "Picker for copy file path options" }
)
