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
        tsserver = {
          init_options = {
            preferences = {
              disableSuggestions = true,
            },
          },
          settings = {
            noErrorTruncation = true,
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
        -- ocamllsp = {
        --   cmd = { "ocamllsp" },
        --   filetypes = { "ocaml", "menhir", "ocamlinterface", "ocamllex", "reason", "dune" },
        --   root_dir = require("lspconfig").util.root_pattern(
        --     "*.opam",
        --     "esy.json",
        --     "package.json",
        --     ".git",
        --     "dune-project",
        --     "dune-workspace"
        --   ),
        -- },
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
          -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
          -- **Note:** only the options listed in the table are supported.
          -- init_options = {
          --   ---@type table<string, string>
          --   includeLanguages = {},
          --   --- @type string[]
          --   excludeLanguages = {},
          --   --- @type string[]
          --   extensionsPath = {},
          --   --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
          --   preferences = {},
          --   --- @type boolean Defaults to `true`
          --   showAbbreviationSuggestions = true,
          --   --- @type "always" | "never" Defaults to `"always"`
          --   showExpandedAbbreviation = "always",
          --   --- @type boolean Defaults to `false`
          --   showSuggestionsAsSnippets = false,
          --   --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
          --   syntaxProfiles = {},
          --   --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
          --   variables = {},
          -- },
        },
      },
    },
  },
}
