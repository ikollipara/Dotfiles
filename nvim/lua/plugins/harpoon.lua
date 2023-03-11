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
    { "<leader>j", function() harpoon("mark").add_file() end },
    { "<C-m>",     function() harpoon("ui").nav_next() end },
    { "<C-o>",     function() harpoon("ui").nav_prev() end },
    { "<C-h>",     function() harpoon("ui").toggle_quick_menu() end }
  }
}
