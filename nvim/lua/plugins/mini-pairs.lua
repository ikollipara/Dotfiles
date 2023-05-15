-----------------------------
-- mini-pairs.lua
-- Ian Kollipara
-- 2023.05.15
--
-- Mini-Pairs Configuration
-----------------------------

return {
  "echasnovski/mini.pairs",
  event = "InsertEnter",
  config = function(_, opts) 
      require("mini.pairs").setup(opts)
  end
}
