------------------------------
-- symbols-outline.lua
-- Ian Kollipara
-- 2023.05.25
--
-- symbols outline
------------------------------

return {
    "simrat39/symbols-outline.nvim",
    event = { "LspAttach" },
    opts = {
        relative_width = false,
    },
    keys = {
        {
            "<leader>ps",
            ":SymbolsOutline<cr>",
            desc = "Toggle Symbols Outline",
        },
    },
}
