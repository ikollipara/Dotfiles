--[[
-- trouble.lua
-- Ian Kollipara
-- 2023.03.10
--
-- Trouble Configuration
--]]
--
return {
  "folke/trouble.nvim",
  dependecies = { "nvim-tree/nvim-web-devicons" },
  config = true,
  keys = {
    { "<leader>cdd", "<cmd>Trouble document_diagnostics<cr>" },
    { "<leader>cdw", "<cmd>Trouble workspace_diagnostics<cr>" }
  }
}
