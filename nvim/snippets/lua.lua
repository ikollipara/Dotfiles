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
local fmt = require("luasnip.extras.fmt").fmt
local extras = require("luasnip.extras")
local string = require("string")


return {
    s({ trig = "--h", desc = "File Header", snippetType = "autosnippet" }, {
        f(function(args, _, _)
            return string.rep("--", string.len(args[1][1]))
        end, { 1 }, {}),
        t {
            "",
            "-- ",
        }, extras.partial(vim.fn.expand, "%:t"),
        t {
            "",
            "-- Ian Kollipara",
            "-- " .. require("os").date("%Y.%m.%d"),
            "--",
            "-- "
        },
        i(1),
        t {
            "",
            "",
        },
        f(function(args, _, _)
            return string.rep("--", string.len(args[1][1]))
        end, { 1 }, {}),
        t {
            "",
            "",
        },
        i(0)
    }),
    s({ trig = "func", desc = "Function Declaration", snippetType = "autosnippet" },
        fmt([[
    function {}({})
      {}
    end
    ]], { i(1), i(2), i(0) })
    ),
    s({ trig = "lmod", desc = "Lua Module", snippetType = "autosnippet" },
        fmt([[
    local M = {{}}

    {}

    return M
    ]], { i(0) }))
}
