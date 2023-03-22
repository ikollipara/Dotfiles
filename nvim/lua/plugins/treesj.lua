--[[
-- treesj.lua
-- Ian Kollipara
-- 2023.03.22
--
-- TreeSJ Configuration
--]]
return {
  "Wansmer/treesj",
  keys = { { "<space>m", "<cmd>TSJToggle<cr>" } },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("treesj").setup({ --[[ your config ]]
    })
  end,
}
