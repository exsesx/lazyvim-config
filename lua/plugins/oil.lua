return {
  {
    "stevearc/oil.nvim",
    lazy = true,
    cmd = "Oil",
    opts = {
      default_file_explorer = false,
      watch_for_changes = true,
      delete_to_trash = true,
    },
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
  },
}
