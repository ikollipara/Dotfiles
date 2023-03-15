--[[
-- nvim-tree.lua
-- Ian Kollipara
-- 2023.03.14
--
-- nvim-tree.lua
--]]
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  event = "VimEnter",
  opts = {},
  keys = {
    { "<leader>pt", "<cmd>NvimTreeToggle<cr>" },
    { "<C-i>",      "<cmd>NvimTreeFocus<cr>", { "i" } }
  }
}
