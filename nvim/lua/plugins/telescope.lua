--[[
-- telescope.lua
-- Ian Kollipara
-- 2023.03.10
--
-- Telescope Configuration
--]]
return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  keys = {
    { "<leader><space>", "<cmd>Telescope find_files<cr>" },
  },
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = true
}