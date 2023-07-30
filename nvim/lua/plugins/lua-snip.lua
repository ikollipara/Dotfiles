return {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    event = "InsertEnter",
    keys = {
        {
            "<tab>",
            function()
                return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
            end,
            expr = true,
            silent = true,
            mode = "i",
        },
        { "<tab>",   function() require("luasnip").jump(1) end,  mode = "s" },
        { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
}
