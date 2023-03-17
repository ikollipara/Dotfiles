--[[
-- initializer.lua
-- Ian Kollipara
-- 2023.03.17
--
-- Init Files
--]]
local M = {}

---@class InitOpts
---@field mapleader string
---@field loadNetrw boolean

--- Set the initial options
---@param t InitOpts
function M:opts(t)
  vim.g.mapleader = t.mapleader
  if not t.loadNetrw then
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end
  return self
end

function M:begin()
  require("modules.lazy")
      :setup()
      :load_("plugins")
  require("core.keymaps")
  require("core.options")
  return self
end

return M
