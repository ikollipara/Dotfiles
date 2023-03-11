--[[
-- neogit.lua
-- Ian Kollipara
-- 2023.03.10
--
-- Neogit Configuration
--]]

return {
  "TimUntersberger/Neogit",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = true,
  keys = {
    {"<leader>g", "<cmd>Neogit<cr>", desc = "Open Neogit"}
  },
}
