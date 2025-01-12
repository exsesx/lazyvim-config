return {
  {
    "neovim/nvim-lspconfig",

    -- NOTE: disables lazy loading
    -- init = function()
    --   require("lspconfig.ui.windows").default_options.border = "rounded"
    -- end,

    opts = {
      servers = {
        graphql = {
          filetypes = {
            "graphql",
            "typescriptreact",
            "javascriptreact",
            "typescript",
            "javascript",
          },
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
        vtsls = {
          settings = {
            javascript = {
              -- removes annoying "File is a CommonJS module; it may be converted to an ES module" inspection
              suggestionActions = {
                enabled = false,
              },
            },
            typescript = {
              suggestionActions = {
                enabled = false,
              },
              tsserver = {
                maxTsServerMemory = 8192,
              },
              -- https://github.com/yioneko/vtsls/blob/33ab3a11a5fcb3038d10d4f47d91655683b21dbc/packages/service/configuration.schema.json
              inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = { enabled = "all" },
                parameterTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                variableTypes = { enabled = true },
              },
            },
          },
        },
        cssls = {
          settings = {
            css = {
              validate = true,
              lint = {
                unknownAtRules = "ignore",
              },
            },
            scss = {
              validate = true,
              lint = {
                unknownAtRules = "ignore",
              },
            },
            less = {
              validate = true,
              lint = {
                unknownAtRules = "ignore",
              },
            },
          },
        },
        emmet_language_server = {
          showSuggestionsAsSnippets = true,
          -- showAbbreviationSuggestions = true,
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
