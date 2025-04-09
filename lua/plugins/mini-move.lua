return {
  "echasnovski/mini.move",
  opts = {
    mappings = {
      -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
      left = "<A-S-Left>",
      right = "<A-S-Right>",
      down = "<A-S-Down>",
      up = "<A-S-Up>",

      -- Move current line in Normal mode
      -- NOTE: yanky would get in the way of < and > remaps

      -- line_left = "<A-S-Left>",
      -- line_right = "<A-S-Right>",

      -- NOTE: messes with the default behavior of < and >
      -- line_left = "<",
      -- line_right = ">",
      line_down = "<A-S-Down>",
      line_up = "<A-S-Up>",
    },

    -- Options which control moving behavior
    options = {
      -- Automatically reindent selection during linewise vertical move
      reindent_linewise = true,
    },
  },
}
