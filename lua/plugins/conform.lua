return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      local new_formatters = {
        javascript = { "biome" },
        typescript = { "biome" },
        json = { "biome" },
        javascriptreact = { "biome" },
        typescriptreact = { "biome" },
        yaml = { "biome" },
        css = { "biome" },
        graphql = { "biome" },
        handlebars = { "biome" },
        less = { "biome" },
        markdown = { "biome" },
        ["markdown.mdx"] = { "biome" },
        scss = { "biome" },
        vue = { "biome" },
        html = { "biome" },
        jsonc = { "biome" },
      }

      opts.formatters.biome = {
        require_cwd = true,
      }

      for ft, formatters in pairs(new_formatters) do
        if not opts.formatters_by_ft[ft] then
          opts.formatters_by_ft[ft] = {}
        end
        opts.formatters_by_ft[ft] = vim.list_extend({ unpack(formatters) }, opts.formatters_by_ft[ft])
        opts.formatters_by_ft[ft].stop_after_first = true
      end

      return opts
    end,
  },
}
