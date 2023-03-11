--[[
-- keymaps.lua
-- Ian Kollipara
-- 2023.03.10
--
-- Extra Keymaps
--]]
local mapper = require("modules.mapper")

mapper.visual {
  { lhs = "J", rhs = ":m '>+1<CR>gv=gv" },
  { lhs = "K", rhs = ":m '<-2<CR>gv=gv" }
}
