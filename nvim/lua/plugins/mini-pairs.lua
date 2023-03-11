--[[
-- mini-pairs.lua
-- Ian Kollipara
-- 2023.03.10
--
-- Mini-Pairs Configuration
--]]

return {
  "echasnovski/mini.pairs",
  event = "InsertEnter",
  config = function(_, opts)
    require("mini.pairs").setup(opts)
  end,
}
