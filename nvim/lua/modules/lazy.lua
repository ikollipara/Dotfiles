--[[
-- lazy.lua
-- Ian Kollipara
-- 2023.03.10
--
-- Lazy Configuration
--]]
local M = {}

function M:setup()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)

  return self
end

---@param pluginDir string
function M:load_(pluginDir)
  require("lazy").setup(pluginDir)
  require("tokyonight").load()

  return self
end

return M
