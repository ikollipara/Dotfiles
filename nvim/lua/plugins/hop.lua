--[[
-- hop.lua
-- Ian Kollipara
-- 2023.03.17
--
-- Hop Configuration
--]]
return {
  "phaazon/hop.nvim",
  branch = 'v2', -- optional but strongly recommended
  opts = { keys = 'etovxqpdygfblzhckisuran' },
  config = true,
  keys = {
    { "f",
      function()
        require("hop").hint_char1({
          direction = require("hop.hint").HintDirection.AFTER_CURSOR,
          current_line_only = true
        })
      end },
    { "F",
      function()
        require("hop").hint_char1({
          direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
          current_line_only = true
        })
      end },
    { "t",
      function()
        require("hop").hint_char1({
          direction = require("hop.hint").HintDirection.AFTER_CURSOR,
          current_line_only = true,
          hint_offset = -1
        })
      end },
    { "T",
      function()
        require("hop").hint_char1({
          direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
          current_line_only = true,
          hint_offset = 1
        })
      end },
  }
}
