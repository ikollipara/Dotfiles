--[[
-- tex.lua
-- Ian Kollipara
-- 2023.03.15
--
-- Tex Snippets
--]]
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s({ trig = "\\doc", desc = "New Document", snippetType = "autosnippet" }, fmt([[
  \documentclass[12pt]{{article}}

  \usepackage[backend=biber,style={},sorting=ynt]{{biblatex}}
  \addbibresource{{lib.bib}}
  \usepackage[margin=0.5cm]{{geometry}}

  \title{{{}}}
  \author{{Ian Kollipara}}
  \date{{{}}}

  \begin{{document}}
  {}
  \end{{document}}
  ]], { i(1), i(2), require("os").date("%B %e, %Y"), i(0) })),
  s({ trig = "\\begin", desc = "env", snippetType = "autosnippet" }, fmt([[
  \begin{{{a}}}
    {b}
  \end{{{a}}}
  ]], {
    a = i(1), b = i(0)
  }, {
    repeat_duplicates = true
  }))
}
