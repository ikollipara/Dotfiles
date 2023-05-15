--[[
-- nvim-surround.lua
-- Ian Kollipara
-- 2023.05.15
--
-- nvim-surround Configuration
--]]

return {
  "kylechui/nvim-surround",
  keys = {
    { "ys" },
    { "S", mode = "v" },
    { "ds" },
  },
  opts = {
    fast_wrap = {}
  }
}
