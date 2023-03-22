--[[
-- neo-indent.lua
-- Ian Kollipara
-- 2023.03.22
--
-- Indent Guidelines
--]]
return {
  "lucastavaresa/simpleIndentGuides.nvim",
  config = function()
    vim.opt.list = true
    require("simpleIndentGuides").setup("│")
  end,
}
