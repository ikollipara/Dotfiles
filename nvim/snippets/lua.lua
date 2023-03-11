--[[
-- lua.lua
-- Ian Kollipara
-- 2023.03.10
--
-- Lua Snippets
--]]
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node


return {
  s({ trig = "--h", desc = "File Header", snippetType = "autosnippet" }, {
    t {
      "--[[",
      "-- " .. vim.fn.expand("%:t"),
      "-- Ian Kollipara",
      "-- " .. require("os").date("%Y.%m.%d"),
      "--",
      "-- "
    },
    i(1),
    t {
      "",
      "--]]",
      "",
      ""
    },
    i(0)
  }),
  s({ trig = "func", desc = "Function Declaration", snippetType = "autosnippet" }, {
    t("function "), i(1), t("("), i(2), t { ")",
    "  " }, i(0), t { "",
    "end" }
  }),
  s({ trig = "lmod", desc = "Lua Module", snippetType = "autosnippet" }, {
    t {
      "local M = {}",
      "",
      "" }, i(0), t { "",
    "",
    "return M" }
  })
}
