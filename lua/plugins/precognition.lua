return {
  "tris203/precognition.nvim",
  keys = {
    {
      "<leader>uP",
      function()
        require("precognition").toggle()
      end,
      desc = "Toggle Precognition",
    },
  },
  opts = {
    startVisible = false,
    showBlankVirtLine = true,
    disabled_fts = {
      "dashboard",
    },
  },
}
