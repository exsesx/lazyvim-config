return {
  {
    "neovim/nvim-lspconfig",

    -- NOTE: disables lazy loading
    -- init = function()
    --   require("lspconfig.ui.windows").default_options.border = "rounded"
    -- end,

    opts = {
      setup = {
        tailwindcss = function(_, opts)
          local tw = LazyVim.lsp.get_raw_config("tailwindcss")
          opts.filetypes = opts.filetypes or {}

          -- Add default filetypes
          vim.list_extend(opts.filetypes, tw.default_config.filetypes)

          -- Remove excluded filetypes
          --- @param ft string
          opts.filetypes = vim.tbl_filter(function(ft)
            return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
          end, opts.filetypes)

          -- Add additional filetypes
          vim.list_extend(opts.filetypes, opts.filetypes_include or {})
        end,
        -- yamlls = function(_, opts)
        --   Snacks.debug.inspect(opts.capabilities)
        --
        --   opts.capabilities = require("blink.cmp").get_lsp_capabilities({
        --     textDocument = { completion = { completionItem = { snippetSupport = false } } },
        --   })
        -- end,
      },
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
        tailwindcss = {
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  -- Original:
                  -- { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                  -- { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                  -- cva(...)
                  {
                    "cva\\(([^)(]*(?:\\([^)(]*(?:\\([^)(]*(?:\\([^)(]*\\)[^)(]*)*\\)[^)(]*)*\\)[^)(]*)*)\\)",
                    "'([^']*)'",
                  },
                  {
                    "cva\\(([^)(]*(?:\\([^)(]*(?:\\([^)(]*(?:\\([^)(]*\\)[^)(]*)*\\)[^)(]*)*\\)[^)(]*)*)\\)",
                    '"([^"]*)"',
                  },
                  {
                    "cva\\(([^)(]*(?:\\([^)(]*(?:\\([^)(]*(?:\\([^)(]*\\)[^)(]*)*\\)[^)(]*)*\\)[^)(]*)*)\\)",
                    "`([^`]*)`",
                  },
                  -- cx(...)
                  {
                    "cx\\(([^)(]*(?:\\([^)(]*(?:\\([^)(]*(?:\\([^)(]*\\)[^)(]*)*\\)[^)(]*)*\\)[^)(]*)*)\\)",
                    "'([^']*)'",
                  },
                  {
                    "cx\\(([^)(]*(?:\\([^)(]*(?:\\([^)(]*(?:\\([^)(]*\\)[^)(]*)*\\)[^)(]*)*\\)[^)(]*)*)\\)",
                    '"([^"]*)"',
                  },
                  {
                    "cx\\(([^)(]*(?:\\([^)(]*(?:\\([^)(]*(?:\\([^)(]*\\)[^)(]*)*\\)[^)(]*)*\\)[^)(]*)*)\\)",
                    "`([^`]*)`",
                  },
                  -- clsx(...)
                  {
                    "clsx\\(([^)(]*(?:\\([^)(]*(?:\\([^)(]*(?:\\([^)(]*\\)[^)(]*)*\\)[^)(]*)*\\)[^)(]*)*)\\)",
                    "'([^']*)'",
                  },
                  {
                    "clsx\\(([^)(]*(?:\\([^)(]*(?:\\([^)(]*(?:\\([^)(]*\\)[^)(]*)*\\)[^)(]*)*\\)[^)(]*)*)\\)",
                    '"([^"]*)"',
                  },
                  {
                    "clsx\\(([^)(]*(?:\\([^)(]*(?:\\([^)(]*(?:\\([^)(]*\\)[^)(]*)*\\)[^)(]*)*\\)[^)(]*)*)\\)",
                    "`([^`]*)`",
                  },
                },
              },
            },
          },
        },
        yamlls = {
          -- capabilities = {
          --   textDocument = {
          --     completion = {
          --       completionItem = {
          --         snippetSupport = false,
          --       },
          --     },
          --   },
          -- },
          settings = {
            yaml = {
              disableDefaultProperties = true,
              -- disableAdditionalProperties = true,
              format = {
                singleQuote = true,
              },
              schemas = {
                kubernetes = "k8s/**/*.yaml",
              },
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
        -- TODO: Pick harper_ls or typos_ls (or other better alternatives for spellchecking)
        --  Harper is more robust, supports markdown, etc.
        --  But typos_ls is more lightweight and has less false positives, figures out camelCase better, etc.

        -- harper_ls = {
        --   settings = {
        --     ["harper-ls"] = {
        --       userDictPath = "~/.config/harper/dict.txt",
        --       fileDictPath = "~/.config/harper/",
        --       -- isolateEnglish = true,
        --       -- diagnosticSeverity = "hint", -- Can also be "information", "warning", or "error"
        --       linters = {
        --         spell_check = true,
        --         spelled_numbers = false,
        --         an_a = true,
        --         sentence_capitalization = false,
        --         unclosed_quotes = true,
        --         wrong_quotes = false,
        --         long_sentences = true,
        --         repeated_words = true,
        --         spaces = true,
        --         matcher = true,
        --         correct_number_suffix = true,
        --         number_suffix_capitalization = true,
        --         multiple_sequential_pronouns = true,
        --         linking_verbs = false,
        --         avoid_curses = true,
        --         terminating_conjunctions = true,
        --       },
        --     },
        --   },
        -- },
        typos_lsp = {
          init_options = {
            -- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification
            -- Error | Warning | Information | Hint
            diagnosticSeverity = "Hint",
          },
        },
        -- emmet_language_server = {
        --   showSuggestionsAsSnippets = true,
        --   -- showAbbreviationSuggestions = true,
        --   filetypes = {
        --     "css",
        --     "eruby",
        --     "html",
        --     "javascript",
        --     "javascriptreact",
        --     "less",
        --     "sass",
        --     "scss",
        --     "pug",
        --     "typescriptreact",
        --   },
        -- },
      },
    },
  },
}
