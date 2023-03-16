--[[
-- python.lua
-- Ian Kollipara
-- 2023.03.16
--
-- Python Snippets
--]]
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s({ trig = "###", desc = "File Header", snippetType = "autosnippet" }, fmt([[
  """
  {}
  Ian Kollipara
  {}

  {}
  """

  # Imports
  {}

  {}
  ]], { f(function(_, _, _)
    return vim.fn.expand("%:t")
  end), require("os").date("%Y.%m.%d"), i(1), i(2), i(0) })),
  s({ trig = "def", desc = "Function Def", snippetType = "autosnippet" }, fmt([[
  def {}({}:{}) -> {}:
      {}
  ]], { i(1), i(2), i(3), i(4), i(0) })),
  s({ trig = "mdef", desc = "Method Def", snippetType = "autosnippet" }, fmt([[
  def {}(self, {}:{}) -> {}:
      {}
  ]], { i(1), i(2), i(3), i(4), i(0) })),
}
