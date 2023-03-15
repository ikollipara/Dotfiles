--[[
-- nvchad-terminal.lua
-- Ian Kollipara
-- 2023.03.14
--
-- Terminal Integration handling
--]]
return {
  "NvChad/nvterm",
  config = true,
  keys = {
    { "<C-t>", function() require("nvterm.terminal").toggle("horizontal") end, { "n", "i", "v" } },
  },
}
