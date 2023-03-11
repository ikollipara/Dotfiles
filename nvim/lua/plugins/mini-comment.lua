--[[
-- mini-comment.lua
-- Ian Kollipara
-- 2023.03.10
--
-- Mini Comment Configuration
--]]

return {
  "echasnovski/mini.comment",
  version = false,
  keys = {
    {"<C-_>", mode = {"n", "i", "v"}},
  },
  opts = {
    mappings = {
      comment = "<C-_>",
      comment_line = "<C-_><C-_>",
      textobject = "<C-_>"
    }
  },
  config = function (_, opts)
    require("mini.comment").setup(opts)
  end
}
