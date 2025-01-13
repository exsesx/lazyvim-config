local map = vim.keymap.set

map("n", "z=", function()
  require("fzf-lua").spell_suggest()
end, { desc = "Spell Suggest" })
