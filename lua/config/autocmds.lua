-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local autocmds_dir = vim.fn.stdpath("config") .. "/lua/config/autocmds"
local files = vim.fn.globpath(autocmds_dir, "*.lua", false, true)

for _, file in ipairs(files) do
  local module_name = file:match("([^/]+)%.lua$")
  require("config.autocmds." .. module_name)
end
