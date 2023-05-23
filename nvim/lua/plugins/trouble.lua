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
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = true,
    keys = {
        { "<leader>cdd", "<cmd>Trouble document_diagnostics<cr>",  desc = "View Buffer Diagnostics" },
        { "<leader>cdw", "<cmd>Trouble workspace_diagnostics<cr>", desc = "View Workspace Diagnostics" }
    }
}
