--[[
-- symbols.lua
-- Ian Kollipara
-- 2023.03.10
--
-- Symbols Configuration
--]]
return {
  "simrat39/symbols-outline.nvim",
  config = function()
    require("symbols-outline").setup({})
  end,
  keys = {
    { "<leader>ps", "<cmd>SymbolsOutline<cr>" }
  }
}
