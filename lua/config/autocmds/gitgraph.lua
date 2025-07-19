if vim.g.vscode then
  return
end

local cmd = vim.api.nvim_create_autocmd

cmd("FileType", {
  pattern = {
    "gitgraph",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", function()
      Snacks.bufdelete({ force = true })
    end, { buffer = event.buf, silent = true })
  end,
})
