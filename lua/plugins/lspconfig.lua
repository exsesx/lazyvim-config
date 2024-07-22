return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      require("lspconfig.ui.windows").default_options.border = "rounded"
    end,
    opts = {
      servers = {
        graphql = {
          filetypes = { "graphql", "typescriptreact", "javascriptreact", "typescript", "javascript" },
        },
        lua_ls = {
          settings = {
            Lua = {
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
              hint = { enable = true },
            },
          },
        },
        -- TODO: vtsls - remove annoying "File is a CommonJS module; it may be converted to an ES module" inspection
        cssls = {
          settings = {
            css = { validate = true, lint = {
              unknownAtRules = "ignore",
            } },
            scss = { validate = true, lint = {
              unknownAtRules = "ignore",
            } },
            less = { validate = true, lint = {
              unknownAtRules = "ignore",
            } },
          },
        },
        emmet_language_server = {
          filetypes = {
            "css",
            "eruby",
            "html",
            "javascript",
            "javascriptreact",
            "less",
            "sass",
            "scss",
            "pug",
            "typescriptreact",
          },
        },
      },
    },
  },
}
