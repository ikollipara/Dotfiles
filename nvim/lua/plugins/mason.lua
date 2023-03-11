--[[
-- mason.lua
-- Ian Kollipara
-- 2023.03.10
--
-- Mason Configuration
--]]

return {
  "williamboman/mason.nvim",
  keys = {
    { "<leader>cm", "<cmd>Mason<cr>", desc = "Open Mason" },
  },
  cmd = "Mason",
  config = true
}
