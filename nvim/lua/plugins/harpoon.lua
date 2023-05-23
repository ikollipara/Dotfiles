--[[
-- harpoon.lua
-- Ian Kollipara
-- 2023.03.10
--
-- Harpoon Lua
--]]
---@param mod string
local function harpoon(mod)
    return require("harpoon." .. mod)
end

return {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
    keys = {
        { "<leader>a", function() harpoon("mark").add_file() end,        desc = "Register a Buffer in Harpoon" },
        { "<C-j>",     function() harpoon("ui").nav_next() end,          desc = "Go to Next Harpoon Buffer" },
        { "<C-k>",     function() harpoon("ui").nav_prev() end,          desc = "Go to Previous Harpoon Buffer" },
        { "<C-h>",     function() harpoon("ui").toggle_quick_menu() end, desc = "View Harpoon Buffers" }
    }
}
