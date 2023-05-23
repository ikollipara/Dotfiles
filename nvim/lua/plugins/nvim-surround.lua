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
        { "ys", desc = "+s" },
        { "S",  mode = "v", desc = "+s" },
        { "ds", desc = "-s" },
    },
    opts = {
        fast_wrap = {}
    }
}
