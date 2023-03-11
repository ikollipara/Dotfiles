--[[
-- tokyonight.lua
-- Ian Kollipara
-- 2023.03.10
--
-- Tokyo Night Colorscheme Configuration
--]]

return {
  "folke/tokyonight.nvim",
  priority = 1000,
  lazy = true,
  opts = {
    style = "moon",
    sidebars = {
      "lazy",
    }
  },
  config = function (_, opts)
    require("tokyonight").setup(opts)
    vim.cmd [[ colorscheme tokyonight ]]
  end
}
