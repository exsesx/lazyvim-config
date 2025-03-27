if vim.g.vscode then
  return
end

local function create_scratch_buffer(lines, name, ft)
  local buf = vim.api.nvim_get_current_buf()

  vim.bo[buf].buftype = "nofile"
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].swapfile = false
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.bo[buf].filetype = ft or ""
  vim.api.nvim_buf_set_name(buf, name)

  return buf
end

local function diff_clipboard(opts)
  local current_line = vim.fn.line(".")
  local start_line = opts.line1 or current_line
  local end_line = opts.line2 or current_line

  if start_line == current_line and end_line == current_line then
    start_line = 1
    end_line = vim.fn.line("$")
  end

  local sel_lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
  local ft = vim.bo.filetype

  local clip_text = vim.fn.getreg("+")
  local clip_lines = vim.split(clip_text, "\n")

  if clip_lines[#clip_lines] == "" then
    table.remove(clip_lines)
  end

  clip_lines = vim.tbl_map(function(line)
    return line:gsub("\r", "")
  end, clip_lines)

  vim.cmd("tabnew")
  create_scratch_buffer(clip_lines, "DiffClipboard: Clipboard", ft)
  vim.cmd("vnew")
  create_scratch_buffer(sel_lines, "DiffClipboard: Selection", ft)

  vim.cmd("diffthis")
  vim.cmd("wincmd h")
  vim.cmd("diffthis")
end

vim.api.nvim_create_user_command("DiffClipboard", diff_clipboard, { range = true })

-- mappings: ../keymaps/git.lua
