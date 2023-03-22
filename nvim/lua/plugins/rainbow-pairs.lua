--[[
-- rainbow-pairs.lua
-- Ian Kollipara
-- 2023.03.22
--
-- Rainbow Pairs Configuration
--]]
return {
  "mrjones2014/nvim-ts-rainbow",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter",
      config = function()
        require("nvim-treesitter.configs").setup({ rainbow = { enable = true } })
      end,
    },
  },
}
