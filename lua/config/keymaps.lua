-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymaps_dir = vim.fn.stdpath("config") .. "/lua/config/keymaps"
local files = vim.fn.globpath(keymaps_dir, "*.lua", false, true)

for _, file in ipairs(files) do
  local module_name = file:match("([^/]+)%.lua$")
  require("config.keymaps." .. module_name)
end
