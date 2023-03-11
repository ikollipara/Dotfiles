--[[
-- nvim-surround.lua
-- Ian Kollipara
-- 2023.03.10
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
