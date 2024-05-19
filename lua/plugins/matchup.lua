return {
  {
    "andymass/vim-matchup",
    event = "BufReadPost",
    setup = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
}
