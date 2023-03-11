--[[
-- navigator.lua
-- Ian Kollipara
-- 2023.03.10
--
-- Navigator Configuration
--]]
return {
  "numToStr/Navigator.nvim",
  config = true,
  keys = {
    { "<A-h>", "<cmd>NavigatorLeft<cr>",  mode = { "n", "t", "i" } },
    { "<A-j>", "<cmd>NavigatorDown<cr>",  mode = { "n", "t", "i" } },
    { "<A-k>", "<cmd>NavigatorUp<cr>",    mode = { "n", "t", "i" } },
    { "<A-l>", "<cmd>NavigatorRight<cr>", mode = { "n", "t", "i" } },
  }
}
