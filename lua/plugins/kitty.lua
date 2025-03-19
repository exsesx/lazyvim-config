return {
  {
    "mikesmithgh/kitty-scrollback.nvim",
    enabled = true,
    lazy = true,
    cmd = {
      "KittyScrollbackGenerateKittens",
      "KittyScrollbackCheckHealth",
      "KittyScrollbackGenerateCommandLineEditing",
    },
    event = { "User KittyScrollbackLaunch" },
    -- version = '*', -- latest stable version, may have breaking changes if major version changed
    -- version = '^6.0.0', -- pin major version, include fixes and features that do not have breaking changes
    config = function()
      ---@type table<string, KsbOpts|fun(KsbKittyData):KsbOpts>
      require("kitty-scrollback").setup({
        {
          status_window = {
            -- boolean If true, show status window in upper right corner of the screen
            enabled = true,
            -- boolean If true, use plaintext instead of nerd font icons
            style_simple = false,
            -- boolean If true, close the status window after kitty-scrollback.nvim is ready
            autoclose = false,
            -- boolean If true, show a timer in the status window while kitty-scrollback.nvim is loading
            show_timer = false,
            -- KsbStatusWindowIcons? Icons displayed in the status window
            icons = {
              -- string kitty status window icon
              -- kitty = "",
              -- string heart string heart status window icon
              heart = "", -- variants 󰣐 |  |  | ♥ |  | 󱢠 | 
              -- string nvim status window icon
              -- nvim = "", -- variants  |  |  | 
            },
          },
        },
      })
    end,
  },
}
