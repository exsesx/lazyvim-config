vim.g.visual_whitespace_enabled = true

Snacks.toggle({
  name = "Visual Whitespace",
  get = function()
    return vim.g.visual_whitespace_enabled
  end,
  set = function(state)
    vim.g.visual_whitespace_enabled = not state
    require("visual-whitespace").toggle()
  end,
}):map("<leader>uv")
