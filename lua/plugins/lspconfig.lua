return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = true,
      },
      codelens = {
        enabled = true,
      },
      servers = {
        ocamllsp = {
          cmd = { "ocamllsp" },
          filetypes = { "ocaml", "menhir", "ocamlinterface", "ocamllex", "reason", "dune" },
          root_dir = require("lspconfig").util.root_pattern(
            "*.opam",
            "esy.json",
            "package.json",
            ".git",
            "dune-project",
            "dune-workspace"
          ),
        },
      },
    },
  },
}
